module HSA

include("binding/def.jl") # library path definitions
include("binding/hsa_common.jl") # generated type definitions
include("binding/custom.jl") # manual implementations

include("runtime/module.jl") # wrapper classes

if libhsaext != ""
include("ext_def.jl")
include("ext_finalization.jl")
end

include("binding/hsa_h.jl")
include("binding.jl")

# julia codegen integration
#if isdefined(Base, :HSA_TARGET)
include("compilation/Compilation.jl")
include("execution/Execution.jl")
include("intrinsics/Intrinsics.jl")
#end

end
