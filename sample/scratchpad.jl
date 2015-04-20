using HSA

rt = Runtime()

as = HSA.all_agents()

a = last(as)
a_name = HSA.agent_info_name(a)
a_q_type = HSA.agent_info_queue_type(a)

println("Agent: $a_name")
println("Supports Multi Queues: $(a_q_type == HSA.QueueTypeMulti)")

qh = Queue(a, 4, typ = HSA.QueueTypeSingle)

regs = HSA.regions(a)

gl_idx = findfirst(r -> HSA.region_info_segment(r) == HSA.RegionSegmentGlobal, regs)

reg = regs[gl_idx]

s = Signal(value = 0)

qs = Queue(reg, 4, s)
