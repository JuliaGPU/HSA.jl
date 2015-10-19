using HSA
include("helpers.jl")
using FactCheck

@with_agents facts("The ISA") do
    rt = Runtime()

    context("Can be retrieved from an agent") do
        agent = get_testagent()

        isa = HSA.agent_info_isa(agent)

        name = HSA.isa_info_name(isa)

        @fact name  --> not("")
    end
end
