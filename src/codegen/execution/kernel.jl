using ..HSA: hsa_executable_t, hsa_executable_symbol_t, BrigModuleHeader, hsa_isa_t

"Stores the necessary information about a kernel to later invoke it."
type KernelInfo
    func::Function
    argtypes::Array{DataType,1}
    executable::hsa_executable_t
    kernel_symbol::hsa_executable_symbol_t
    kernel_object
    kernarg_size
    group_size
    private_size

    function KernelInfo(executable, kernel::Function, types)
        kernel_symbol = find_kernel_symbol(executable, kernel)
        kernel_object = HSA.executable_symbol_info_kernel_object(kernel_symbol)
        kernarg_segment_size = HSA.executable_symbol_info_kernel_kernarg_segment_size(kernel_symbol)
        group_segment_size = HSA.executable_symbol_info_kernel_group_segment_size(kernel_symbol)
        private_segment_size = HSA.executable_symbol_info_kernel_private_segment_size(kernel_symbol)

        debug_print("""KernelInfo:
           $(string(kernel))($(join(types, ",")))
           kernel_object: $kernel_object
           kernarg: $kernarg_segment_size
           group: $group_segment_size
           private: $private_segment_size""")

        return new(
            kernel,
            types,
            executable,
            kernel_symbol,
            kernel_object,
            kernarg_segment_size,
            group_segment_size,
            private_segment_size)
    end
end


type KernelBlob
    brig::Ptr{BrigModuleHeader}
    executable_by_isa
    function KernelBlob(brig)
        new(brig, Dict{String, KernelInfo}())
    end
end

const kernel_cache = Dict{Tuple{Function, Array{DataType, 1}}, KernelBlob}()

function find_kernel_symbol(executable, kernel::Function)
    kernel_name = "&" * string(kernel)

    symbols = HSA.symbols(executable)
    for (symbol, symbol_name) in symbols
        if symbol_name == kernel_name
            return symbol
        end
    end

    warn("known symbols: $(join(map(x -> x[2], symbols))) ")
    error("symbol for kernel $kernel_name not found in given executable")
end

function build_kernel(agent, kernel, types)
    global kernel_cache

    debug_print("build_kernel: Kernel $(string(kernel))($(join(types,','))) for Agent '$(HSA.agent_info_name(agent))'")

    blob = get!(kernel_cache, (kernel, types)) do
        debug_print("build_kernel: build BRIG")
        KernelBlob(brig(kernel, types))
    end

    isa = HSA.agent_info_isa(agent)
    isa_name = HSA.isa_info_name(isa)
    debug_print("build_kernel: for ISA '$(isa_name)' ($(isa.handle))")

    kernel_info = get!(blob.executable_by_isa, isa_name) do
        debug_print("build_kernel: build Executable")
        code_object = finalize_brig(blob.brig, isa)

        executable = Executable()
        HSA.executable_load_code_object(executable, agent, code_object)

        HSA.executable_freeze(executable)

        return KernelInfo(executable, kernel, types)
    end

    return kernel_info
end

