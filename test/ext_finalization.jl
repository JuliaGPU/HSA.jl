using HSA
using HSA.ExtFinalization
using FactCheck

facts("The Finalization API") do
    rt = HSA.Runtime()

    context("Can check for availability") do
        @fact HSA.ExtFinalization.is_available() --> true
    end

    context("A Program") do
        context("Can be created") do
            @use p = Program() begin

                @fact isa(p, Program) --> true
                @fact p.handle.handle --> not(0)

            end
        end

        context("Can be queried") do
            @use p = Program(
                machine_model = HSA.MachineModelSmall,
                profile = HSA.ProfileFull,
                default_float_rounding_mode = HSA.DefaultFloatRoundingModeZero) begin

                @fact program_machine_model(p) --> HSA.MachineModelSmall
                @fact program_profile(p) --> HSA.ProfileFull
                @fact program_default_float_rounding_mode(p) -->
                    HSA.DefaultFloatRoundingModeZero

            end
        end
        context("Can be destroyed") do
            p = Program()

            finalize(p)

            @fact p.handle --> nothing
        end
    end

    finalize(rt)
end
