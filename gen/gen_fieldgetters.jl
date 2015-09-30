function field_getter(
    obuf,
    prefix :: Symbol,
    struct_type,
    map :: Dict{Symbol, Any})

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

        push!(obuf, getter_code)
    end
end

function gen_fieldgetters(obuf)

    field_getter(
        obuf,
        :queue_info_,
        :hsa_queue_t,
        Dict(
            :type => (:hsa_queue_type_t, 0),
            :features => (:hsa_queue_feature_t, 4),
            :base_address => (Uint64, 8), # TODO handle ifdefs for machine_model/endianness
            :doorbell_signal => (Uint64, 16),
            :size => (Uint32, 24),
            # Uint32 reserved
            :id => (Uint64, 32),
        )
    )
end
