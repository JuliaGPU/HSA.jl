module Test

using ..HSA

export get_testagent, get_softqueue, @with_agents

function get_testagent(agents = HSA.all_agents())
	spectre_idx = findfirst(a -> begin
		name = HSA.agent_info_name(a)
		# Creating queues for the CPU fails for some reason (Generic Error)
		return startswith(name, "Spectre")
	end, agents)
	return agents[spectre_idx]
end

macro with_agents(args...)
	quote
    if size(HSA.all_agents(),1) > 0
		$(esc(args...))
	else
        # no agents
		$(esc(:(@pending)),:(x => y))
    end
    end
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

end
