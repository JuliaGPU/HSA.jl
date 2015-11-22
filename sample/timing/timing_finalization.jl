using HSA
using HSA.ExtFinalization

iter = 100

script_dir = dirname(@__FILE__)

cfg = HSA.get_or_init_defaults()

println("Timing with parameters: iter=$iter")

# Run kernels compiled offline ------------------------------------------
isa = HSA.agent_info_isa(cfg.agent)

function time_finalization(path)
    bytes = open(readbytes, path)
    brig = pointer(bytes)

    println("Finalizing $path")

    tic()

    for i = 1:iter
        # finalize BRIG
        program = Program()
        program_add_module(program, brig)
        co = program_finalize(program, isa, 0)
        finalize(program)

        # build Executable
        ex = Executable()
        HSA.executable_load_code_object(ex, cfg.agent, co)
        HSA.executable_freeze(ex)

        # get kernel info
        symbols = HSA.symbols(ex)
        (sym, name) = last(symbols)
        ko = HSA.executable_symbol_info_kernel_object(sym)
        kernarg_segment_size = HSA.executable_symbol_info_kernel_kernarg_segment_size(sym)
        group_segment_size = HSA.executable_symbol_info_kernel_group_segment_size(sym)
        private_segment_size = HSA.executable_symbol_info_kernel_private_segment_size(sym)
    end

    total = toq()

    println("took an average of $(total/iter)")
end

path_mmul1d = joinpath(script_dir, "mmul1d.brig")
time_finalization(path_mmul1d)
path_mmul2d = joinpath(script_dir, "mmul2d.brig")
time_finalization(path_mmul2d)
