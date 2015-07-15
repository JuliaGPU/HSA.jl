using HSA
using HSA.Intrinsics
using FactCheck

facts("The Emulation") do
	context("Can be used to run kernels on the CPU") do
		const alen = 10

		@hsa_kernel function vadd(a,b,c)
			i = get_global_id(Int32(0)) + 1
			a[i] = b[i] + c[i]
		end

		a = Array(Int, alen); rand!(a)
		b = Array(Int, alen); rand!(b)
		c = Array(Int, alen); rand!(c)
		a_expected = b + c

		run_cpu((10, 1, 1), vadd, a,b,c)

		@fact a => a_expected
	end
end
