using HSA
using HSA.Emulation
using FactCheck

include("kernels.jl")

facts("The Emulation can be used to run kernels on the CPU") do
    context("vector add") do
        const alen = 10

        a = Array(Int, alen); rand!(a)
        b = Array(Int, alen); rand!(b)
        c = Array(Int, alen); rand!(c)
        c_expected = a + b

        run_cpu((alen, 1, 1), vadd, a,b,c)

        @fact c --> c_expected
    end

    context("matrix multiplication") do
        const arows = 3
        const acols = 4

        a = Array(Float64, arows, acols); rand!(a)
        b = Array(Float64, acols, arows); rand!(b)
        c = Array(Float64, arows, arows); rand!(c)
        c_expected = a * b

        run_cpu((arows, 1, 1), mmul, a,b,c,acols)

        @fact c --> c_expected
    end
end
