module HSA

include("discovery.jl")

# Some things are always available
include("emulation/emulation.jl")

if has_libhsa()
info("HSA library found.")
include("binding/binding.jl")

if HSA.has_ext_finalization()
info("HSA Finalization Extension is available.")
include("binding/ext_finalization.jl")

if has_hsa_codegen()
info("Experimental HSA CodeGen found, enabling.")
include("codegen/codegen.jl")
end
end
end
end

