"""
Holds global defaults for runtime objects and setting
"""
type Config
    # runtime objects
    runtime::Runtime
    agent::Agent
    queue::Queue
    signal::Signal
    # config parameter defaults
    wait_state

    is_alive::Bool
end

const DefaultQueueSize = 32

const debug_output = false

function debug_print(args...)
    if debug_output
        println(args...)
    end
end

global Defaults = Nullable{Config}()

export set_defaults
function set_defaults(rt::Runtime;
    agent = nothing,
    queue = nothing)
    global Defaults

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

    signal = Signal()

    cfg = Config(
            # runtime objects
            rt,agent,queue,signal,
            # parameter defaults
            HSA.WaitStateBlocked,
            # is_alive
            true
        )

    Defaults = Nullable{Config}(cfg)

    finalizer(cfg, shutdown_managed)

    return cfg
end

function set_defaults()
    rt = Runtime()

    set_defaults(rt)
end

function get_defaults()
    return get(Defaults)
end

export get_or_init_defaults
function get_or_init_defaults()
    if isnull(Defaults) || !get_defaults().is_alive
        return set_defaults()
    else
        return get_defaults()
    end
end

export init_managed
init_managed() = get_or_init_defaults()

export clear_defaults
function clear_defaults()
    global Defaults
    shutdown_managed(Defaults)
    Defaults = Nullable{Config}()
end

function shutdown_managed(cfg)
    if isa(cfg, Nullable)
        if isnull(cfg)
            return
        else
            cfg = get(cfg)
        end
    elseif !isa(cfg, Config)
        error("cfg must be an HSA Config object to shut down")
    end

    if !cfg.is_alive
        return
    end

    # perform orderly shutdown of the referenced objects
    finalize(cfg.signal)
    finalize(cfg.agent)
    finalize(cfg.queue)
    finalize(cfg.runtime)
    cfg.is_alive = false
end



