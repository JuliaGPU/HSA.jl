using HSA
using HSA.Intrinsics
using FactCheck

facts("The execution framework") do
	context("can execute a matrix multiplication") do
		const alen = 100

		@hsa_kernel function mmul(a,b,c)
			i = get_global_id(Int32(0)) + 1
