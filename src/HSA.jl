module HSA

include("binding/hsa_common.jl") # generated type definitions
include("binding/custom.jl") # wrapper generators

include("def.jl")
include("util_iter.jl")
include("error.jl")
include("runtime.jl")
include("agent.jl")
include("signal.jl")
include("aql.jl")
include("queue.jl")

include("ext_amd.jl")

include("binding/hsa_h.jl")
include("binding.jl")

end
