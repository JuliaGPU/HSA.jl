export WaitShort, WaitLong, WaitUnknown

const signal_by_id = Dict{hsa_signal_t, WeakRef}()

export Signal

type Signal
    handle :: hsa_signal_t

    consumers :: Set{Agent}

    is_alive :: Bool

    function Signal(h::hsa_signal_t, consumers::Set{Agent} = Set{Agent}())
        assert_runtime_alive()

        if haskey(signal_by_id, h)
            existing = signal_by_id[h].value
            if existing != nothing
                return existing
            end
        end

        s = new(h, consumers, true)

        signal_by_id[h] = WeakRef(s)

        return s
    end
end

# Wait Expectancy Hints
const WaitActive = HSA_WAIT_STATE_ACTIVE
const WaitBlocked = HSA_WAIT_STATE_BLOCKED

function Signal(; value::hsa_signal_value_t = 0, consumers = Set{Agent}())
    h = signal_create(value, consumers)
    c = Set{Agent}(consumers)

    s = Signal(h, c)

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
    local num_consumers, consumer_arr, consumer_ptr
    if !isempty(consumers)
        num_consumers = size(consumers,1)
        consumer_arr = hsa_agent_t[ a.handle for a in consumers ]
		consumer_ptr = pointer(consumer_arr)
    else
        num_consumers = 0x0
        consumer_ptr = C_NULL
    end

    res = Ref(hsa_signal_t(0))

    err = ccall((:hsa_signal_create, libhsa), hsa_status_t, (hsa_signal_value_t, Uint32, Ptr{hsa_agent_t}, Ptr{hsa_signal_t}),
                initial_value, num_consumers, consumer_ptr, res)

    test_status(err)

    return res.x
end

import Base.wait

function wait(s::Signal, cond::Symbol, compare_value::hsa_signal_value_t;
    timeout_hint = typemax(Uint64),
    wait_state_hint::hsa_wait_state_t = WaitBlocked
    )
    const cond_map = Dict(
        :(==) => HSA_SIGNAL_CONDITION_EQ,
        :(!=) => HSA_SIGNAL_CONDITION_NE,
        :(<) => HSA_SIGNAL_CONDITION_LT,
        :(>=) => HSA_SIGNAL_CONDITION_GTE
        )

    if !haskey(cond_map, cond)
        error("unsupported signal wait condition $cond")
    end

    hsa_cond = cond_map[cond]

    timeout_hint = convert(Uint64, timeout_hint)

    return wait(s, hsa_cond, compare_value, timeout_hint, wait_state_hint)
end
