module HSA

include("binding/def.jl") # library path definitions
include("binding/hsa_common.jl") # generated type definitions
include("binding/custom.jl") # manual implementations

include("def.jl")
include("util_iter.jl")
include("util_macros.jl")
include("error.jl")
include("runtime.jl")
include("agent.jl")
include("signal.jl")
include("aql.jl")
include("memory.jl")
include("queue.jl")
include("code.jl")

if libhsaext != ""
include("ext_def.jl")
include("ext_finalization.jl")
end

include("binding/hsa_h.jl")
include("binding.jl")

# julia codegen integration
if isdefined(Base, :HSA_TARGET)
include("reflection.jl")
include("execution.jl")
include("intrinsics.jl")
end

end
