module HSA

include("binding/def.jl") # library path definitions
include("binding/hsa_common.jl") # generated type definitions
include("binding/custom.jl") # wrapper generators

include("def.jl")
include("util_iter.jl")
include("error.jl")
include("runtime.jl")
include("agent.jl")
include("signal.jl")
include("aql.jl")
include("memory.jl")
include("queue.jl")
include("code.jl")

include("binding/hsa_h.jl")
include("binding.jl")

end
