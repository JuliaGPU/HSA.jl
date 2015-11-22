using HSA
using HSA.Execution
using HSA.ExtFinalization

import HSA.Execution: build_kernel, allocate_args, build_dispatch

iter = 100
arows = 100
acols = 100
wait_state = HSA.WaitStateBlocked

# allow overriding settings on the command line
if length(ARGS) > 0
    eval(parse(ARGS[1]))
end

script_dir = dirname(@__FILE__)

# mmul kernel implementations
include("$script_dir/../../test/kernels.jl")

total = @elapsed cfg = HSA.get_or_init_defaults()
println("Creating runtime objects took $(total)s")

cfg.wait_state = wait_state

println("Timing with parameters: iter=$iter, arows=$arows, acols=$acols, wait_state=$(cfg.wait_state)")

a = Array(Float64, arows, acols); rand!(a)
b = Array(Float64, acols, arows); rand!(b)
c = Array(Float64, arows, arows); rand!(c)

# Initialize Codegen
total = @elapsed HSA.init_codegen()
println("Codegen Initialization took $(total)s")

# Compile kernels
@hsa (arows) mmul(a,b,c,acols)
@hsa (arows, arows) mmul2d(a,b,c,acols)

# Measure execution
tic()
for i = 1:iter
    @hsa (arows, arows) mmul2d(a,b,c,acols)
end
total = toq()

println("Average runtime @hsa mmul2d: $(total/iter)s")

tic()
for i = 1:iter
    @hsa (arows) mmul(a,b,c,acols)
end
total = toq()

println("Average runtime @hsa mmul: $(total/iter)s")
# Run kernels outside of @hsa -------------------------------------------

# get the kernel binaries
ki_mmul = build_kernel(cfg.agent, mmul, [
    Ptr{Float64}, Ptr{Float64},Ptr{Float64},typeof(acols) ])
ki_mmul2d = build_kernel(cfg.agent, mmul2d, [
    Ptr{Float64}, Ptr{Float64},Ptr{Float64},typeof(acols) ])

karg_memory = allocate_args(cfg.agent, ki_mmul, [
    pointer(a), pointer(b), pointer(c), acols])

HSA.memory_register(pointer(a), sizeof(a))
HSA.memory_register(pointer(b), sizeof(b))
HSA.memory_register(pointer(c), sizeof(c))

queue = cfg.queue
signal = cfg.signal

# build packets
p_mmul = build_dispatch((arows,), ki_mmul, karg_memory, signal)
p_mmul2d = build_dispatch((arows,arows), ki_mmul2d, karg_memory, signal)

idx = HSA.load_write_index(queue)

tic()

for i = 1:iter
    HSA.store!(signal, 1)
    queue[idx] = p_mmul
    HSA.store_write_index!(queue, UInt64(idx + 1))
    HSA.store!(queue.doorbell_signal, Int64(idx))
    idx = idx + 1
    wait(signal, :(<), 1, wait_state_hint = cfg.wait_state)
end

total = toq()
println("Average runtime plain mmul: $(total/iter)s")

tic()

for i = 1:iter
    HSA.store!(signal, 1)
    queue[idx] = p_mmul2d
    HSA.store_write_index!(queue, UInt64(idx + 1))
    HSA.store!(queue.doorbell_signal, Int64(idx))
    idx = idx + 1
    wait(signal, :(<), 1, wait_state_hint = cfg.wait_state)
end

total = toq()
println("Average runtime plain mmul2d: $(total/iter)s")

# Run kernels compiled offline ------------------------------------------
isa = HSA.agent_info_isa(cfg.agent)

# Load the BRIG files
# and finalize the kernel
function load_brig(path)
    bytes = open(readbytes, path)
    brig = pointer(bytes)
    program = Program()
    program_add_module(program, brig)
    co = program_finalize(program, isa, 0)
    finalize(program)
    ex = Executable()
    HSA.executable_load_code_object(ex, cfg.agent, co)
    HSA.executable_freeze(ex)
    symbols = HSA.symbols(ex)
    (sym, name) = last(symbols)
    ko = HSA.executable_symbol_info_kernel_object(sym)
    kernarg_segment_size = HSA.executable_symbol_info_kernel_kernarg_segment_size(sym)
    group_segment_size = HSA.executable_symbol_info_kernel_group_segment_size(sym)
    private_segment_size = HSA.executable_symbol_info_kernel_private_segment_size(sym)

    return (ko, (kernarg_segment_size, group_segment_size, private_segment_size))
end

path_mmul1d = joinpath(script_dir, "mmul1d.brig")
path_mmul2d = joinpath(script_dir, "mmul2d.brig")

(ko_mmul1d, sizes_mmul1d) = load_brig(path_mmul1d)
(ko_mmul2d, sizes_mmul2d) = load_brig(path_mmul2d)

@assert sizes_mmul1d == sizes_mmul2d

regions = HSA.regions(cfg.agent)

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

kernarg_region = regions[karg_region_idx]

immutable Args
    a::Ptr{Int}
    b::Ptr{Int}
    c::Ptr{Int}
    acols::Int
end

kernargs = Args(pointer(a), pointer(b), pointer(c), acols)

alloc = HSA.memory_allocate(kernarg_region, sizes_mmul1d[1])

kernarg_address = convert(Ptr{Args}, alloc.ptr)
unsafe_store!(kernarg_address, kernargs)

index = HSA.load_write_index(queue)

dispatch_packet = KernelDispatchPacket(ko_mmul1d,arows;
    kernarg_address = kernarg_address,
    private_segment_size = sizes_mmul1d[3],
    group_segment_size = sizes_mmul1d[2],
    completion_signal = cfg.signal
)
dispatch_packet.header.acquire_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
dispatch_packet.header.release_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM

tic()

for i = 1:iter
    HSA.store!(signal, 1)
    queue[index] = dispatch_packet

    HSA.store_write_index!(queue, UInt64(index + 1))
    HSA.store!(queue.doorbell_signal, Int64(index))

    wait(signal, :(<), 1, wait_state_hint = cfg.wait_state)

    index = index+1
end

total = toq()
println("Average runtime BRIG mmul1d: $(total/iter)s")

dispatch_packet.kernel_object = convert(UInt64, ko_mmul2d)

dispatch_packet.grid_size_y = arows
dispatch_packet.dimensions = 2

tic()

for i = 1:iter
    HSA.store!(signal, 1)
    queue[index] = dispatch_packet

    HSA.store_write_index!(queue, UInt64(index + 1))
    HSA.store!(queue.doorbell_signal, Int64(index))

    wait(signal, :(<), 1, wait_state_hint = cfg.wait_state)

    index = index+1
end

total = toq()
println("Average runtime BRIG mmul2d: $(total/iter)s")

# run the BRIG kernel via @hsa

ki_mmul.kernel_object = ko_mmul1d
ki_mmul2d.kernel_object = ko_mmul2d

tic()
for i = 1:iter
    @hsa (arows, arows) mmul2d(a,b,c,acols)
end
total = toq()

println("Average runtime BRIG @hsa mmul2d: $(total/iter)s")

tic()
for i = 1:iter
    @hsa (arows) mmul(a,b,c,acols)
end
total = toq()
println("Average runtime BRIG @hsa mmuld: $(total/iter)s")
