using HSA
using HSA.Builtins

code_llvm(get_global_id, (Int32,))

@target hsail function kernel_f(a,b)
    i = get_global_id(Int32(0))

	x = Base.unsafe_load(b, i+1)
	Base.unsafe_store!(a, x, i+1)
	return nothing
end

println("------- LLVM -------------------------------")
code_llvm(kernel_f, (Ptr{Int64}, Ptr{Int64}))

println("------- SPIR -------------------------------")
code_spir(kernel_f, (Ptr{Int64}, Ptr{Int64}))

println("------- HSA --------------------------------")
code_hsa(kernel_f, (Ptr{Int}, Ptr{Int}))

println("------- HSAIL ------------------------------")
println(src_hsail(kernel_f, (Ptr{Int}, Ptr{Int})))
