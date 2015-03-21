export WaitShort, WaitLong, WaitUnknown

const signal_by_id = Dict{hsa_signal_t, WeakRef}()

type Signal
    runtime :: Runtime
    handle :: hsa_signal_t

    consumers :: Set{Agent}

    is_alive :: Bool

    function Signal(rt::Runtime, h::hsa_signal_t, consumers::Set{Agent} = Set{Agent}())
        if !rt.is_alive
            error("invalid runtime reference")
        end

        if haskey(signal_by_id, h)
            existing = signal_by_id[h].value
            if existing != nothing
                return existing
            end
        end

        s = new(rt, h, consumers, true)

        signal_by_id[h] = WeakRef(s)

        return s
    end
end

# Wait Expectancy Hints
const WaitShort = HSA_WAIT_EXPECTANCY_SHORT
const WaitLong = HSA_WAIT_EXPECTANCY_LONG
const WaitUnknown = HSA_WAIT_EXPECTANCY_UNKNOWN

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

import Base.wait

function wait(s::Signal, cond::Symbol, compare_value::hsa_signal_value_t;
    timeout_hint = typemax(Uint64),
    wait_hint::hsa_wait_expectancy_t = WaitUnknown
    )
    const cond_map = Dict(
        :(==) => HSA_EQ,
        :(!=) => HSA_NE,
        :(<) => HSA_LT,
        :(>=) => HSA_GTE
        )

    if !haskey(cond_map, cond)
        error("unsupported signal wait condition $cond")
    end

    hsa_cond = cond_map[cond]

    timeout_hint = convert(Uint64, timeout_hint)

    return wait(s, hsa_cond, compare_value, timeout_hint, wait_hint)
end
