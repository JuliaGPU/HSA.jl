using HSA
using HSA.ExtFinalization
using FactCheck

facts("The Finalization API") do
    rt = HSA.Runtime()

    context("A Program") do
        context("Can be created") do
            @use p = Program() begin

                @fact isa(p, Program) --> true
                @fact p.handle.handle --> not(0)

            end
        end

        context("Can be destroyed") do
            p = Program()

            finalize(p)

            @fact p.handle --> nothing
        end
    end

    finalize(rt)
end
