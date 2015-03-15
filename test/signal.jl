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
        s = HSA.Signal(rt, value = 2)

        @fact HSA.load(s) => 2
        @fact HSA.load(s, Val{Acquire}) => 2
        @fact HSA.load(s, Val{Relaxed}) => 2

        HSA.store!(s, 3)
        @fact HSA.load(s) => 3

        HSA.store!(s, 4, Val{Relaxed})
        @fact HSA.load(s) => 4
        #TODO s := 5
        @pending HSA.load(s) => 5

        @fact HSA.exchange!(s, 6) => 4
        @fact HSA.load(s) => 6
        @fact HSA.exchange!(s, 7, Val{Relaxed}) => 6
        @fact HSA.load(s) => 7
        @fact HSA.exchange!(s, 8, Val{Release}) => 7
        @fact HSA.load(s) => 8

        #TODO CAS

        HSA.store!(s, 100)
        HSA.add!(s, 1)
        @fact HSA.load(s) => 101
        HSA.add!(s, 1, Val{Release})
        @fact HSA.load(s) => 102
        #TODO s += 1
        @pending HSA.load(s) => 103
    end

    context("can be waited on") do
       s = HSA.Signal(rt, value = 2)

       @fact wait(s, :(==), 2) => 2
       @fact wait(s, :<, 3; timeout_hint = 10, wait_hint = WaitLong) => 2
       @fact wait(s, :(!=), 3) => 2
       @fact wait(s, :(>=), 2) => 2
    end


    finalize(rt)
end

