using HSA
using FactCheck

facts("A Queue") do
    rt = NewRT()
    a = HSA.all_agents(rt)[1]

    context("Can be created") do
        q = HSA.Queue(a, 0x04)

        @fact q.runtime => rt
        @fact q.handle => x -> x != C_NULL
        @fact q.is_active => true
        @fact q.typ => anything
        @fact q.features => not((HSA.hsa_queue_feature_t)(0))
        @fact q.base_address => not(Uint64(0))
        @pending q.doorbell_signal => anything
        @fact q.size => (Uint32)(4)
        @fact q.id => anything
        @pending q.service_queue => anything
    end

    context("Can be destroyed") do
        q = HSA.Queue(a, 0x04)

        finalize(q)

        @fact q.handle => C_NULL
        @fact q.is_active => false
    end

    context("Can be inactivated") do
        q = HSA.Queue(a, 0x04)

        HSA.queue_inactivate(q)

        @fact q.is_active => false
    end

    context("Can have their indexes manipulated") do
        q = HSA.Queue(a, 0x04)

        @fact HSA.queue_load_read_index(q) => 0
        @fact HSA.queue_load_read_index(q, relaxed = true) => 0
    end
end
