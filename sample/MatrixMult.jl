using HSA

type Args
   ###
   # Clover generates code with additional nine parameters.
   # DWORDS 0-2: Number of work groups in each dimension (x,y,z)
   # DWORDS 3-5: Number of global work items in each dimension (x,y,z)
   # DWORDS 6-8: Number of work items within each work group in each dimensions
   #             (x,y,z)
   # DWORDS 9+ : Actual kernel parameters
   ###
  workgroup_count_x :: Uint32
  workgroup_count_y :: Uint32
  workgroup_count_z :: Uint32
  global_size_x :: Uint32
  global_size_y :: Uint32
  global_size_z :: Uint32
  workgroup_size_x :: Uint32
  workgroup_size_y :: Uint32
  workgroup_size_z :: Uint32
  input_matrix_a :: Ptr{Int}
  input_matrix_b :: Ptr{Int}
  output_matrix_c :: Ptr{Int}
  width_a :: Int
  width_b :: Int
end


const WIDTH = 10
const HEIGHT = 10

const k_file = "MatMul.cl.o"

rt = Runtime()

gpu_agents = HSA.all_agents(rt, dev = DeviceTypeGPU)

if length(gpu_agents) == 0
	error("No GPU Agent")
end

a = gpu_agents[1]

ai = HSA.agent_info(a)

println("Using Agent: $(ai.name)")

q = Queue(a, ai.queue_max_size, typ = QueueTypeMulti)

k_size = filesize(k_file)
k_stream = open(k_file)
k_bytes = readbytes(k_stream)
close(k_stream)

k_code_unit = HSA.ExtAMD.code_unit_load(k_bytes)
k_code = HSA.ExtAMD.code_unit_get_code(k_code_unit)

matrix_a = Matrix{Int}(HEIGHT, WIDTH)
rand!(matrix_a)
matrix_b = Matrix{Int}(WIDTH, HEIGHT)
rand!(matrix_b)
matrix_c = Matrix{Int}(HEIGHT, HEIGHT)

args = Args()
args.global_size_x = HEIGHT
args.global_size_y = HEIGHT
args.global_size_z = 1
args.workgroup_count_x = HEIGHT
args.workgroup_count_y = HEIGHT
args.workgroup_count_z = 1
args.workgroup_size_x = 1
args.workgroup_size_y = 1
args.workgroup_size_z = 1
args.input_matrix_a = convert(Ptr{Int}, matrix_a)
args.input_matrix_b = convert(Ptr{Int}, matrix_b)
args.output_matrix_c = convert(Ptr{Int}, matrix_c)
args.width_a = WIDTH
args.width_b = HEIGHT

completion_signal = Signal(rt, 1)

aqp = DispatchPacket()

aql.dimensions = 2;
aql.workgroup_size = (1, 1, 1)
aql.grid_size = (HEIGHT, HEIGHT, 1)
aql.header.acquire_fence_scope = HSA.FenceScopeSystem
aql.header.release_fence_scope = HSA.FenceScopeSystem
aql.header.barrier = true
aql.group_segment_size = 0
aql.private_segment_size = 0
aql.kernel_object_address = k_code
aql.completion_signal = completion_signal
aql.kernarg_address = convert(Ptr{Void}, args)

push!(q, aql)

wait(completion_signal, :(==), 0)

if (matrix_a * matrix_b) == matrix_c
	println("SUCCESS")
else
	println("FAIL")
end
