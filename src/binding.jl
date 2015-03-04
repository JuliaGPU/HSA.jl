const libhsa = "/home/strollinger/lib64/libhsa-runtime64.so"

const libhsakmt = "/home/strollinger/lib64/libhsakmt.so.1"

const libhsakmt_handle = dlopen(libhsakmt)

include("binding/hsa_common.jl")
include("binding/hsa_h.jl")
include("binding/custom.jl")
