const var = :value

type GetterSpec
    name
    argnames
    argtypes

    attr_idx
    index_idx

    result_specs

    # Simple validating constructor
    function GetterSpec(name, argnames, argtypes, attr_idx = 2, index_idx = 3;
        result_specs = Dict())
        namelen = length(argnames)
        typelen = length(argtypes)
        @assert namelen == typelen
        # Support for the following call signatures:
        # getter(attr, value)
        # getter(obj, attr, value)
        # getter(obj, attr, index, value)
        @assert namelen >= 2 && namelen <= 4

        if namelen <= 3
            index_idx = nothing
        end

        new(name, argnames, argtypes, attr_idx, index_idx, result_specs)
    end
end

type ResultSpec
    eltype
    count
    indexed

    function ResultSpec(eltype, count = 1;
        indexed = false
        )
        return new(eltype, count, indexed)
    end
end

type Getter
    signature
    setup_code
    c_call
    convert_code

    function Getter(getter_spec, key)
        signature = getter_signature(getter_spec, key)
        setup_code, convert_code = getter_code(getter_spec, key)
        c_call = getter_ccall(getter_spec, key)

        return new(signature, setup_code, c_call, convert_code)
    end
end

import Base.convert

function convert(::Type{Expr}, g :: Getter)
    return Expr(:function,
        g.signature,
        quote
            $(g.setup_code)
            err = $(g.c_call)

            test_status(err)

            $(g.convert_code)
        end)
end

function getter_name(discrim :: Symbol)
    replace(lowercase(string(discrim)), "hsa_", "")
end

function getter_code(getter_spec, key)
    result_spec = getter_spec.result_specs[key]

    getter_code(getter_spec, Val{result_spec.eltype}, result_spec.count)
end

# max size Array
function getter_code(getter_spec, eltype, count :: Int)
    t = eltype.parameters[1]

    if count == 1
        return :($var = Ref{$t}(Base.zero($t))),
            :($var = $var.x)
    else
        return :(v_arr = Array($t, $count);
                 $var = pointer(v_arr)),
            :($var = v_arr)
    end
end

function getter_code(getter_spec, eltype :: Type{Val{AbstractString}}, count :: Int)
    if count == 1
        # not a single character but a string constant
        return :($var = Ptr{UInt8}[0]),
            :($var = bytestring($var[1]))
    else
        # max size string
        return :($var = Array(UInt8, $count)),
            :($var = strip(ascii($var), '\0'))
    end
end

function getter_code(getter_spec, eltype :: Type{Val{AbstractString}}, count :: Symbol)
    # AbstractString with separate length getter
    len_sig = getter_signature(getter_spec, count)

    return :(len = $len_sig;
        $var = Array(UInt8, len)),
        :($var = strip(ascii($var), '\0'))
end

function getter_signature(getter_spec, key)
    name = getter_name(key)
    argnames = getter_spec.argnames
    result_spec = getter_spec.result_specs[key]

    signature = Expr(:call, symbol(name))

    # last one is presumed to be the output arg
    for i in 1:length(argnames) - 1
        arg_name = argnames[i]

       if (i != getter_spec.index_idx || result_spec.indexed) && # only emit index argument if it is necessary
           (i != getter_spec.attr_idx) # attr argument is superfluous

           push!(signature.args, arg_name)
       end
    end

    return signature
end

function getter_ccall(getter_spec, key)
    c_name = getter_spec.name
    argnames = getter_spec.argnames
    argtypes = getter_spec.argtypes
    result_spec = getter_spec.result_specs[key]

    ccall_args = [
        Expr(:tuple, Expr(:quote, c_name), :libhsa),
        :hsa_status_t,
        Expr(:tuple, argtypes...)
    ]

    for i in 1:length(argnames) - 1
        arg_name = argnames[i]

        if i == getter_spec.index_idx
            if result_spec.indexed
                push!(ccall_args, arg_name)
            else
                arg_type = argtypes[i]
                push!(ccall_args, :(Base.zero($arg_type)))
            end
        elseif i == getter_spec.attr_idx
            push!(ccall_args, key)
        else
            push!(ccall_args, arg_name)
        end
    end

    # output argument
    push!(ccall_args, var)

    return Expr(:ccall, ccall_args...)
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


