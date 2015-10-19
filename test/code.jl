using HSA
include("helpers.jl")
using FactCheck

facts("Code Objects and Executables") do
    @use rt = HSA.Runtime() begin

        @with_agents context("The ISAs") do
            context("can be queried") do
                a = get_testagent()

                i_s_a = HSA.agent_info_isa(a)

                @fact isa(i_s_a, HSA.hsa_isa_t) --> true
            end
        end

        context("Executables") do
            context("can be created") do
                @use ex = Executable() begin

                    @fact isa(ex, Executable) --> true
                    @fact HSA.executable_info_state(ex) --> HSA.ExecutableStateUnfrozen
                    @fact HSA.executable_info_profile(ex) --> HSA.ProfileFull
                end
            end

            context("can be created with a profile") do
                @use ex = Executable(profile = HSA.ProfileBase) begin

                    @fact HSA.executable_info_profile(ex) --> HSA.ProfileBase
                end
            end

            context("can be frozen") do
                @use ex = Executable() begin

                    HSA.executable_freeze(ex)

                    @fact HSA.executable_info_state(ex) --> HSA.ExecutableStateFrozen
                end
            end
        end

    end
end
