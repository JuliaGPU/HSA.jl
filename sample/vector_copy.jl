using HSA
using HSA.ExtFinalization

USE_CODEGEN = true

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

if !USE_CODEGEN
	# Load the precompiled .brig file containing the
	# kernel to be executed

	mod_bytes = open(readbytes, "vector_copy.brig")

	program = Program()
	check("Create the program")

	HSA.ExtFinalization.program_add_module(program, pointer(mod_bytes))
	check("Adding the brig module to the program")

	isa = HSA.agent_info_isa(agent)
	check("Query the agents isa")

	code_object = HSA.ExtFinalization.program_finalize(program, isa, 0)
	check("Finalizing the program")

	finalize(program)
	check("Destroying the program")
else # USE_CODEGEN
	# Use the HSAIL Code Generator to compile a
	# kernel function to BRIG
	import HSA.Intrinsics

	HSA.init_spir_codegen()

	@target spir function vector_copy_kernel(a::Ptr{Int64},b::Ptr{Int64})
		idx = get_global_id(0)

		x = Base.unsafe_load(b, idx)
        Base.unsafe_store!(a, x, idx)
	end

	code_spir(vector_copy_kernel, (Ptr{Int64}, Ptr{Int64}))

	HSA.destroy_spir_codegen()

	exit()
end

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
symbol = HSA.executable_get_symbol(executable,"&vector_copy_kernel")
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
if HSA.load(signal) != Uint64(1)
	error("incorrect signal value")
end
check("Verify initial signal value")

a_in = Array(Int, 1024*1024)
fill(a_in, 1)
HSA.memory_register(a_in, 1024*1024*4)
check("Registering argument memory for input parameter")

b_out = Array(Int, 1024*1024)
fill(b_out, 0)
HSA.memory_register(b_out, 1024*1024*4)
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

kernarg_address = convert(Ptr{Ptr{Int}}, HSA.memory_allocate(kernarg_region, kernarg_segment_size))
check("Allocating kernel argument memory buffer")
unsafe_store!(kernarg_address, pointer(a_in))
unsafe_store!(kernarg_address + sizeof(pointer(a_in)), pointer(b_out))

index = HSA.load_write_index(queue) # HSA.add_write_index!(queue, Uint64(1))

dispatch_packet = KernelDispatchPacket(1, 1024*1024, 256)
dispatch_packet.header.acquire_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
dispatch_packet.header.release_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
dispatch_packet.completion_signal = signal
dispatch_packet.kernel_object = kernel_object
dispatch_packet.kernarg_address = kernarg_address
dispatch_packet.private_segment_size = private_segment_size
dispatch_packet.group_segment_size = group_segment_size

queue[index] = dispatch_packet

HSA.store_write_index!(queue, Uint64(index + 1))
HSA.store!(queue.doorbell_signal, Int64(index))
check("Dispatching the kernel")

value = wait(signal, :(<), 1, wait_state_hint = HSA.HSA_WAIT_STATE_ACTIVE)
check("Waiting for the kernel")

valid=true
fail_index=0
for (i in 1:1024*1024)
	if (b_out[i]!=a_in[i])
		fail_index=i
		valid=0
		break
	end
end

if(valid)
	println("Passed validation.")
else
	println("VALIDATION FAILED!\nBad index: $fail_index\n")
end

finalize(signal)
finalize(executable)
finalize(code_object)
finalize(queue)
finalize(rt)
