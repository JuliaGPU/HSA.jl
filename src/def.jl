
const libhsa = "/home/georg/lib64/libhsa-runtime64.so"

const libhsakmt = "/home/georg/lib64/libhsakmt.so.1"

const libhsakmt_handle = dlopen(libhsakmt)

const argtype_map = Dict(
    :hsa_signal_t => :Signal,
	:hsa_agent_t => :Agent,
)



