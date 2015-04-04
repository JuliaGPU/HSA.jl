using HSA
using FactCheck

facts("A Queue") do
    rt = NewRT()
    agents = HSA.all_agents()

    @with_agents context("Can be created") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        @fact q.handle => x -> x != C_NULL
        @fact q.is_active => true
        @fact q.typ => anything
        @fact q.features => not((HSA.hsa_queue_feature_t)(0))
        @fact q.base_address => not(Uint64(0))
        @fact q.doorbell_signal => anything
        @fact q.size => (Uint32)(4)
        @fact q.id => anything
        @fact isnull(q.service_queue) => true
    end

    @with_agents context("Can be destroyed") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        finalize(q)

        @fact q.handle => C_NULL
        @fact q.is_active => false
    end

	@with_agents context("Can have their error callback invoked") do
		local called_with_q, called_with_s

		a = agents[1]
		q = HSA.Queue(a, 0x04, error_callback = function(s,q_arg)
			called_with_q = q_arg
			called_with_s = s
		end)

		HSA.queue_err_cb(HSA.HSA_STATUS_ERROR, q.handle)

		@fact called_with_q => q
		@fact called_with_s => HSA.HSA_STATUS_ERROR
	end

    @with_agents context("Can have their indexes manipulated") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        @fact HSA.load_read_index(q) => 0
        @fact HSA.load_read_index(q, Val{HSA.Relaxed}) => 0

		@fact HSA.load_write_index(q) => 0
		HSA.store_write_index!(q, Uint64(1))
		@fact HSA.load_write_index(q) => 1
    end

	@with_agents context("Can submit new packets via push") do
       a = agents[1]
	   q = HSA.Queue(a, 0x04)

	   p = HSA.AgentDispatchPacket(0x8000)

	   push!(q,p)

	   @fact HSA.queue_load_write_index(q) => 1

	end

    @with_agents context("Can be inactivated") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        HSA.queue_inactivate(q)

        @fact q.is_active => false
    end

	finalize(rt)
end
