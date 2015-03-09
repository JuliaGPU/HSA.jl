type Signal
    runtime :: Runtime
    handle :: hsa_signal_t

    consumers :: Set{Agent}

    function Signal(rt::Runtime, h::hsa_signal_t, consumers::Set{Agent})
        if !rt.is_alive
            error("invalid runtime reference")
        end

        new(rt, h, consumers)
    end
end

function Signal(rt::Runtime; value::hsa_signal_value_t = 0, consumers = Set{Agent}())
    if !rt.is_alive
        error("invalid runtime reference")
    end
    h = signal_create(value, consumers)
    c = Set{Agent}(consumers)
    return Signal(rt, h, c)
end

import Base.get

function get(s::Signal)
    hsa_signal_load_acquire(s.handle)
end

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


