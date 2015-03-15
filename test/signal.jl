using HSA
using FactCheck

facts("A Signal") do
    rt = NewRT()

    context("can be created") do
        s = HSA.Signal(rt)
        s2 = HSA.Signal(rt, value = 2)

        @fact s.runtime => rt
		@fact s.is_alive => true
        @fact s.handle => anything
        @fact get(s) => 0
        @fact get(s2) => 2
	end

    agents = HSA.all_agents(rt)
    @with_agents context("can be created with specific consumer agents") do
        a = agents[1]

		s3 = HSA.Signal(rt, consumers = [a])

		@fact length(s3.consumers) => 1
        @fact in(a, s3.consumers) => true
	end

	context("can be destroyed") do
		s = HSA.Signal(rt)

		finalize(s)

		@fact s.is_alive => false
	end

	context("can be manipulated") do


	end

    finalize(rt)
end

