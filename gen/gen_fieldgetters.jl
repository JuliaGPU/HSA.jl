"""
Generates a method that can retrieve a struct field through a pointer
"""
function field_getter(
    obuf,
    prefix :: Symbol,
    struct_type,
    map :: Dict{Symbol, Any}) # maps fieldnames to (type, offset) tuples

    for key in keys(map)
        # for each field, build a getter named prefix_fieldname
        jl_name = symbol(prefix, key)
        field_type, field_offset = map[key]
        field_offset = convert(UInt64, field_offset)

        getter_code = quote
            function $jl_name(ptr::Ptr{$struct_type})
                field_ptr = convert(Ptr{$field_type}, ptr + $field_offset)
                return unsafe_load(field_ptr)
            end
        end

        push!(obuf, getter_code)
    end
end

function gen_fieldgetters(obuf)
    # generate getters for queue fields
    field_getter(
        obuf,
        :queue_info_,
        :hsa_queue_t,
        Dict(
            :type => (:hsa_queue_type_t, 0),
            :features => (:hsa_queue_feature_t, 4),
            :base_address => (UInt64, 8), # TODO handle ifdefs for machine_model/endianness
            :doorbell_signal => (UInt64, 16),
            :size => (UInt32, 24),
            # UInt32 reserved
            :id => (UInt64, 32),
        )
    )
end
