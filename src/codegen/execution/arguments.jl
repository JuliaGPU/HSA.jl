function convert_arg(arr::AbstractArray) pointer(arr) end
function prepare_arg(arr::AbstractArray) HSA.memory_register(arr, sizeof(arr)) end
function cleanup_arg(arr::AbstractArray) HSA.memory_deregister(arr, sizeof(arr)) end

function convert_arg(x) x end
function prepare_arg(x) end
function cleanup_arg(x) end

export prepare_args
function prepare_args(args)
    kernel_args = [ convert_arg(a) for a in args ]

    for a in args
        prepare_arg(a)
    end

    return kernel_args
end

export cleanup_args
function cleanup_args(args)
    for a in args
        cleanup_arg(a)
    end
end

export allocate_args
function allocate_args(agent, kernel_info, kernel_args)
    karg_size = kernel_info.kernarg_size

    # returned kernarg_segment_size seems to be wrong, calculate from arguments
    karg_size = sum(kernel_args) do x
        sizeof(x)
    end

    debug_print("allocate_args: Allocate $karg_size bytes of kernarg memory for $(string(kernel_info.func))")

    karg_region = find_kernarg_region(agent)

    karg_mem = HSA.memory_allocate(karg_region, karg_size)

    arg_offset = 0
    for i = 1:size(kernel_args, 1)
        a = kernel_args[i]
        arg_size = sizeof(a)

        if (arg_offset + arg_size) > karg_size
            error("Kernel Argument overflow at argument index $i, offset $arg_offset with kernarg_size $karg_size")
        end

        typed_ptr = convert(Ptr{typeof(a)}, karg_mem.ptr + arg_offset);

        unsafe_store!(typed_ptr, a)

        arg_offset += arg_size
    end

    return karg_mem
end

function find_kernarg_region(agent)
    regions = HSA.regions(agent)

    karg_region_idx = findfirst(r -> begin
        segment = HSA.region_info_segment(r)
        if (HSA.HSA_REGION_SEGMENT_GLOBAL != segment)
            return false
        end

        flags = HSA.region_info_global_flags(r)
        if (flags & HSA.HSA_REGION_GLOBAL_FLAG_KERNARG) != 0
            return true
        end

        return false
    end, regions)
    if karg_region_idx == 0
        error("No Kernarg Region found")
    end

    return regions[karg_region_idx]
end
