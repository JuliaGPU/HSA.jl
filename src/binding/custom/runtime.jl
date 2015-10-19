export Runtime

export assert_runtime_alive

const runtime_ref_count = Int[0]

type Runtime
    is_alive::Bool

    function Runtime()
        test_status(hsa_init())
        runtime_ref_count[1] += 1
        val = new(true)
        finalizer(val, finalize_runtime)
        return val
    end
end

function finalize_runtime(r::Runtime)
    if r.is_alive
        err = hsa_shut_down()
        r.is_alive = false
        runtime_ref_count[1] -= 1

        test_status(err)
    end
end

function assert_runtime_alive()
    @assert runtime_ref_count[1] > 0
end

