module HSA

include("discovery.jl")

# Some things are always available
include("emulation/emulation.jl")

if has_libhsa()
include("binding/binding.jl")

if has_libhsaext()
include("binding/ext_finalization.jl")

if has_hsa_codegen()
println("Experimental HSA CodeGen found, enabling.")
include("codegen/codegen.jl")
end
end

end

end
