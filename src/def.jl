export Relaxed, Acquire, AcquRel, Release

const libhsa = "/home/georg/lib64/libhsa-runtime64.so"

const libhsakmt = "/home/georg/lib64/libhsakmt.so.1"

const libhsakmt_handle = dlopen(libhsakmt)

const argtype_map = Dict(
    :hsa_signal_t => :Signal,
	:hsa_agent_t => :Agent,
)

# Memory Consistency Enumeration
const Relaxed = 0
const Acquire = 1
const AcquRel = 2
const Release = 3
