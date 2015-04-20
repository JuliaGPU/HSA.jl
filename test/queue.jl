using HSA
using FactCheck

# Check if the packet headers in the buffers have been
# initialized to "invalid" according to the spec
function check_packetheaders(q)
	for i = 1:q.size
		hdr = HSA.unsafe_convert(PacketHeader, convert(Ptr{Void}, q.base_address + i * 64))
		@fact hdr.typ => HSA.PacketTypeInvalid "At Index $i"
		if hdr.typ != HSA.PacketTypeInvalid
			break
		end
	end
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
		@fact q.features & HSA.QueueFeatureAgentDispatch => HSA.QueueFeatureAgentDispatch

		q_handle = q.doorbell_signal.handle.handle
		s_handle = s.handle.handle
		@fact q_handle => s_handle "$q_handle/$s_handle"
		@fact q.region.value => r.x.value

		check_packetheaders(q)
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
        @fact isa(q.doorbell_signal, Signal) => true
        @fact q.size => greater_than_or_equal(0x04) "Requested/Min/Actual QueueSize: 4/$a_minq/$(q.size)"
        @fact q.id => anything

		# try to see if the signal is actually valid
		HSA.store!(q.doorbell_signal, 1)

		check_packetheaders(q)
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

		q[q.size] = p
		@fact q[0] => p
		@fact q[q.size] => p
		q[1] = p
		@fact q[1] => p
	end

	# currently fails with a segmentation fault when accessing the
	# doorbell signal because the runtime returns a broken software queue
	@with_agents @pending context("Can submit new packets via push") do
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
