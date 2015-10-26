module Test

include("util_macros.jl")
include("runtime.jl")
include("agent.jl")
include("signal.jl")
include("queue.jl")
include("aql.jl")
include("memory.jl")
include("ext_finalization.jl")
include("code.jl")
include("isa.jl")
include("intrinsics.jl")
include("emulation.jl")
if HSA.has_hsa_codegen()
include("execution.jl")
else
warn("codegen is unavailable: skipping 'Execution'")
end

end