function getter(c_name::Symbol, argnames, argtypes, map)
   for key in keys(map)
        jl_name = getter_name(key)
        return_type = map[key]

        setup_code, convert_code = getter_code_for(:value, return_type)

        getter_args = []


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

        push!(obuf, getter_code)
    end
end

const getters = []

push!(getters,
    GetterSpec(
        :hsa_system_get_info,
        (:info, :data),
        (:hsa_system_info_t, Ptr{Void}),
        1, nothing,
        result_specs = Dict(
            :HSA_SYSTEM_INFO_VERSION_MAJOR => ResultSpec(Cushort),
            :HSA_SYSTEM_INFO_VERSION_MINOR => ResultSpec(Cushort),
            :HSA_SYSTEM_INFO_TIMESTAMP => ResultSpec(Culonglong),
            :HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY => ResultSpec(Cushort),
            :HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT => ResultSpec(Culonglong),
            :HSA_SYSTEM_INFO_ENDIANNESS => ResultSpec(:hsa_endianness_t),
            :HSA_SYSTEM_INFO_MACHINE_MODEL => ResultSpec(:hsa_machine_model_t),
            :HSA_SYSTEM_INFO_EXTENSIONS => ResultSpec(UInt8, 128)
        )
    )
)

push!(getters,
    GetterSpec(
        :hsa_agent_get_info,
        (:agent, :info, :data),
        (:hsa_agent_t, :hsa_agent_info_t, Ptr{Void}),
        result_specs = Dict(
            :HSA_AGENT_INFO_NAME => ResultSpec(AbstractString,64),
            :HSA_AGENT_INFO_VENDOR_NAME => ResultSpec(AbstractString,64),
            :HSA_AGENT_INFO_FEATURE => ResultSpec(:hsa_agent_feature_t),
            :HSA_AGENT_INFO_MACHINE_MODEL => ResultSpec(:hsa_machine_model_t),
            :HSA_AGENT_INFO_PROFILE => ResultSpec(:hsa_profile_t),
            :HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE => ResultSpec(:hsa_default_float_rounding_mode_t),
            :HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES => ResultSpec(:hsa_default_float_rounding_mode_t),
            :HSA_AGENT_INFO_FAST_F16_OPERATION => ResultSpec(Bool),
            :HSA_AGENT_INFO_WAVEFRONT_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_WORKGROUP_MAX_DIM => ResultSpec(Tuple{UInt16, UInt16, UInt16}),
            :HSA_AGENT_INFO_WORKGROUP_MAX_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_GRID_MAX_DIM => ResultSpec(:hsa_dim3_t),
            :HSA_AGENT_INFO_GRID_MAX_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_FBARRIER_MAX_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_QUEUES_MAX => ResultSpec(UInt32),
            :HSA_AGENT_INFO_QUEUE_MIN_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_QUEUE_MAX_SIZE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_QUEUE_TYPE => ResultSpec(:hsa_queue_type_t),
            :HSA_AGENT_INFO_NODE => ResultSpec(UInt32),
            :HSA_AGENT_INFO_DEVICE => ResultSpec(:hsa_device_type_t),
            :HSA_AGENT_INFO_CACHE_SIZE => ResultSpec(Tuple{UInt32, UInt32, UInt32, UInt32}),
            :HSA_AGENT_INFO_ISA => ResultSpec(:hsa_isa_t),
            :HSA_AGENT_INFO_EXTENSIONS => ResultSpec(UInt8, 128),
            :HSA_AGENT_INFO_VERSION_MAJOR => ResultSpec(UInt16),
            :HSA_AGENT_INFO_VERSION_MINOR => ResultSpec(UInt16),
            :HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM => ResultSpec(:hsa_dim3_t),
            :HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM => ResultSpec(:hsa_dim3_t),
            :HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM => ResultSpec(:hsa_dim3_t),
            :HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE => ResultSpec(UInt32),
            :HSA_EXT_AGENT_INFO_IMAGE_RD_MAX => ResultSpec(UInt32),
            :HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX => ResultSpec(UInt32),
            :HSA_EXT_AGENT_INFO_SAMPLER_MAX => ResultSpec(UInt32),
        )
    )
)

