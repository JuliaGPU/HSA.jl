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

    @with_agents context("Can be inactivated") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        HSA.queue_inactivate(q)

        @fact q.is_active => false
    end

    @with_agents context("Can have their indexes manipulated") do
        a = agents[1]
        q = HSA.Queue(a, 0x04)

        @fact HSA.queue_load_read_index(q) => 0
        @fact HSA.queue_load_read_index(q, relaxed = true) => 0
    end

	finalize(rt)
end
