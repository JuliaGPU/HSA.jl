using HSA
using FactCheck

facts("Memory Management") do
    rt = NewRT()

	agents = HSA.all_agents(rt)

    @with_agents context("Regions") do
		a = agents[1]

        context("can be enumerated") do
            regions = Array(HSA.Region, 0)

            HSA.agent_iterate_regions(a, function (r)
                push!(regions, r)
			end)

			regions2 = HSA.regions(a)

			@fact length(regions) => greater_than(0)

			@fact length(regions2) => length(regions)
			for r in regions
				@fact in(r, regions2) => true
				@fact isa(r, HSA.Region)
			end
		end
	end
end
