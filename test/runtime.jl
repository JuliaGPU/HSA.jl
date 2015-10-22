using HSA
using FactCheck

facts("The Runtime") do

    context("Holds a reference to the HSA Runtime while it lives") do
        @fact_throws HSA.system_info_version_major()

        rt = HSA.Runtime()

        @fact HSA.system_info_version_major() --> not(nothing)
        assert_runtime_alive()

        finalize(rt)

        @fact_throws HSA.system_info_version_major()
    end
end

facts("The Misc Functions") do
    rt = HSA.Runtime()

    context("Can retrieve system information") do
        @fact HSA.system_info_version_major() --> not(nothing)
        @fact HSA.system_info_version_minor() --> not(nothing)
        @fact HSA.system_info_timestamp() --> not(nothing)
        @fact HSA.system_info_timestamp_frequency() --> not(nothing)
        @fact HSA.system_info_signal_max_wait() --> not(nothing)
        @fact HSA.system_info_endianness() --> not(nothing)
        @fact HSA.system_info_machine_model() --> not(nothing)
        @fact HSA.system_info_extensions() --> not(nothing)
    end

    context("Can retrieve status strings") do
        @fact HSA.status_string(HSA.HSA_STATUS_SUCCESS) --> x -> isa(x, AbstractString)
        @fact HSA.status_string(HSA.HSA_STATUS_ERROR_INVALID_ARGUMENT) --> x -> contains(x, "argument")
    end

    finalize(rt)
end
