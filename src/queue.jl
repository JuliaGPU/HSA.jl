const queue_by_id = Dict{Uint32, WeakRef}()

export QueueTypeSingle, QueueTypeMulti

const QueueTypeSingle = HSA_QUEUE_TYPE_SINGLE
const QueueTypeMulti = HSA_QUEUE_TYPE_MULTI

export Queue

type Queue
    handle :: Ptr{hsa_queue_t}
    is_active :: Bool

    typ :: hsa_queue_type_t
    features :: hsa_queue_feature_t
    base_address :: Uint64
    doorbell_signal :: Signal
    size :: Uint32
    id :: Uint32
    service_queue :: Nullable{Queue}
	error_callback :: Nullable{Function}

    function Queue(q_ptr :: Ptr{hsa_queue_t})
        assert_runtime_alive()

		if q_ptr == C_NULL
            error("invalid queue pointer")
        end

        q_id = queue_info_id(q_ptr)

        # check for an existing wrapper object
        if haskey(queue_by_id, q_id)
            existing = queue_by_id[q_id].value

            if existing != nothing
               return existing :: Queue
            end
        end

        # there is no existing wrapper for this queue
        # -> construct a new one
        q_typ = queue_info_type(q_ptr)
        q_feat = queue_info_features(q_ptr)
        q_base = queue_info_base_address(q_ptr)
        q_bell = Signal(queue_info_doorbell_signal(q_ptr))
        q_size = queue_info_size(q_ptr)

        q = new(q_ptr, true, q_typ, q_feat, q_base, q_bell, q_size, q_id, nothing, nothing)

        finalizer(q, queue_destroy)

        queue_by_id[q_id] = WeakRef(q)

        # retrieve reference to the service queue, if any
        svc_q_ptr = queue_info_service_queue(q_ptr)
        if svc_q_ptr != C_NULL
            q.service_queue = Queue(svc_q_ptr)
        end

        return q
    end
end

function Queue(a :: Agent, size;
    typ :: hsa_queue_type_t = HSA_QUEUE_TYPE_SINGLE,
    error_callback = Nullable{Function}(),
    service_queue = Nullable{Queue}())
    size = convert(Uint32, size)
	assert_runtime_alive()

    h = HSA.queue_create(a, size, typ, register_callback = !isnull(Nullable{Function}(error_callback)), service_queue = Nullable{Queue}(service_queue))

    queue = Queue(h)
	queue.error_callback = error_callback

	return queue
end

function queue_err_cb(status :: hsa_status_t, queue_ptr :: Ptr{hsa_queue_t})
	if queue_ptr == C_NULL
		error("null queue ptr passed to error callback")
	end

	queue = Queue(queue_ptr)

	cb = queue.error_callback
	if !isnull(cb)
		cb.value(status, queue)
	end

	return
end

const queue_err_cb_ptr = cfunction(queue_err_cb, Void, (hsa_status_t, Ptr{hsa_queue_t}))

function queue_create(a :: Agent, size :: Uint32, typ :: hsa_queue_type_t;
	register_callback :: Bool = false,
	service_queue = Nullable{Queue}())
    res = Ptr{hsa_queue_t}[C_NULL]
    cb_ptr = (register_callback) ? C_NULL : queue_err_cb_ptr
    sq_ptr = (isnull(service_queue)) ? C_NULL : service_queue.value.handle

    err = ccall((:hsa_queue_create, libhsa), hsa_status_t, (hsa_agent_t, Uint32, hsa_queue_type_t, Ptr{Void}, Ptr{hsa_queue_t}, Ptr{Ptr{hsa_queue_t}}),
                a.handle, size, typ, cb_ptr, sq_ptr, res)

    test_status(err)

    return res[1]
end

function queue_destroy(q :: Queue)
	if q.handle != C_NULL
		queue_destroy(q.handle)
		q.handle = C_NULL
		q.is_active = false
    end
end

# Getters

function queue_idx_getters()
    const queue_getters = Symbol[
        :hsa_queue_load_read_index,
        :hsa_queue_load_write_index
        ]

    function getter_code(c_fun)
        c_fun = Expr(:quote, c_fun)
        :(ccall(($c_fun, libhsa), hsa_status_t, (Ptr{hsa_queue_t},), q))
    end

    for getter in queue_getters
        name = symbol(getter_name(getter))
        name_relaxed = symbol(getter, :_relaxed)
        getter_relaxed = getter_code(name_relaxed)
        name_acquire = symbol(getter, :_acquire)
        getter_acquire = getter_code(name_acquire)

        getter_impl = quote
            function $name(q; relaxed::Bool = false)
                if relaxed
                    $getter_relaxed
                else
                    $getter_acquire
                end
            end
        end

        eval(getter_impl)
    end
end
queue_idx_getters()

function queue_destroy(q_ptr :: Ptr{hsa_queue_t})
    if q_ptr != C_NULL
        err = ccall((:hsa_queue_destroy, libhsa), hsa_status_t, (Ptr{hsa_queue_t},),
              q_ptr)
        test_status(err)
    end
end

function queue_inactivate(q::Queue)
    queue_inactivate(unsafe_convert(Ptr{hsa_queue_t}, q))
    q.is_active = false
end

function queue_inactivate(q_ptr :: Ptr{hsa_queue_t})
    if q_ptr != C_NULL
        err = ccall((:hsa_queue_inactivate, libhsa), hsa_status_t, (Ptr{hsa_queue_t},),
                    q_ptr)
        test_status(err)

    end
end

import Base.unsafe_convert

unsafe_convert(::Type{Ptr{hsa_queue_t}}, q::Queue) = q.handle

field_getter(
    :queue_info_,
    hsa_queue_t,
    Dict(
        :type => (hsa_queue_type_t, 0),
        :features => (hsa_queue_feature_t, 4),
        :base_address => (Uint64, 8),
        :doorbell_signal => (hsa_signal_t, 16),
        :size => (Uint32, 24),
        :id => (Uint32, 28),
        :service_queue => (Ptr{hsa_queue_t}, 32)
    )
)
