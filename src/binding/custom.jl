function getter(name::Symbol, argnames, argtypes, name_mangling, map)
    function is_type_tuple(t)
    	if !isa(t, ())
    		return false
    	end

    	for x in t
    		if !isa(x, DataType)
    			return false
    		end
    	end
    	return true
    end

    for key in keys(map)
    	getter_name = name_mangling(key)
        return_type = map[key]

    	local setup_code, convert_code

    	if return_type == String
              setup_code = :(value = Ptr{Uint8}[0])
    		convert_code = :(value = bytestring(value[1]))
    	elseif isa(return_type, Tuple)
            if is_type_tuple(return_type)
    		elseif length(return_type) == 2
    			t = return_type[1]
    			targ = return_type[2]

    			if t == String # max length string
    				setup_code = :(value = Array(Uint8, $targ))
             		convert_code = :(value = ascii(value))
    			end
    		end
    	else
    		setup_code = :(value = $return_type[0])
    		convert_code = :(value = value[1])
    	end

        ccall_args = [
    	    Expr(:tuple, Expr(:quote, name), :libhsa),
    		:hsa_status_t,
    		Expr(:tuple, argtypes...)
    	]
    	getter_args = []

    	# The last 2 arguments are discriminator and
    	# return arg respectively
    	for i in 1:size(argnames,1)-2
    		arg_name = argnames[i]
    		arg_type = argtypes[i]

    		arg_exp = :($arg_name :: $arg_type)

    		push!(ccall_args, arg_name)
    		push!(getter_args, arg_exp)
    	end

    	push!(ccall_args, key, :value)

    	getter_ccall = Expr(:ccall, ccall_args...)

        getter_code = Expr(:function,
    		    Expr(:call, symbol(getter_name), getter_args...),
    			quote
    				local value

    				$setup_code

    				err = $getter_ccall

    				test_status(err)

    				$convert_code

    				return value
    			end
    		)
        if endswith(getter_name, "name")
            println(getter_code)
        end

    	eval(getter_code)
    end
end

getter(:hsa_system_get_info,
    (:info, :data),
    (hsa_system_info_t, Ptr{Void}),
    n -> replace(lowercase(string(n)), "hsa_", ""),
    Dict(
    :HSA_SYSTEM_INFO_VERSION_MAJOR => Cushort,
    :HSA_SYSTEM_INFO_VERSION_MINOR => Cushort,
    :HSA_SYSTEM_INFO_TIMESTAMP => Culonglong,
    :HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY => Cushort,
    :HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT => Culonglong
    )
)

getter(:hsa_agent_get_info,
    (:agent, :info, :data),
    (hsa_agent_t, hsa_agent_info_t, Ptr{Void}),
    n -> replace(lowercase(string(n)), "hsa_", ""),
    Dict(
    :HSA_AGENT_INFO_NAME => (String,64),
    :HSA_AGENT_INFO_VENDOR_NAME => (String,64),
    :HSA_AGENT_INFO_FEATURE => hsa_agent_feature_t,
    :HSA_AGENT_INFO_WAVEFRONT_SIZE => Uint32,
#   :HSA_AGENT_INFO_WORKGROUP_MAX_DIM => (Uint16, Uint16, Uint16)
    :HSA_AGENT_INFO_WORKGROUP_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_GRID_MAX_DIM => hsa_dim3_t,
    :HSA_AGENT_INFO_GRID_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_FBARRIER_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_QUEUES_MAX => Uint32,
    :HSA_AGENT_INFO_QUEUE_MAX_SIZE => Uint32,
    :HSA_AGENT_INFO_QUEUE_TYPE => hsa_queue_type_t,
    :HSA_AGENT_INFO_NODE => Uint32,
    :HSA_AGENT_INFO_DEVICE => hsa_device_type_t,
#   :HSA_AGENT_INFO_CACHE_SIZE => (Uint32, Uint32, Uint32, Uint32),
    :HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM => hsa_dim3_t,
    :HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE => Uint32,
    :HSA_EXT_AGENT_INFO_IMAGE_RD_MAX => Uint32,
    :HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX => Uint32,
    :HSA_EXT_AGENT_INFO_SAMPLER_MAX => Uint32,
    )
)

function status_string(status::hsa_status_t)
    string = Ptr{Uint8}[0]
    err = ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,string)

    # manually test for error
    if err & HSA_STATUS_ERROR == HSA_STATUS_ERROR
    	# throw regular error to avoid recursion to HSAError
    	error("could not retrieve status string")
    end

    return bytestring(string[1])
end


