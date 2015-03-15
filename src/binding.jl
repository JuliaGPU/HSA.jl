getter(:hsa_system_get_info,
    (:info, :data),
    (hsa_system_info_t, Ptr{Void}),
    Dict(
    :HSA_SYSTEM_INFO_VERSION_MAJOR => Cushort,
    :HSA_SYSTEM_INFO_VERSION_MINOR => Cushort,
    :HSA_SYSTEM_INFO_TIMESTAMP => Culonglong,
    :HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY => Cushort,
    :HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT => Culonglong
    )
)



import Base.convert

function convert(::Type{hsa_dim3_t}, values :: Vector{Uint32})
    if length(values) != 3
        error("invalid input argument)")
    end

    hsa_dim3_t(values...)
end

function status_string(status::hsa_status_t)
    string = Ptr{Uint8}[0]

    err = ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,string)

    # manually test for error
    if err & HSA_STATUS_ERROR == HSA_STATUS_ERROR
        # throw regular error to avoid recursion to HSAError
        error("could not retrieve status string")
    end

    return bytestring(string[1])
end
