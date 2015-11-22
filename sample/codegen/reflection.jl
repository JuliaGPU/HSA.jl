using HSA
using HSA.Builtins: get_global_id

script_dir = dirname(@__FILE__)

# kernel implementations
include("$script_dir/../../test/kernels.jl")

# Select a kernel and argument type tuple

#kernel = mmul2d
#argtypes = (Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Int64)

kernel = vopy
argtypes = (Ptr{Float64}, Ptr{Float64})


# Dump the various intermediate stages from Julia to HSAIL

println("------- LLVM -------------------------------")
code_llvm(kernel, argtypes)

println("------- SPIR -------------------------------")
code_spir(kernel, argtypes)

println("------- HSA --------------------------------")
code_hsa(kernel, argtypes)

println("------- HSAIL ------------------------------")
println(src_hsail(kernel, argtypes))
