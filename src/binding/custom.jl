function getter_name_from_symbol(sym)
    name = lowercase(string(sym))

	if startswith(name, "hsa_")
		name = replace(name, "hsa_", "")
	end

    return symbol(name)
end

function getter(name, argtypes, map)
	for key in keys(map)
		getter_name = getter_name_from_symbol(key)
        return_type = map[key]
        name_sym = string(name)

		getter_code = quote
            function $getter_name ()
                value = $return_type[0]

				err = ccall(($name_sym, libhsa),hsa_status_t,$argtypes,$key,value)

				test_status(err)

				return value[1]
			end
		end

		eval(getter_code)
	end
end

getter(:hsa_system_get_info,
    :(hsa_system_info_t, Ptr{Void}),
    Dict(
    :HSA_SYSTEM_INFO_VERSION_MAJOR => Cushort,
    :HSA_SYSTEM_INFO_VERSION_MINOR => Cushort,
	:HSA_SYSTEM_INFO_TIMESTAMP => Culonglong,
	:HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY => Cushort,
    :HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT => Culonglong
	)
)

function status_string(status::hsa_status_t)
    string = Ptr{Uint8}[0]
	err = ccall((:hsa_status_string,"libhsa"),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,string)

	# manually test for error
	if err & HSA_STATUS_ERROR == HSA_STATUS_ERROR
		# throw regular error to avoid recursion to HSAError
		error("could not retrieve status string")
	end

	return bytestring(string[1])
end
