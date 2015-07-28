const queue_by_id = Dict{Uint32, WeakRef}()

export Queue

type Queue
    handle :: Ptr{hsa_queue_t}
    is_active :: Bool

    typ :: hsa_queue_type_t
    features :: hsa_queue_feature_t
    base_address :: Uint64
    doorbell_signal :: Signal
    size :: Uint32
	size_mask :: Uint32
    id :: Uint32

	# Info for "hardware" queues
    group_segment_size :: Nullable{Uint32}
    private_segment_size :: Nullable{Uint32}
	error_callback :: Nullable{Function}

	# Info for "software" queues
	region :: Nullable{Region}

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
		q_size_mask = q_size - 1

        q = new(q_ptr, true, q_typ, q_feat, q_base, q_bell, q_size, q_size_mask, q_id, nothing, nothing, nothing, nothing)

        finalizer(q, queue_destroy)

        queue_by_id[q_id] = WeakRef(q)

        return q
    end
end

# Constructor for Hardware Queues
function Queue(a :: Agent, size;
    typ :: hsa_queue_type_t = QueueTypeSingle,
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

# Constructor for Software Queues
function Queue(r :: Region, size, doorbell_signal :: Signal;
	typ :: hsa_queue_type_t = HSA_QUEUE_TYPE_SINGLE,
	features :: Uint32 = HSA_QUEUE_FEATURE_AGENT_DISPATCH)

	size = convert(Uint32, size)

	h = HSA.soft_queue_create(r, size, typ, features, doorbell_signal)

	q = Queue(h)

	q.region = r

	return q
end

import Base.getindex

@doc """
Retrieve a Packet at position `i` from the Queue. Indexing does not follow
julia conventions (1-based indexing) but rather respects the indexing used in the API.
(read/write indices)
"""
function getindex(q :: Queue, i)
	assert(i >= 0)
	i = convert(Uint32, i)

	p_ptr = convert(Ptr{Void}, q.base_address + 64 * (i & q.size_mask))

	return unsafe_convert(AQLPacket, p_ptr)
end

import Base.setindex!

@doc """
Write a Packet to the Queue at position `i`. Indexing does not follow
julia conventions (1-based indexing) but rather respects the indexing used in the API.
(read/write indices)
"""
function setindex!(q :: Queue, p :: AQLPacket, i)
	assert(i >= 0)
	i = convert(Uint32, i)

	p_ptr = convert(Ptr{Void}, q.base_address + 64 * (i & q.size_mask))

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

    res = Ref{Ptr{hsa_queue_t}}(C_NULL)
    cb_ptr = (register_callback) ? queue_err_cb_ptr : C_NULL
	cb_data_ptr = C_NULL

    err = ccall((:hsa_queue_create, libhsa), hsa_status_t, (hsa_agent_t, Uint32, hsa_queue_type_t, Ptr{Void}, Ptr{Void}, Uint32, Uint32, Ptr{Ptr{hsa_queue_t}}),
                a, size, typ, cb_ptr, cb_data_ptr, private_segment_size, group_segment_size, res)

    test_status(err)

    return res.x
end

function soft_queue_create(r :: Region, size :: Uint32, typ :: hsa_queue_type_t,
	features :: Uint32, doorbell_signal :: Signal)

    res = Ref{Ptr{hsa_queue_t}}(C_NULL)

    err = ccall((:hsa_soft_queue_create, libhsa), hsa_status_t, (hsa_region_t, Uint32, hsa_queue_type_t, Uint32, hsa_signal_t, Ptr{Ptr{hsa_queue_t}}),
                r.handle, size, typ, features, doorbell_signal, res)

    test_status(err)

    return res.x
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

