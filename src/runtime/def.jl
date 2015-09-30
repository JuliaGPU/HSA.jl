export Relaxed, Acquire, AcquRel, Release

const argtype_map = Dict(
    :hsa_signal_t => :Signal,
    :hsa_agent_t => :Agent,
    :(Ptr{hsa_queue_t}) => :Queue,
    :hsa_region_t => :Region,
)

# Memory Consistency Enumeration
const Relaxed = 0
const Acquire = 1
const AcquRel = 2
const Release = 3
