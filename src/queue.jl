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
    group_segment_size :: Uint32
    private_segment_size :: Uint32
    id :: Uint32
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

        return q
    end
end

function Queue(a :: Agent, size;
    typ :: hsa_queue_type_t = HSA_QUEUE_TYPE_SINGLE,
    error_callback = Nullable{Function}(),
	group_segment_size = typemax(Uint32),
	private_segment_size = typemax(Uint32))

    size = convert(Uint32, size)
	assert_runtime_alive()

    h = HSA.queue_create(a, size, typ;
	    register_callback = !isnull(Nullable{Function}(error_callback)),
	    group_segment_size = group_segment_size,
	    private_segment_size = private_segment_size)

    queue = Queue(h)
	queue.error_callback = error_callback

	return queue
end

import Base.getindex

function getindex(q :: Queue, i)
	assert(i > 0 && i <= q.size)

	p_ptr = convert(Ptr{Void}, q.base_address + 64 * (i - 1))

	return unsafe_convert(AQLPacket, p_ptr)
end

import Base.setindex!

function setindex!(q :: Queue, p :: AQLPacket, i)
	assert(i > 0 && i <= q.size)

	p_ptr = convert(Ptr{Void}, q.base_address + 64 * (i - 1))

	unsafe_store!(p_ptr, p)
end

import Base.push!

function push!(q :: Queue, p :: AQLPacket)
	idx = add_write_index!(q,Uint64(1)) + 1

	q[idx] = p

	store!(q.doorbell_signal, hsa_signal_value_t(idx))
end

function queue_err_cb(status :: hsa_status_t, queue_ptr :: Ptr{hsa_queue_t}, data_ptr :: Ptr{Void})
	if queue_ptr == C_NULL
		error("null queue ptr passed to error callback")
	end

	# retrieve or create Queue wrapper object
	queue = Queue(queue_ptr)

	cb = queue.error_callback
	if !isnull(cb)
		cb.value(status, queue)
	end

	return
end

const queue_err_cb_ptr = cfunction(queue_err_cb, Void, (hsa_status_t, Ptr{hsa_queue_t}, Ptr{Void}))

function queue_create(a :: Agent, size :: Uint32, typ :: hsa_queue_type_t;
	register_callback :: Bool = false,
	private_segment_size = typemax(Uint32),
	group_segment_size = typemax(Uint32))

    res = Ptr{hsa_queue_t}[C_NULL]
    cb_ptr = (register_callback) ? queue_err_cb_ptr : C_NULL
	cb_data_ptr = C_NULL

    err = ccall((:hsa_queue_create, libhsa), hsa_status_t, (hsa_agent_t, Uint32, hsa_queue_type_t, Ptr{Void}, Ptr{Void}, Uint32, Uint32, Ptr{Ptr{hsa_queue_t}}),
                a.handle, size, typ, cb_ptr, cb_data_ptr, private_segment_size, group_segment_size, res)

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
		:base_address => (Uint64, 8), # TODO handle ifdefs for machine_model/endianness
        :doorbell_signal => (hsa_signal_t, 16),
        :size => (Uint32, 24),
		# Uint32 reserved
        :id => (Uint32, 32),
    )
)
