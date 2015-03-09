using HSA
using FactCheck

facts("A Signal") do
    rt = NewRT()
    a = HSA.all_agents(rt)[1]

    context("can be created") do
        s = HSA.Signal(rt)
        s2 = HSA.Signal(rt, value = 2)
        s3 = HSA.Signal(rt, consumers = [a])

        @fact s.runtime => rt
        @fact s.handle => anything
        @fact get(s) => 0
        @fact get(s2) => 2
        @fact length(s3.consumers) => 1
        @fact in(a, s3.consumers) => true
    end

    finalize(rt)
end

