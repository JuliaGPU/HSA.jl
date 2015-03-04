using HSA
using FactCheck

facts("The Agents") do
    rt = NewRT()

	context("Can be iterated over") do
        agents = Array(HSA.Agent,0)

		context("with a callback returning true to continue") do
			HSA.iterate_agents(a -> begin
				push!(agents, a)
				true # continue
			end)

			for a in agents
				@fact isa(a, HSA.Agent) => true
			end
		end

		context("with a callback returning anything to continue") do
            count = 0

			HSA.iterate_agents(a -> begin
                count += 1
			end)

			@fact count => size(agents,1)
		end

		context("with a callback returning false to terminate early") do
            count = 0

			HSA.iterate_agents(a -> begin count += 1; return false end)

            if size(agents,1) > 0
				@fact count => 1
			else
				@pending count => 1 "no agents"
			end
		end

		context("rethrowing exceptions from the callback") do
		    @fact_throws HSA.iterate_agents(a -> error("testerror"))
		end
	end

	context("can all be retrieved as an array") do
        count = 0

		HSA.iterate_agents(a -> begin count += 1 end)

		agents = HSA.all_agents()

        @fact size(agents,1) => count
	end

	context("can be queried for information") do
        a = HSA.all_agents()[1]

		context("property by property") do
			name = HSA.agent_info_name(a)
            @fact length(name) => greater_than(1)
		end

		context("collectively for all basic agent info") do
		    @fact typeof(HSA.agent_info(a)) => HSA.AgentInfo
	    end
	end

	finalize(rt)
end
