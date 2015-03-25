using HSA
using FactCheck

facts("The Runtime") do

    context("Holds a reference to the HSA Runtime while it lives") do
        @fact_throws HSA.system_info_version_major()

        rt = NewRT()

        @fact HSA.system_info_version_major() => anything
		assert_runtime_alive()

        finalize(rt)

        @fact_throws HSA.system_info_version_major()
    end
end

facts("The Misc Functions") do
    rt = NewRT()

    context("Can retrieve system information") do
        @fact HSA.system_info_version_major() => anything
        @fact HSA.system_info_version_minor() => anything
        @fact HSA.system_info_timestamp() => anything
        @fact HSA.system_info_timestamp_frequency() => anything
        @fact HSA.system_info_signal_max_wait() => anything
    end

    context("Can retrieve status strings") do
        @fact HSA.status_string(HSA.HSA_STATUS_SUCCESS) => x -> isa(x, String)
        @fact HSA.status_string(HSA.HSA_STATUS_ERROR_INVALID_ARGUMENT) => x -> contains(x, "argument")
    end

    finalize(rt)
end
