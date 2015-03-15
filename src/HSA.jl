module HSA

include("binding/hsa_common.jl") # generated type definitions
include("binding/custom.jl") # wrapper generators

include("def.jl")
include("error.jl")
include("runtime.jl")
include("agent.jl")
include("signal.jl")
include("queue.jl")

include("binding/hsa_h.jl")
include("binding.jl")

end
