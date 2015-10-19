
import Base.zero

zero(::Type{Tuple{Uint16,Uint16,Uint16}}) = (zero(Uint16),zero(Uint16),zero(Uint16))
zero(::Type{Tuple{Uint32,Uint32,Uint32,Uint32}}) = (zero(Uint32),zero(Uint32),zero(Uint32),zero(Uint32))

zero(::Type{hsa_dim3_t}) = hsa_dim3_t(0,0,0)
zero(::Type{hsa_isa_t}) = hsa_isa_t(0)
zero(::Type{hsa_ext_control_directives_t}) =
hsa_ext_control_directives_t(
0,0,0,0,0,0,0,
zero(Array_3_Uint64),
zero(hsa_dim3_t), 0,
zero(Array_75_Uint8)
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
