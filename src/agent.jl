export DeviceTypeCPU, DeviceTypeGPU, DeviceTypeDSP

const DeviceTypeCPU = HSA_DEVICE_TYPE_CPU
const DeviceTypeGPU = HSA_DEVICE_TYPE_GPU
const DeviceTypeDSP = HSA_DEVICE_TYPE_DSP

export Agent

type Agent
	runtime :: Runtime
    handle :: hsa_agent_t

    function Agent(r :: Runtime, h :: hsa_agent_t)
		if !r.is_alive
			error("Invalid Runtime reference")
		end

		new(r, h)
	end
end

import Base.convert

convert(::Type{hsa_agent_t}, a :: Agent) = a.handle

# Iterate Agents
const iterate_agents_cb_ptr = cfunction(iterate_cb, hsa_status_t, (hsa_agent_t, Ptr{Void}))

function iterate_agents(rt::Runtime, callback::Function)
    state = IterState(
	    function(x)
			a = Agent(rt, x)
			callback(a)
		end)

	state_ptr = pointer_from_objref(state)

	err = ccall((:hsa_iterate_agents, libhsa), hsa_status_t, (Ptr{Void}, Ptr{Void}),
	    iterate_agents_cb_ptr, state_ptr)

	if !isnull(state.err)
		rethrow(state.err.value)
	end

	test_status(err)
end

function all_agents(rt :: Runtime;
	feat :: hsa_agent_feature_t = (hsa_agent_feature_t)(0),
	dev :: hsa_device_type_t = (hsa_device_type_t)(0))
	agents = Array(HSA.Agent,0)

    filter_agents = a -> begin
	    a_feat = HSA.agent_info_feature(a)
		a_dev = HSA.agent_info_device(a)
	    if a_feat & feat == feat &&
	     	a_dev & dev == dev
		    push!(agents, a)
	    end
		true # continue
	end

 	HSA.iterate_agents(rt, filter_agents)

	return agents
end

getter(:hsa_agent_get_info,
    (:agent, :info, :data),
    (hsa_agent_t, hsa_agent_info_t, Ptr{Void}),
    Dict(
    :HSA_AGENT_INFO_NAME => (String,64),
    :HSA_AGENT_INFO_VENDOR_NAME => (String,64),
    :HSA_AGENT_INFO_FEATURE => hsa_agent_feature_t,
    :HSA_AGENT_INFO_WAVEFRONT_SIZE => Uint32,
    :HSA_AGENT_INFO_WORKGROUP_MAX_DIM => (Uint16, Uint16, Uint16),
    :HSA_AGENT_INFO_WORKGROUP_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_GRID_MAX_DIM => hsa_dim3_t,
    :HSA_AGENT_INFO_GRID_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_FBARRIER_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_QUEUES_MAX => Uint32,
    :HSA_AGENT_INFO_QUEUE_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_QUEUE_TYPE => hsa_queue_type_t,
    :HSA_AGENT_INFO_NODE => Uint32,
    :HSA_AGENT_INFO_DEVICE => hsa_device_type_t,
    :HSA_AGENT_INFO_CACHE_SIZE => (Uint32, Uint32, Uint32, Uint32),
    :HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE => Uint32,
    :HSA_EXT_AGENT_INFO_IMAGE_RD_MAX => Uint32,
    :HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX => Uint32,
    :HSA_EXT_AGENT_INFO_SAMPLER_MAX => Uint32,
    )
)

type AgentInfo
	agent :: Agent
	name :: String
	vendor_name :: String
	feature :: hsa_agent_feature_t
    wavefront_size :: Uint32
	workgroup_max_dim :: (Uint16, Uint16, Uint16)
	workgroup_max_size :: Uint32
	grid_max_dim :: hsa_dim3_t
	grid_max_size :: Uint32
	fbarrier_max_size :: Uint32
	queues_max :: Uint32
	queue_max_size :: Uint32
	queue_type :: hsa_queue_type_t
	node :: Uint32
	device :: hsa_device_type_t
	cache_size :: (Uint32,Uint32,Uint32,Uint32)
end

function AgentInfo(a :: Agent)
	AgentInfo(
	    a,
		agent_info_name(a),
		agent_info_vendor_name(a),
		agent_info_feature(a),
		agent_info_wavefront_size(a),
		agent_info_workgroup_max_dim(a),
		agent_info_workgroup_max_size(a),
		agent_info_grid_max_dim(a),
		agent_info_grid_max_size(a),
		agent_info_fbarrier_max_size(a),
		agent_info_queues_max(a),
		agent_info_queue_max_size(a),
		agent_info_queue_type(a),
		agent_info_node(a),
		agent_info_device(a),
		agent_info_cache_size(a)
	)
end

agent_info(a::Agent) = AgentInfo(a)


