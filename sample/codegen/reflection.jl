using HSA
using HSA.Builtins: get_global_id

code_llvm(get_global_id, (Int32,))

@target hsail function vcopy(a,b)
    i = get_global_id(Int32(0))

	x = b[i+1]
	a[i+1] = x
	return nothing
end

println("------- LLVM -------------------------------")
code_llvm(vcopy, (Ptr{Int64}, Ptr{Int64}))

println("------- SPIR -------------------------------")
code_spir(vcopy, (Ptr{Int64}, Ptr{Int64}))

println("------- HSA --------------------------------")
code_hsa(vcopy, (Ptr{Int}, Ptr{Int}))

println("------- HSAIL ------------------------------")
println(src_hsail(vcopy, (Ptr{Int}, Ptr{Int})))
