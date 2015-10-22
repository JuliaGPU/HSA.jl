using HSA
include("helpers.jl")
using FactCheck


facts("The Agents") do
    rt = Runtime()
    agents = Array(HSA.Agent,0)

    context("Can be iterated over") do
        context("with a callback returning true to continue") do
            HSA.iterate_agents(a -> begin
                push!(agents, a)
                true # continue
            end)

            for a in agents
                @fact isa(a, HSA.Agent) --> true
            end
        end

        context("with a callback returning not(nothing) to continue") do
            count = 0

            HSA.iterate_agents(a -> begin
                count += 1
            end)

            @fact count --> size(agents,1)
        end

        context("with a callback returning false to terminate early") do
            count = 0

            HSA.iterate_agents(a -> begin count += 1; return false end)

            @with_agents @fact count --> 1
        end

        context("rethrowing exceptions from the callback") do
            @with_agents @fact_throws HSA.iterate_agents(rt, a -> error("testerror"))
        end
    end

    context("can all be retrieved as an array") do
        count = 0

        HSA.iterate_agents(a -> begin count += 1 end)

        agents = HSA.all_agents()

        @fact size(agents,1) --> count
    end

    context("can be retrieved by device type") do
        count = 0
        t = HSA.HSA_DEVICE_TYPE_CPU

        HSA.iterate_agents(a -> begin
            if HSA.agent_info_device(a) & t == t
                count += 1
            end
        end)

        agents = HSA.all_agents(dev = t)

        @fact size(agents,1) --> count
    end

    context("can be queried for information") do

        @with_agents context("property by property") do
            a = agents[1]

            name = HSA.agent_info_name(a)
            @fact length(name) --> greater_than(1)
            @fact HSA.agent_info_name(a) --> not(nothing)
            @fact HSA.agent_info_vendor_name(a) --> not(nothing)
            @fact HSA.agent_info_feature(a) --> not(nothing)
            @fact HSA.agent_info_wavefront_size(a) --> not(nothing)

            wg_dim = HSA.agent_info_workgroup_max_dim(a)
            @fact wg_dim --> not(nothing)
            @fact typeof(wg_dim) --> Tuple{UInt16, UInt16, UInt16}

            @fact HSA.agent_info_workgroup_max_size(a) --> not(nothing)
            @fact HSA.agent_info_grid_max_dim(a) --> not(nothing)
            @fact HSA.agent_info_grid_max_size(a) --> not(nothing)
            @fact HSA.agent_info_fbarrier_max_size(a) --> not(nothing)
            @fact HSA.agent_info_queues_max(a) --> not(nothing)
            @fact HSA.agent_info_queue_max_size(a) --> not(nothing)
            @fact HSA.agent_info_queue_type(a) --> not(nothing)
            @fact HSA.agent_info_node(a) --> not(nothing)
            @fact HSA.agent_info_device(a) --> not(nothing)
            @fact HSA.agent_info_cache_size(a) --> not(nothing)
        end

        @with_agents context("collectively for all basic agent info") do
            a = agents[1]

            @fact typeof(HSA.agent_info(a)) --> HSA.AgentInfo
        end
    end

    finalize(rt)
end
