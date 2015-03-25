

function getter_code_for(var :: Symbol, return_type)
    local setup_code, convert_code

    if return_type == String
        setup_code = :($var = Ptr{Uint8}[0])
        convert_code = :($var = bytestring($var[1]))
    elseif return_type == hsa_dim3_t
        setup_code = :($var = Array(Uint32, 3))
        convert_code = :($var = convert(hsa_dim3_t, $var))
    elseif isa(return_type, Tuple)
        if return_type == ()
            error("return type spec may not be the empty tuple")
        elseif is_type_tuple(return_type)
            if all(x -> x == first(return_type), return_type)
                # tuple of all the same types
                el_type = first(return_type)
                el_count = length(return_type)

                setup_code = :($var = Array($el_type, $el_count))
                convert_code = :($var = tuple($var...))
            else
                error("heterogeneous tuple return type is unsupported")
            end
        elseif length(return_type) == 2
            t = return_type[1]
            targ = return_type[2]

            if t == String # max length string
                setup_code = :($var = Array(Uint8, $targ))
                convert_code = :($var = ascii($var))
            end
        end
    else
        setup_code = :($var = Array($return_type,1))
        convert_code = :($var = $var[1])
    end

    return setup_code, convert_code
end

function is_type_tuple(t)
    if !isa(t, Tuple)
        return false
    end

    for x in t
        if !isa(x, DataType)
            return false
        end
    end
    return true
end

function getter_name(discrim :: Symbol)
    replace(lowercase(string(discrim)), "hsa_", "")
end


function getter(c_name::Symbol, argnames, argtypes, map)
   for key in keys(map)
        jl_name = getter_name(key)
        return_type = map[key]

        setup_code, convert_code = getter_code_for(:value, return_type)

        ccall_args = [
            Expr(:tuple, Expr(:quote, c_name), :libhsa),
            :hsa_status_t,
            Expr(:tuple, argtypes...)
        ]
        getter_args = []

        # The last 2 arguments are discriminator and
        # return arg respectively
        for i in 1:size(argnames,1)-2
            arg_name = argnames[i]
            arg_type = argtypes[i]
            arg_type = get(argtype_map, symbol(arg_type), arg_type)

            arg_exp = :($arg_name :: $arg_type)

            push!(ccall_args, arg_name)
            push!(getter_args, arg_exp)
        end

        push!(ccall_args, key, :value)

        getter_ccall = Expr(:ccall, ccall_args...)

        getter_code = Expr(:function,
                Expr(:call, symbol(jl_name), getter_args...),
                quote
                    local value

                    $setup_code

                    err = $getter_ccall

                    test_status(err)

                    $convert_code

                    return value
                end
            )

        # Debug output of generated code
        if false && endswith(jl_name, "max_dim")
            println(getter_code)
        end

        eval(getter_code)
    end
end

function field_getter(
    prefix :: Symbol,
    struct_type :: DataType,
    map :: Dict{Symbol, (DataType, Int64)})
    for key in keys(map)
        jl_name = symbol(prefix, key)
        field_type, field_offset = map[key]
        field_offset = convert(Uint64, field_offset)

        getter_code = quote
            function $jl_name(ptr::Ptr{$struct_type})
                field_ptr = convert(Ptr{$field_type}, ptr + $field_offset)
                return unsafe_load(field_ptr)
               end
        end

        # Debug output of generated code
        if false && endswith(string(jl_name), "size")
            println(getter_code)
        end

        eval(getter_code)
    end
end


