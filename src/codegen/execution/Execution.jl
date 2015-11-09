module Execution

using ..HSA

debug_print = HSA.debug_print

include("arguments.jl")
include("kernel.jl")
include("packet.jl")
include("hsa_kernel.jl")
end # module Execution

using .Execution

export @hsa
macro hsa(range, call)
    # support plain integer for 1D ranges
    if isa(range, Integer) || isa(range, Symbol)
        range = :(($range,))
    end

    if range.head != :tuple
        error("The first argument must be the range for the kernel as an integer (1D) or tuple")
    end

    if call.head != :call
        error("The second argument must be a simple call to a kernel function")
    end

    kernel = call.args[1]
    args = call.args[2:end]

    return quote
        cfg = get_or_init_defaults()
        agent = cfg.agent
        queue = cfg.queue

        call_args = Any[$([esc(a) for a in args]...)]
        kernel_args = prepare_args(call_args)
        arg_types = [ typeof(x) for x in kernel_args ]

        kernel_info = build_kernel(agent, $(esc(kernel)), arg_types)

        karg_memory = allocate_args(agent, kernel_info, kernel_args)

        signal = Signal(value = 1)
        packet = build_dispatch($(esc(range)), kernel_info, karg_memory, signal)

        # Enqueue Dispatch
        #idx = HSA.add_write_index!(queue, UInt64(1))
        idx = HSA.load_write_index(queue)

        queue[idx] = packet

        HSA.store_write_index!(queue, UInt64(idx + 1))

        HSA.store!(queue.doorbell_signal, Int64(idx))

        wait(signal, :(<), 1, wait_state_hint = HSA.HSA_WAIT_STATE_ACTIVE)

        cleanup_args(call_args)

        finalize(karg_memory)
        finalize(signal)
    end
end
