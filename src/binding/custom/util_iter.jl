# Helpers for wrapping iterate* methods like
# hsa_iterate_agents
# hsa_agent_iterate_regions

type IterState
    inner_cb::Function
    err::Nullable{Exception}

    IterState(cb) = new(cb, Nullable{Exception}())
end

function iterate_cb(x, state_ptr::Ptr{Void})
    # common initialization
    if state_ptr == C_NULL
        return HSA_STATUS_ERROR_INVALID_ARGUMENT
    else
        state = unsafe_pointer_to_objref(state_ptr)

        if !isa(state, IterState)
            return HSA_STATUS_ERROR_INVALID_ARGUMENT
        end
    end

    callback = state.inner_cb
    #end init

    wrapped_cb = () -> callback(x)

    return iterate_cb_common(wrapped_cb, state)
end

function iterate_cb(x,y, state_ptr::Ptr{Void})
    # common initialization
    if state_ptr == C_NULL
        return HSA_STATUS_ERROR_INVALID_ARGUMENT
    else
        state = unsafe_pointer_to_objref(state_ptr)

        if !isa(state, IterState)
            return HSA_STATUS_ERROR_INVALID_ARGUMENT
        end
    end

    callback = state.inner_cb
    #end init

    wrapped_cb = () -> callback(x,y)

    return iterate_cb_common(wrapped_cb, state)
end

function iterate_cb_common(callback::Function, state)
    local cont

    try
        cont = callback()
        if !isa(cont, Bool)
            cont = true
        end
    catch err
        state.err = err
        cont = false
    end

    if cont
        return HSA_STATUS_SUCCESS
    else
        return HSA_STATUS_INFO_BREAK
    end
end



