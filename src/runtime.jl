export Runtime

type Runtime
    is_alive::Bool

    function Runtime()
        test_status(hsa_init())
    	val = new(true)
    	finalizer(val, finalize_runtime)
    	return val
    end
end

function finalize_runtime(r::Runtime)
    if r.is_alive
        hsa_shut_down()
        r.is_alive = false
    end
end


