using HSA
using HSA.Intrinsics

code_llvm(get_global_id, (Int32,))

@target spir function kernel_f(a::Ptr{Int64},b::Ptr{Int64})
    i = HSA.Intrinsics.get_global_id(Int32(0))

	x = Base.unsafe_load(b, i)
	Base.unsafe_store!(a, x, i)
	return
end


HSA.init_hsail_codegen()

code_llvm(kernel_f, (Ptr{Int64}, Ptr{Int64}))

code_spir(kernel_f, (Ptr{Int64}, Ptr{Int64}))

#code_hsa(kernel_f, (Ptr{Int}, Ptr{Int}))

#println(src_hsail(kernel_f, (Ptr{Int}, Ptr{Int})))
