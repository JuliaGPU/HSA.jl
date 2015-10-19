import Base.convert

# generated datatypes
include("generated/hsa_datatypes.jl")
# custom datatypes and wrappers
include("custom/all.jl")
# generated wrappers
# these have to go last because they use the custom datatypes
include("generated/hsa_wrappers.jl")
