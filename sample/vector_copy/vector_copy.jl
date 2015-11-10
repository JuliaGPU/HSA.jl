using HSA
using HSA.ExtFinalization

USE_CODEGEN = false

function check(message)
	println("✓ $message")
end

rt = Runtime()
check("Initializing the hsa runtime")

gpus = HSA.all_agents(dev = HSA.DeviceTypeGpu)
if isempty(gpus)
	println("No GPU Agent found")
	exit(1)
end
check("Getting a gpu agent")

agent = gpus[1]

name = HSA.agent_info_name(agent)
check("Querying the agent name")
println("The agent name is $name.")

queue_size = HSA.agent_info_queue_max_size(agent)
check("Querying the agent maximum queue size")
println("The maximum queue size is $queue_size.")

queue = Queue(agent, queue_size, typ = HSA.QueueTypeSingle, error_callback = (s, q) -> begin
    str = HSA.status_string(s)
	println("($s) : $str")
end)
check("Creating the queue")

brig_ptr = C_NULL

if !USE_CODEGEN
	# Load the precompiled .brig file containing the
	# kernel to be executed

    script_path = dirname(@__FILE__)
    brig_path = joinpath(script_path, "vector_copy.brig")
	mod_bytes = open(readbytes, brig_path)

	brig_ptr = pointer(mod_bytes)
else # USE_CODEGEN
	# Use the HSAIL Code Generator to compile a
	# kernel function to BRIG
	import HSA.Intrinsics

	@hsa_kernel function vector_copy_kernel(a::Ptr{Int64},b::Ptr{Int64})
		idx = get_global_id(Int32(0)) + 1

		x = Base.unsafe_load(b, idx)
        Base.unsafe_store!(a, x, idx)
		return nothing
	end

	println(HSA.Compilation.src_hsail(vector_copy_kernel, Tuple{Ptr{Int64}, Ptr{Int64}}))

	brig_ptr = HSA.Compilation.brig(vector_copy_kernel, Tuple{Ptr{Int64}, Ptr{Int64}})
    assert(brig_ptr != C_NULL)
	check("Compile Kernel to BRIG")
end

program = Program()
check("Create the program")

HSA.ExtFinalization.program_add_module(program, brig_ptr)
check("Adding the brig module to the program")

isa = HSA.agent_info_isa(agent)
check("Query the agents isa")

code_object = HSA.ExtFinalization.program_finalize(program, isa, 0)
check("Finalizing the program")

finalize(program)
check("Destroying the program")

executable = Executable()
check("Create the executable")

HSA.executable_load_code_object(executable, agent, code_object)
check("Loading the code object")

HSA.executable_freeze(executable)
check("Freeze the executable")

println("Symbols in the executable:")
symbols = HSA.symbols(executable)
last_symbol_name = ""
last_symbol = ""
for (s, n) in symbols
	m = HSA.executable_symbol_info_module_name(s)
	println("$m :: $n")

	last_symbol_name = n
	last_symbol = s
end

symbol = last_symbol
try
	symbol = HSA.executable_get_symbol(executable,last_symbol_name)
catch ex
	warn("expected kernel symbol '$last_symbol_name' not found, using any symbol in the executable\n Exception: $ex")

end
check("Extract the symbol from the executable")

kernel_object = HSA.executable_symbol_info_kernel_object(symbol)
check("Extracting the symbol from the executable")
kernarg_segment_size = HSA.executable_symbol_info_kernel_kernarg_segment_size(symbol)
check("Extracting the kernarg segment size from the executable")
group_segment_size = HSA.executable_symbol_info_kernel_group_segment_size(symbol)
check("Extracting the group segment size from the executable")
private_segment_size = HSA.executable_symbol_info_kernel_private_segment_size(symbol)
check("Extracting the private segment from the executable")

signal = Signal(value = 1)
check("Creating a HSA signal")
if HSA.load(signal) != UInt64(1)
	error("incorrect signal value")
end
check("Verify initial signal value")

const N = 16

a_in = Array(Int, N)
fill!(a_in, 1)
HSA.memory_register(a_in, sizeof(a_in))
check("Registering argument memory for input parameter")

b_out = Array(Int, N)
fill!(b_out, 0)
HSA.memory_register(b_out, sizeof(b_out))
check("Registering argument memory for output parameter")

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
kernarg_region = regions[karg_region_idx]
check("Finding a kernarg memory region")

alloc = HSA.memory_allocate(kernarg_region, kernarg_segment_size)
kernarg_address = convert(Ptr{Ptr{Int}}, alloc.ptr)
check("Allocating kernel argument memory buffer of size $kernarg_segment_size")
unsafe_store!(kernarg_address, pointer(a_in))
unsafe_store!(kernarg_address + sizeof(pointer(a_in)), pointer(b_out))

index = HSA.load_write_index(queue) # HSA.add_write_index!(queue, UInt64(1))

dispatch_packet = KernelDispatchPacket(kernel_object,N;
    kernarg_address = kernarg_address,
    private_segment_size = private_segment_size,
    group_segment_size = group_segment_size,
    completion_signal = signal
)
dispatch_packet.header.acquire_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
dispatch_packet.header.release_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM

pkg_bytes = Array(UInt8, 64)
unsafe_store!(convert(Ptr{Void}, pointer(pkg_bytes)), dispatch_packet)

println("""
    Header: $(pkg_bytes[1:2])
    Setup: $(pkg_bytes[3:4])
    Workgroup X: $(pkg_bytes[5:6])
	""")

queue[index] = dispatch_packet

HSA.store_write_index!(queue, UInt64(index + 1))
HSA.store!(queue.doorbell_signal, Int64(index))
check("Dispatching the kernel")

value = 1
while value != 0
value = wait(signal, :(<), 1, wait_state_hint = HSA.HSA_WAIT_STATE_ACTIVE)
check("Waiting for the kernel")
end

failed = 0
for (i in 1:N)
	if (b_out[i]!=a_in[i])
		failed = failed + 1

		if failed > 10
			println("...")
			break
		end

        println("Bad index: $i\n$(a_in[i]) --> $(b_out[i])")
	end
end

if(failed == 0)
	println("Passed validation.")
else
	println("VALIDATION FAILED!\n")
end

finalize(signal)
finalize(executable)
finalize(code_object)
finalize(queue)
finalize(rt)
