using HSA
include("helpers.jl")
using FactCheck

facts("Memory Management") do
    @use rt = HSA.Runtime() begin
        agents = HSA.all_agents()

        @with_agents context("Regions") do
            a = agents[1]

            context("can be enumerated") do
                regions = Array(Any, 0)

                HSA.iterate_regions(a, function (r)
                    push!(regions, r)
                end)

                regions2 = HSA.regions(a)

                @fact length(regions) --> greater_than(0)

                @fact length(regions2) --> length(regions)
                for r in regions
                    @fact in(r, regions2) --> true
                    @fact isa(r, HSA.Region) --> true
                end
            end

            context("can be queried") do
                a = agents[1]
                regs = HSA.regions(a)

                greg_idx = findfirst(x -> begin
                    seg = HSA.region_info_segment(x)
                    return seg == HSA.RegionSegmentGlobal
                end, regs)
                greg = regs[greg_idx]

                @fact isa(greg, HSA.Region) --> true

                flags = HSA.region_info_global_flags(greg)

                @fact (flags & HSA.HSA_REGION_GLOBAL_FLAG_KERNARG) --> not(0)
            end
        end
    end
end
