using HSA
using FactCheck

facts("A Signal") do
    rt = NewRT()

    context("can be created") do
        s = HSA.Signal()
        s2 = HSA.Signal(value = 2)

		@fact s.is_alive => true
        @fact s.handle => anything
        @fact get(s) => 0
        @fact get(s2) => 2
	end

	context("are deduplicated in the constructor") do
		s = HSA.Signal()
		s_ame = HSA.Signal(s.handle)

		@fact s => s_ame
	end

    agents = HSA.all_agents()
    @with_agents context("can be created with specific consumer agents") do
        a = agents[1]

		s3 = HSA.Signal(consumers = [a])

		@fact length(s3.consumers) => 1
        @fact in(a, s3.consumers) => true
	end

	context("can be destroyed") do
		s = HSA.Signal()

		finalize(s)

		@fact s.is_alive => false
	end

	context("can wrap doorbell signals") do
		fake_handle = HSA.hsa_signal_t(10101)
        s = HSA.Signal(fake_handle)

		# does not destroy the signal upon being finalized
		finalize(s)
	end

	context("can be manipulated") do
        s = HSA.Signal(value = 2)

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
       s = HSA.Signal(value = 2)

       @fact wait(s, :(==), 2) => 2
       @fact wait(s, :<, 3; timeout_hint = 10) => 2
       @fact wait(s, :(!=), 3) => 2
       @fact wait(s, :(>=), 2) => 2
    end

	context("can be waited on with a timeout") do
		s = HSA.Signal(value = 2)

		@fact wait(s, :(==), 3; timeout_hint = 1) => 2
	end

    finalize(rt)
end

