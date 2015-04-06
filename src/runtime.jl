export Runtime

getter(:hsa_system_get_info,
    (:info, :data),
    (hsa_system_info_t, Ptr{Void}),
    Dict(
    :HSA_SYSTEM_INFO_VERSION_MAJOR => Cushort,
    :HSA_SYSTEM_INFO_VERSION_MINOR => Cushort,
    :HSA_SYSTEM_INFO_TIMESTAMP => Culonglong,
    :HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY => Cushort,
    :HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT => Culonglong,
	:HSA_SYSTEM_INFO_ENDIANNESS => hsa_endianness_t,
	:HSA_SYSTEM_INFO_MACHINE_MODEL => hsa_machine_model_t,
	:HSA_SYSTEM_INFO_EXTENSIONS => (Uint8, 128)
    )
)

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

