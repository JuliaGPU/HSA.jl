using HSA
using HSA.Intrinsics
using HSA.Execution
using FactCheck

facts("The execution framework") do
	context("can execute a simple matrix multiplication") do
		const arows = 5
		const acols = 10

		@hsa_kernel function mmul(a,b,c,n)
			i = get_global_id(Int32(0)) + 1
			j = get_global_id(Int32(1)) + 1

			x = 0.0
			for k = 1:n
				x += a[i,k] * b[k,j]
			end
			c[i,j] = x
		end

		a = Array(Float64, arows, acols); rand!(a)
		b = Array(Float64, acols, arows); rand!(b)
		c = Array(Float64, arows, arows); rand!(c)
		c_expected = a * b

		@hsa (arows, acols) mmul(a,b,c,acols)

		@fact c => c_expected
	end
end
