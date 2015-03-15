type Signal
    runtime :: Runtime
    handle :: hsa_signal_t

    consumers :: Set{Agent}

    is_alive :: Bool

    function Signal(rt::Runtime, h::hsa_signal_t, consumers::Set{Agent})
        if !rt.is_alive
            error("invalid runtime reference")
        end

        new(rt, h, consumers, true)
    end
end

const Relaxed = 0
const Acquire = 1
const AcquRel = 2
const Release = 3

function Signal(rt::Runtime; value::hsa_signal_value_t = 0, consumers = Set{Agent}())
    if !rt.is_alive
        error("invalid runtime reference")
    end
    h = signal_create(value, consumers)
    c = Set{Agent}(consumers)

	s = Signal(rt, h, c)

	finalizer(s, finalize_signal)

	return s
end

function finalize_signal(s :: Signal)
	if s.is_alive
		hsa_signal_destroy(s)
		s.is_alive = false
	end
end

import Base.convert

convert(::Type{hsa_signal_t}, s::Signal) = s.handle

import Base.get

get(s::Signal) = load(s)

function signal_create(initial_value::hsa_signal_value_t, consumers)
    local num_consumers, consumer_arr
    if !isempty(consumers)
        num_consumers = size(consumers,1)
        consumer_arr = hsa_agent_t[ a.handle for a in consumers ]
    else
        num_consumers = 0x0
        consumer_arr = C_NULL
    end

    res = hsa_signal_t[0]

    err = ccall((:hsa_signal_create, libhsa), hsa_status_t, (hsa_signal_value_t, Uint32, Ptr{hsa_agent_t}, Ptr{hsa_signal_t}),
                initial_value, num_consumers, consumer_arr, res)

    test_status(err)

    return res[1]
end
