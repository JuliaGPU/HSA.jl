using HSA
using FactCheck

function get_testagent(agents)
	spectre_idx = findfirst(a -> begin
		name = HSA.agent_info_name(a)
		# Creating queues for the CPU fails for some reason (Generic Error)
		return startswith(name, "Spectre")
	end, agents)
	return agents[spectre_idx]
end

function get_softqueue(agent, s = HSA.Signal(value = 0), r_out = Ref{Nullable{HSA.Region}}())
    regs = HSA.regions(agent)

	gl_idx = findfirst(x -> begin
        seg = HSA.region_info_segment(x)
		if seg == HSA.RegionSegmentGlobal
			flags = HSA.region_info_global_flags(x)

			if (flags & HSA.RegionGlobalFlagKernarg) != 0
				return true
			end
		end
		return false
	end, regs)

	gl_reg = regs[gl_idx]

	r_out.x = gl_reg

	return HSA.Queue(gl_reg, 0x04, s)
end

facts("A Queue") do
    rt = NewRT()
    agents = HSA.all_agents()

	@with_agents context("Can be created as software Queues") do
		a = get_testagent(agents)
		s = HSA.Signal(value = 0)
		r = Ref{Nullable{HSA.Region}}(nothing)
        q = get_softqueue(a,s,r)

		@fact isa(q, Queue) => true
		@fact q.doorbell_signal.handle.handle => s.handle.handle
		@fact q.region.value => r.x.value
	end

    @with_agents context("Can be created as hardware Queues") do
		a = get_testagent(agents)
		a_minq = HSA.agent_info_queue_min_size(a)
        q = HSA.Queue(a, 0x04)

        @fact q.handle => x -> x != C_NULL
        @fact q.is_active => true
        @fact q.typ => anything
        @fact q.features => not((HSA.hsa_queue_feature_t)(0))
        @fact q.base_address => not(Uint64(0))
        @fact q.doorbell_signal => anything
        @fact q.size => max(a_minq, (Uint32)(4))
        @fact q.id => anything
    end

    @with_agents context("Can be destroyed") do
		a = get_testagent(agents)
        q = HSA.Queue(a, 0x04)

        finalize(q)

        @fact q.handle => C_NULL
        @fact q.is_active => false
    end

	@with_agents context("Can have their error callback invoked") do
		local called_with_q, called_with_s

		a = get_testagent(agents)
		q = HSA.Queue(a, 0x04, error_callback = function(s,q_arg)
			called_with_q = q_arg
			called_with_s = s
		end)

		HSA.queue_err_cb(HSA.HSA_STATUS_ERROR, q.handle, C_NULL)

		@fact called_with_q => q
		@fact called_with_s => HSA.HSA_STATUS_ERROR
	end

    @with_agents context("Can have their indexes manipulated") do
		a = get_testagent(agents)
        q = HSA.Queue(a, 0x04)

        @fact HSA.load_read_index(q) => 0
        @fact HSA.load_read_index(q, Val{HSA.Relaxed}) => 0

		@fact HSA.load_write_index(q) => 0
		HSA.store_write_index!(q, Uint64(1))
		@fact HSA.load_write_index(q) => 1
    end

	@with_agents context("Can be accessed by index") do
		a = get_testagent(agents)
		q = HSA.Queue(a, 0x04)
	    p = HSA.AgentDispatchPacket(0x8000)

		@fact_throws q[q.size + 1] = p
		q[1] = p
		@fact q[1] => p
		q[2] = p
		@fact q[2] => p
	end

	@with_agents context("Can submit new packets via push") do
		a = get_testagent(agents)
		q = get_softqueue(a)

		p = HSA.AgentDispatchPacket(0x8000)

		push!(q,p)

		@fact HSA.load_write_index(q) => 1
	end

    @with_agents context("Can be inactivated") do
	    a = get_testagent(agents)
        q = HSA.Queue(a, 0x04)

        HSA.queue_inactivate(q)

        @fact q.is_active => false
    end

	finalize(rt)
end