push!(getters,
    GetterSpec(
        :hsa_region_get_info,
        (:region, :attribute, :value),
        (:hsa_region_t, :hsa_region_info_t, Ptr{Void}),
        result_specs = Dict(
            :HSA_REGION_INFO_SEGMENT => ResultSpec(:hsa_region_segment_t),
            :HSA_REGION_INFO_GLOBAL_FLAGS => ResultSpec(:hsa_region_global_flag_t),
            :HSA_REGION_INFO_SIZE => ResultSpec(Csize_t),
            :HSA_REGION_INFO_ALLOC_MAX_SIZE => ResultSpec(Csize_t),
            :HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED => ResultSpec(Bool),
            :HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE => ResultSpec(Csize_t),
            :HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT => ResultSpec(Csize_t),
        )
    )
)


push!(getters,
    GetterSpec(
        :hsa_isa_get_info,
        (:isa, :attribute, :index, :value),
        (:hsa_isa_t, :hsa_isa_info_t, UInt32, Ptr{Void}),
        result_specs = Dict(
            :HSA_ISA_INFO_NAME_LENGTH => ResultSpec(UInt32),
            :HSA_ISA_INFO_NAME => ResultSpec(AbstractString, :HSA_ISA_INFO_NAME_LENGTH)
        )
    )
)

push!(getters,
    GetterSpec(
        :hsa_executable_get_info,
        (:executable, :attribute, :value),
        (:hsa_executable_t, :hsa_executable_info_t, Ptr{Void}),
        result_specs = Dict(
            :HSA_EXECUTABLE_INFO_PROFILE => ResultSpec(:hsa_profile_t),
            :HSA_EXECUTABLE_INFO_STATE => ResultSpec(:hsa_executable_state_t)
        )
    )
)

push!(getters,
    GetterSpec(
        :hsa_executable_symbol_get_info,
        (:symbol, :attribute, :value),
        (:hsa_executable_symbol_t, :hsa_executable_symbol_info_t, Ptr{Void}),
        result_specs = Dict(
            :HSA_EXECUTABLE_SYMBOL_INFO_TYPE=> ResultSpec(:hsa_symbol_kind_t),
            :HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_NAME=> ResultSpec(AbstractString, :HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH),
            :HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME=> ResultSpec(AbstractString, :HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH),
            :HSA_EXECUTABLE_SYMBOL_INFO_AGENT => ResultSpec(:hsa_agent_t),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS=> ResultSpec(UInt64),
            :HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE=> ResultSpec(:hsa_symbol_kind_linkage_t),
            :HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION => ResultSpec(Bool),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION => ResultSpec(:hsa_variable_allocation_t),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT => ResultSpec(:hsa_variable_segment_t),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE=> ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST => ResultSpec(Bool),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT => ResultSpec(UInt64),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE=> ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE=> ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK=> ResultSpec(Bool),
            :HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT => ResultSpec(UInt32),
            :HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION => ResultSpec(UInt32)
        )
    )
)

function gen_getters(obuf)
    for spec in getters
        for m_key in keys(spec.result_specs)
            method = Getter(spec, m_key)

            code = convert(Expr, method)

            push!(obuf, code)
        end
    end
end
