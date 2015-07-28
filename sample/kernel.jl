using HSA
using HSA.Intrinsics

code_llvm(get_global_id, (Int32,))

@target hsail function kernel_f(a,b)
    i = HSA.Intrinsics.get_global_id(Int32(0))

	x = b[i+1]
	a[i+1] = x
	return
end


HSA.init_hsail_codegen()

println("------- LLVM -------------------------------")
code_llvm(kernel_f, (Ptr{Int64}, Ptr{Int64}))

println("------- SPIR -------------------------------")
code_spir(kernel_f, (Ptr{Int64}, Ptr{Int64}))

println("------- HSA --------------------------------")
code_hsa(kernel_f, (Ptr{Int}, Ptr{Int}))

println("------- HSAIL ------------------------------")
println(src_hsail(kernel_f, (Ptr{Int}, Ptr{Int})))
