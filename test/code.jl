using HSA
using FactCheck

facts("Code Objects and Executables") do
    @use rt = NewRT() begin

		@with_agents context("The ISAs") do
			context("can be queried") do
				a = get_testagent()

				i_s_a = HSA.agent_info_isa(a)

				@fact isa(i_s_a, HSA.hsa_isa_t) => true
			end
		end

	end
end
