using HSA
using FactCheck

type Fable
end

facts("The Macros") do
    context("can provide deterministic destruction") do
        finalized = false

        function finalize_fable(f)
            finalized = true
        end

        @use f = Fable() begin
            finalizer(f, finalize_fable)

            @fact finalized --> false
        end

        @fact finalized --> true
    end
end
