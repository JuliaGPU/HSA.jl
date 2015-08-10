type Config
	runtime::Runtime
	agent::Agent
	queue::Queue
end

const DefaultQueueSize = 32

global Defaults = Nullable{Config}()

function set_defaults(rt::Runtime;
	agent = nothing,
	queue = nothing)

	if agent == nothing
		# Prefer GPU Agents
		agents = HSA.all_agents(dev = HSA.DeviceTypeGpu)
		if isempty(agents)
			agents = HSA.all_agents()
		end

		agent = first(agents)
	end

	if queue == nothing
		max_q = HSA.agent_info_queue_max_size(agent)

		queue = Queue(agent, min(max_q, DefaultQueueSize), typ = HSA.QueueTypeSingle, error_callback = (s, q) -> begin
			str = HSA.status_string(s)
			println("QueueErrorHandler: ($s) -> $str")
		end)
	end

	cfg = Config(
			rt,agent,queue
		)

	Defaults = Nullable{Config}(cfg)

	return cfg
end

function set_defaults()
	rt = Runtime()

	set_defaults(rt)
end

function get_defaults()
	return get(Defaults)
end

function get_or_init_defaults()
	if isnull(Defaults)
		return set_defaults()
	else
		return get_defaults()
	end
end

function clear_defaults()
	Defaults = Nullable{Config}()
end
