
const HSA_ARGUMENT_ALIGN_BYTES = 16
const HSA_QUEUE_ALIGN_BYTES = 64
const HSA_PACKET_ALIGN_BYTES = 64

# Skipping MacroDefinition: HSA_PACKET_ALIGN __ALIGNED__ ( HSA_PACKET_ALIGN_BYTES )

# begin enum hsa_status_t
typealias hsa_status_t Uint32
const HSA_STATUS_SUCCESS = (uint32)(0)
const HSA_STATUS_INFO_BREAK = (uint32)(1)
const HSA_EXT_STATUS_INFO_ALREADY_INITIALIZED = (uint32)(16384)
const HSA_EXT_STATUS_INFO_UNRECOGNIZED_OPTIONS = (uint32)(16385)
const HSA_STATUS_ERROR = (uint32)(65536)
const HSA_STATUS_ERROR_INVALID_ARGUMENT = (uint32)(65537)
const HSA_STATUS_ERROR_INVALID_QUEUE_CREATION = (uint32)(65538)
const HSA_STATUS_ERROR_INVALID_ALLOCATION = (uint32)(65539)
const HSA_STATUS_ERROR_INVALID_AGENT = (uint32)(65540)
const HSA_STATUS_ERROR_INVALID_REGION = (uint32)(65541)
const HSA_STATUS_ERROR_INVALID_SIGNAL = (uint32)(65542)
const HSA_STATUS_ERROR_INVALID_QUEUE = (uint32)(65543)
const HSA_STATUS_ERROR_OUT_OF_RESOURCES = (uint32)(65544)
const HSA_STATUS_ERROR_INVALID_PACKET_FORMAT = (uint32)(65545)
const HSA_STATUS_ERROR_RESOURCE_FREE = (uint32)(65546)
const HSA_STATUS_ERROR_NOT_INITIALIZED = (uint32)(65547)
const HSA_STATUS_ERROR_REFCOUNT_OVERFLOW = (uint32)(65548)
const HSA_EXT_STATUS_ERROR_DIRECTIVE_MISMATCH = (uint32)(81920)
const HSA_EXT_STATUS_ERROR_IMAGE_FORMAT_UNSUPPORTED = (uint32)(81921)
const HSA_EXT_STATUS_ERROR_IMAGE_SIZE_UNSUPPORTED = (uint32)(81922)
# end enum hsa_status_t

# begin enum hsa_packet_type_t
typealias hsa_packet_type_t Uint32
const HSA_PACKET_TYPE_ALWAYS_RESERVED = (uint32)(0)
const HSA_PACKET_TYPE_INVALID = (uint32)(1)
const HSA_PACKET_TYPE_DISPATCH = (uint32)(2)
const HSA_PACKET_TYPE_BARRIER = (uint32)(3)
const HSA_PACKET_TYPE_AGENT_DISPATCH = (uint32)(4)
# end enum hsa_packet_type_t

# begin enum hsa_queue_type_t
typealias hsa_queue_type_t Uint32
const HSA_QUEUE_TYPE_MULTI = (uint32)(0)
const HSA_QUEUE_TYPE_SINGLE = (uint32)(1)
# end enum hsa_queue_type_t

# begin enum hsa_queue_feature_t
typealias hsa_queue_feature_t Uint32
const HSA_QUEUE_FEATURE_DISPATCH = (uint32)(1)
const HSA_QUEUE_FEATURE_AGENT_DISPATCH = (uint32)(2)
# end enum hsa_queue_feature_t

# begin enum hsa_fence_scope_t
typealias hsa_fence_scope_t Uint32
const HSA_FENCE_SCOPE_NONE = (uint32)(0)
const HSA_FENCE_SCOPE_COMPONENT = (uint32)(1)
const HSA_FENCE_SCOPE_SYSTEM = (uint32)(2)
# end enum hsa_fence_scope_t

# begin enum hsa_wait_expectancy_t
typealias hsa_wait_expectancy_t Uint32
const HSA_WAIT_EXPECTANCY_SHORT = (uint32)(0)
const HSA_WAIT_EXPECTANCY_LONG = (uint32)(1)
const HSA_WAIT_EXPECTANCY_UNKNOWN = (uint32)(2)
# end enum hsa_wait_expectancy_t

# begin enum hsa_signal_condition_t
typealias hsa_signal_condition_t Uint32
const HSA_EQ = (uint32)(0)
const HSA_NE = (uint32)(1)
const HSA_LT = (uint32)(2)
const HSA_GTE = (uint32)(3)
# end enum hsa_signal_condition_t

# begin enum hsa_extension_t
typealias hsa_extension_t Uint32
const HSA_EXT_START = (uint32)(0)
const HSA_EXT_FINALIZER = (uint32)(0)
const HSA_EXT_LINKER = (uint32)(1)
const HSA_EXT_IMAGES = (uint32)(2)
const HSA_EXT_AMD_PROFILER = (uint32)(3)
const HSA_SVEXT_START = (uint32)(10000)
# end enum hsa_extension_t

# begin enum hsa_agent_feature_t
typealias hsa_agent_feature_t Uint32
const HSA_AGENT_FEATURE_DISPATCH = (uint32)(1)
const HSA_AGENT_FEATURE_AGENT_DISPATCH = (uint32)(2)
# end enum hsa_agent_feature_t

# begin enum hsa_device_type_t
typealias hsa_device_type_t Uint32
const HSA_DEVICE_TYPE_CPU = (uint32)(0)
const HSA_DEVICE_TYPE_GPU = (uint32)(1)
const HSA_DEVICE_TYPE_DSP = (uint32)(2)
# end enum hsa_device_type_t

# begin enum hsa_system_info_t
typealias hsa_system_info_t Uint32
const HSA_SYSTEM_INFO_VERSION_MAJOR = (uint32)(0)
const HSA_SYSTEM_INFO_VERSION_MINOR = (uint32)(1)
const HSA_SYSTEM_INFO_TIMESTAMP = (uint32)(2)
const HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY = (uint32)(3)
const HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT = (uint32)(4)
# end enum hsa_system_info_t

# begin enum hsa_agent_info_t
typealias hsa_agent_info_t Uint32
const HSA_AGENT_INFO_NAME = (uint32)(0)
const HSA_AGENT_INFO_VENDOR_NAME = (uint32)(1)
const HSA_AGENT_INFO_FEATURE = (uint32)(2)
const HSA_AGENT_INFO_WAVEFRONT_SIZE = (uint32)(3)
const HSA_AGENT_INFO_WORKGROUP_MAX_DIM = (uint32)(4)
const HSA_AGENT_INFO_WORKGROUP_MAX_SIZE = (uint32)(5)
const HSA_AGENT_INFO_GRID_MAX_DIM = (uint32)(6)
const HSA_AGENT_INFO_GRID_MAX_SIZE = (uint32)(7)
const HSA_AGENT_INFO_FBARRIER_MAX_SIZE = (uint32)(8)
const HSA_AGENT_INFO_QUEUES_MAX = (uint32)(9)
const HSA_AGENT_INFO_QUEUE_MAX_SIZE = (uint32)(10)
const HSA_AGENT_INFO_QUEUE_TYPE = (uint32)(11)
const HSA_AGENT_INFO_NODE = (uint32)(12)
const HSA_AGENT_INFO_DEVICE = (uint32)(13)
const HSA_AGENT_INFO_CACHE_SIZE = (uint32)(14)
const HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM = (uint32)(15)
const HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM = (uint32)(16)
const HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM = (uint32)(17)
const HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE = (uint32)(18)
const HSA_EXT_AGENT_INFO_IMAGE_RD_MAX = (uint32)(19)
const HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX = (uint32)(20)
const HSA_EXT_AGENT_INFO_SAMPLER_MAX = (uint32)(21)
const HSA_AGENT_INFO_COUNT = (uint32)(22)
# end enum hsa_agent_info_t

# begin enum hsa_segment_t
typealias hsa_segment_t Uint32
const HSA_SEGMENT_GLOBAL = (uint32)(0)
const HSA_SEGMENT_PRIVATE = (uint32)(1)
const HSA_SEGMENT_GROUP = (uint32)(2)
const HSA_SEGMENT_KERNARG = (uint32)(3)
const HSA_SEGMENT_READONLY = (uint32)(4)
const HSA_SEGMENT_SPILL = (uint32)(5)
const HSA_SEGMENT_ARG = (uint32)(6)
# end enum hsa_segment_t

# begin enum hsa_region_flag_t
typealias hsa_region_flag_t Uint32
const HSA_REGION_FLAG_KERNARG = (uint32)(1)
const HSA_REGION_FLAG_CACHED_L1 = (uint32)(2)
const HSA_REGION_FLAG_CACHED_L2 = (uint32)(4)
const HSA_REGION_FLAG_CACHED_L3 = (uint32)(8)
const HSA_REGION_FLAG_CACHED_L4 = (uint32)(16)
# end enum hsa_region_flag_t

# begin enum hsa_region_info_t
typealias hsa_region_info_t Uint32
const HSA_REGION_INFO_BASE = (uint32)(0)
const HSA_REGION_INFO_SIZE = (uint32)(1)
const HSA_REGION_INFO_AGENT = (uint32)(2)
const HSA_REGION_INFO_FLAGS = (uint32)(3)
const HSA_REGION_INFO_SEGMENT = (uint32)(4)
const HSA_REGION_INFO_ALLOC_MAX_SIZE = (uint32)(5)
const HSA_REGION_INFO_ALLOC_GRANULE = (uint32)(6)
const HSA_REGION_INFO_ALLOC_ALIGNMENT = (uint32)(7)
const HSA_REGION_INFO_BANDWIDTH = (uint32)(8)
const HSA_REGION_INFO_NODE = (uint32)(9)
const HSA_REGION_INFO_COUNT = (uint32)(10)
# end enum hsa_region_info_t

typealias hsa_signal_value_t Int64
typealias hsa_signal_t Uint64
typealias hsa_agent_t Uint64
typealias hsa_region_t Uint64

type hsa_queue_t
    queue_type::hsa_queue_type_t
    queue_features::Uint32
    base_address::Uint64
    doorbell_signal::hsa_signal_t
    size::Uint32
    id::Uint32
    service_queue::Uint64
end

type hsa_packet_header_t
    _type::Uint16
    barrier::Uint16
    acquire_fence_scope::Uint16
    release_fence_scope::Uint16
    reserved::Uint16
end

type hsa_dispatch_packet_t
    header::hsa_packet_header_t
    dimensions::Uint16
    reserved::Uint16
    workgroup_size_x::Uint16
    workgroup_size_y::Uint16
    workgroup_size_z::Uint16
    reserved2::Uint16
    grid_size_x::Uint32
    grid_size_y::Uint32
    grid_size_z::Uint32
    private_segment_size::Uint32
    group_segment_size::Uint32
    kernel_object_address::Uint64
    kernarg_address::Uint64
    reserved3::Uint64
    completion_signal::hsa_signal_t
end

immutable Array_4_Uint64
    d1::Uint64
    d2::Uint64
    d3::Uint64
    d4::Uint64
end

zero(::Type{Array_4_Uint64}) = Array_4_Uint64(fill(zero(Uint64),4)...)

type hsa_agent_dispatch_packet_t
    header::hsa_packet_header_t
    _type::Uint16
    reserved2::Uint32
    return_address::Uint64
    arg::Array_4_Uint64
    reserved3::Uint64
    completion_signal::hsa_signal_t
end

immutable Array_5_hsa_signal_t
    d1::hsa_signal_t
    d2::hsa_signal_t
    d3::hsa_signal_t
    d4::hsa_signal_t
    d5::hsa_signal_t
end

zero(::Type{Array_5_hsa_signal_t}) = Array_5_hsa_signal_t(fill(zero(hsa_signal_t),5)...)

type hsa_barrier_packet_t
    header::hsa_packet_header_t
    reserved2::Uint16
    reserved3::Uint32
    dep_signal::Array_5_hsa_signal_t
    reserved4::Uint64
    completion_signal::hsa_signal_t
end

typealias hsa_powertwo8_t Uint8

# begin enum hsa_powertwo_t
typealias hsa_powertwo_t Uint32
const HSA_POWERTWO_1 = (uint32)(0)
const HSA_POWERTWO_2 = (uint32)(1)
const HSA_POWERTWO_4 = (uint32)(2)
const HSA_POWERTWO_8 = (uint32)(3)
const HSA_POWERTWO_16 = (uint32)(4)
const HSA_POWERTWO_32 = (uint32)(5)
const HSA_POWERTWO_64 = (uint32)(6)
const HSA_POWERTWO_128 = (uint32)(7)
const HSA_POWERTWO_256 = (uint32)(8)
# end enum hsa_powertwo_t

type hsa_dim3_t
    x::Uint32
    y::Uint32
    z::Uint32
end

# begin enum hsa_dim_t
typealias hsa_dim_t Uint32
const HSA_DIM_X = (uint32)(0)
const HSA_DIM_Y = (uint32)(1)
const HSA_DIM_Z = (uint32)(2)
# end enum hsa_dim_t

type hsa_runtime_caller_t
    caller::Uint64
end

typealias hsa_runtime_alloc_data_callback_t Ptr{Void}
typealias hsa_ext_brig_profile8_t Uint8

# begin enum hsa_ext_brig_profile_t
typealias hsa_ext_brig_profile_t Uint32
const HSA_EXT_BRIG_PROFILE_BASE = (uint32)(0)
const HSA_EXT_BRIG_PROFILE_FULL = (uint32)(1)
# end enum hsa_ext_brig_profile_t

typealias hsa_ext_brig_machine_model8_t Uint8

# begin enum hsa_ext_brig_machine_model_t
typealias hsa_ext_brig_machine_model_t Uint32
const HSA_EXT_BRIG_MACHINE_SMALL = (uint32)(0)
const HSA_EXT_BRIG_MACHINE_LARGE = (uint32)(1)
# end enum hsa_ext_brig_machine_model_t

typealias hsa_ext_brig_section_id32_t Uint32

# begin enum hsa_ext_brig_section_id_t
typealias hsa_ext_brig_section_id_t Uint32
const HSA_EXT_BRIG_SECTION_DATA = (uint32)(0)
const HSA_EXT_BRIG_SECTION_CODE = (uint32)(1)
const HSA_EXT_BRIG_SECTION_OPERAND = (uint32)(2)
# end enum hsa_ext_brig_section_id_t

immutable Array_1_Uint8
    d1::Uint8
end

zero(::Type{Array_1_Uint8}) = Array_1_Uint8(fill(zero(Uint8),1)...)

type hsa_ext_brig_section_header_t
    byte_count::Uint32
    header_byte_count::Uint32
    name_length::Uint32
    name::Array_1_Uint8
end

immutable Array_1_Ptr
    d1::Ptr{hsa_ext_brig_section_header_t}
end

zero(::Type{Array_1_Ptr}) = Array_1_Ptr(fill(zero(Ptr{hsa_ext_brig_section_header_t}),1)...)

type hsa_ext_brig_module_t
    section_count::Uint32
    section::Array_1_Ptr
end

type hsa_ext_brig_module_handle_t
    handle::Uint64
end

typealias hsa_ext_brig_code_section_offset32_t Uint32
typealias hsa_ext_exception_kind16_t Uint16

# begin enum hsa_ext_exception_kind_t
typealias hsa_ext_exception_kind_t Uint32
const HSA_EXT_EXCEPTION_INVALID_OPERATION = (uint32)(1)
const HSA_EXT_EXCEPTION_DIVIDE_BY_ZERO = (uint32)(2)
const HSA_EXT_EXCEPTION_OVERFLOW = (uint32)(4)
const HSA_EXT_EXCEPTION_UNDERFLOW = (uint32)(8)
const HSA_EXT_EXCEPTION_INEXACT = (uint32)(16)
# end enum hsa_ext_exception_kind_t

typealias hsa_ext_control_directive_present64_t Uint64

# begin enum hsa_ext_control_directive_present_t
typealias hsa_ext_control_directive_present_t Uint32
const HSA_EXT_CONTROL_DIRECTIVE_ENABLE_BREAK_EXCEPTIONS = (uint32)(0)
const HSA_EXT_CONTROL_DIRECTIVE_ENABLE_DETECT_EXCEPTIONS = (uint32)(1)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_DYNAMIC_GROUP_SIZE = (uint32)(2)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_FLAT_GRID_SIZE = (uint32)(4)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_FLAT_WORKGROUP_SIZE = (uint32)(8)
const HSA_EXT_CONTROL_DIRECTIVE_REQUESTED_WORKGROUPS_PER_CU = (uint32)(16)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_GRID_SIZE = (uint32)(32)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_WORKGROUP_SIZE = (uint32)(64)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_DIM = (uint32)(128)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRE_NO_PARTIAL_WORKGROUPS = (uint32)(256)
# end enum hsa_ext_control_directive_present_t

immutable Array_75_Uint8
    d1::Uint8
    d2::Uint8
    d3::Uint8
    d4::Uint8
    d5::Uint8
    d6::Uint8
    d7::Uint8
    d8::Uint8
    d9::Uint8
    d10::Uint8
    d11::Uint8
    d12::Uint8
    d13::Uint8
    d14::Uint8
    d15::Uint8
    d16::Uint8
    d17::Uint8
    d18::Uint8
    d19::Uint8
    d20::Uint8
    d21::Uint8
    d22::Uint8
    d23::Uint8
    d24::Uint8
    d25::Uint8
    d26::Uint8
    d27::Uint8
    d28::Uint8
    d29::Uint8
    d30::Uint8
    d31::Uint8
    d32::Uint8
    d33::Uint8
    d34::Uint8
    d35::Uint8
    d36::Uint8
    d37::Uint8
    d38::Uint8
    d39::Uint8
    d40::Uint8
    d41::Uint8
    d42::Uint8
    d43::Uint8
    d44::Uint8
    d45::Uint8
    d46::Uint8
    d47::Uint8
    d48::Uint8
    d49::Uint8
    d50::Uint8
    d51::Uint8
    d52::Uint8
    d53::Uint8
    d54::Uint8
    d55::Uint8
    d56::Uint8
    d57::Uint8
    d58::Uint8
    d59::Uint8
    d60::Uint8
    d61::Uint8
    d62::Uint8
    d63::Uint8
    d64::Uint8
    d65::Uint8
    d66::Uint8
    d67::Uint8
    d68::Uint8
    d69::Uint8
    d70::Uint8
    d71::Uint8
    d72::Uint8
    d73::Uint8
    d74::Uint8
    d75::Uint8
end

zero(::Type{Array_75_Uint8}) = Array_75_Uint8(fill(zero(Uint8),75)...)

type hsa_ext_control_directives_t
    enabled_control_directives::hsa_ext_control_directive_present64_t
    enable_break_exceptions::hsa_ext_exception_kind16_t
    enable_detect_exceptions::hsa_ext_exception_kind16_t
    max_dynamic_group_size::Uint32
    max_flat_grid_size::Uint32
    max_flat_workgroup_size::Uint32
    requested_workgroups_per_cu::Uint32
    required_grid_size::Cint
    required_workgroup_size::Cint
    required_dim::Uint8
    reserved::Array_75_Uint8
end

typealias hsa_ext_code_kind32_t Uint32

# begin enum hsa_ext_code_kind_t
typealias hsa_ext_code_kind_t Uint32
const HSA_EXT_CODE_NONE = (uint32)(0)
const HSA_EXT_CODE_KERNEL = (uint32)(1)
const HSA_EXT_CODE_INDIRECT_FUNCTION = (uint32)(2)
const HSA_EXT_CODE_RUNTIME_FIRST = (uint32)(1073741824)
const HSA_EXT_CODE_RUNTIME_LAST = (uint32)(2147483647)
const HSA_EXT_CODE_VENDOR_FIRST = (uint32)(0x0000000080000000)
const HSA_EXT_CODE_VENDOR_LAST = (uint32)(0x00000000ffffffff)
# end enum hsa_ext_code_kind_t

typealias hsa_ext_program_call_convention_id32_t Uint32

# begin enum hsa_ext_program_call_convention_id_t
typealias hsa_ext_program_call_convention_id_t Cint
const HSA_EXT_PROGRAM_CALL_CONVENTION_FINALIZER_DETERMINED = (int32)(-1)
# end enum hsa_ext_program_call_convention_id_t

type hsa_ext_code_handle_t
    handle::Uint64
end

type hsa_ext_debug_information_handle_t
    handle::Uint64
end

immutable Array_24_Uint8
    d1::Uint8
    d2::Uint8
    d3::Uint8
    d4::Uint8
    d5::Uint8
    d6::Uint8
    d7::Uint8
    d8::Uint8
    d9::Uint8
    d10::Uint8
    d11::Uint8
    d12::Uint8
    d13::Uint8
    d14::Uint8
    d15::Uint8
    d16::Uint8
    d17::Uint8
    d18::Uint8
    d19::Uint8
    d20::Uint8
    d21::Uint8
    d22::Uint8
    d23::Uint8
    d24::Uint8
end

zero(::Type{Array_24_Uint8}) = Array_24_Uint8(fill(zero(Uint8),24)...)

type hsa_ext_code_descriptor_t
    code_type::hsa_ext_code_kind32_t
    workgroup_group_segment_byte_size::Uint32
    kernarg_segment_byte_size::Uint64
    workitem_private_segment_byte_size::Uint32
    workgroup_fbarrier_count::Uint32
    code::hsa_ext_code_handle_t
    kernarg_segment_alignment::Cint
    group_segment_alignment::Cint
    private_segment_alignment::Cint
    wavefront_size::Cint
    program_call_convention::hsa_ext_program_call_convention_id32_t
    _module::hsa_ext_brig_module_handle_t
    symbol::hsa_ext_brig_code_section_offset32_t
    hsail_profile::hsa_ext_brig_profile8_t
    hsail_machine_model::hsa_ext_brig_machine_model8_t
    reserved1::Uint16
    debug_information::hsa_ext_debug_information_handle_t
    agent_vendor::Array_24_Uint8
    agent_name::Array_24_Uint8
    hsail_version_major::Uint32
    hsail_version_minor::Uint32
    reserved2::Uint64
    control_directive::hsa_ext_control_directives_t
end

type hsa_ext_finalization_request_t
    _module::hsa_ext_brig_module_handle_t
    symbol::hsa_ext_brig_code_section_offset32_t
    program_call_convention::hsa_ext_program_call_convention_id32_t
end

type hsa_ext_finalization_handle_t
    handle::Uint64
end

typealias hsa_ext_symbol_address_callback_t Ptr{Void}
typealias hsa_ext_error_message_callback_t Ptr{Void}

type hsa_ext_program_handle_t
    handle::Uint64
end

typealias hsa_ext_program_agent_id_t Uint32
typealias hsa_ext_program_allocation_symbol_address_t Ptr{Void}
typealias hsa_ext_agent_allocation_symbol_address_t Ptr{Void}

# begin enum hsa_ext_image_format_capability_t
typealias hsa_ext_image_format_capability_t Uint32
const HSA_EXT_IMAGE_FORMAT_NOT_SUPPORTED = (uint32)(0)
const HSA_EXT_IMAGE_FORMAT_READ_ONLY = (uint32)(1)
const HSA_EXT_IMAGE_FORMAT_WRITE_ONLY = (uint32)(2)
const HSA_EXT_IMAGE_FORMAT_READ_WRITE = (uint32)(4)
const HSA_EXT_IMAGE_FORMAT_READ_MODIFY_WRITE = (uint32)(8)
const HSA_EXT_IMAGE_FORMAT_ACCESS_INVARIANT_IMAGE_DATA = (uint32)(16)
# end enum hsa_ext_image_format_capability_t

# begin enum hsa_ext_image_access_permission_t
typealias hsa_ext_image_access_permission_t Uint32
const HSA_EXT_IMAGE_ACCESS_PERMISSION_READ_ONLY = (uint32)(0)
const HSA_EXT_IMAGE_ACCESS_PERMISSION_WRITE_ONLY = (uint32)(1)
const HSA_EXT_IMAGE_ACCESS_PERMISSION_READ_WRITE = (uint32)(2)
# end enum hsa_ext_image_access_permission_t

# begin enum hsa_ext_image_geometry_t
typealias hsa_ext_image_geometry_t Uint32
const HSA_EXT_IMAGE_GEOMETRY_1D = (uint32)(0)
const HSA_EXT_IMAGE_GEOMETRY_2D = (uint32)(1)
const HSA_EXT_IMAGE_GEOMETRY_3D = (uint32)(2)
const HSA_EXT_IMAGE_GEOMETRY_1DA = (uint32)(3)
const HSA_EXT_IMAGE_GEOMETRY_2DA = (uint32)(4)
const HSA_EXT_IMAGE_GEOMETRY_1DB = (uint32)(5)
const HSA_EXT_IMAGE_GEOMETRY_2DDEPTH = (uint32)(6)
const HSA_EXT_IMAGE_GEOMETRY_2DADEPTH = (uint32)(7)
# end enum hsa_ext_image_geometry_t

# begin enum hsa_ext_image_channel_type_t
typealias hsa_ext_image_channel_type_t Uint32
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT8 = (uint32)(0)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT16 = (uint32)(1)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT8 = (uint32)(2)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT16 = (uint32)(3)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT24 = (uint32)(4)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_555 = (uint32)(5)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_565 = (uint32)(6)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_101010 = (uint32)(7)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT8 = (uint32)(8)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT16 = (uint32)(9)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT32 = (uint32)(10)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT8 = (uint32)(11)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT16 = (uint32)(12)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT32 = (uint32)(13)
const HSA_EXT_IMAGE_CHANNEL_TYPE_HALF_FLOAT = (uint32)(14)
const HSA_EXT_IMAGE_CHANNEL_TYPE_FLOAT = (uint32)(15)
# end enum hsa_ext_image_channel_type_t

# begin enum hsa_ext_image_channel_order_t
typealias hsa_ext_image_channel_order_t Uint32
const HSA_EXT_IMAGE_CHANNEL_ORDER_A = (uint32)(0)
const HSA_EXT_IMAGE_CHANNEL_ORDER_R = (uint32)(1)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RX = (uint32)(2)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RG = (uint32)(3)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGX = (uint32)(4)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RA = (uint32)(5)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGB = (uint32)(6)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBX = (uint32)(7)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBA = (uint32)(8)
const HSA_EXT_IMAGE_CHANNEL_ORDER_BGRA = (uint32)(9)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ARGB = (uint32)(10)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ABGR = (uint32)(11)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGB = (uint32)(12)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBX = (uint32)(13)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBA = (uint32)(14)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SBGRA = (uint32)(15)
const HSA_EXT_IMAGE_CHANNEL_ORDER_INTENSITY = (uint32)(16)
const HSA_EXT_IMAGE_CHANNEL_ORDER_LUMINANCE = (uint32)(17)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH = (uint32)(18)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH_STENCIL = (uint32)(19)
# end enum hsa_ext_image_channel_order_t

# begin enum hsa_ext_sampler_addressing_mode_t
typealias hsa_ext_sampler_addressing_mode_t Uint32
const HSA_EXT_SAMPLER_ADDRESSING_UNDEFINED = (uint32)(0)
const HSA_EXT_SAMPLER_ADDRESSING_CLAMP_TO_EDGE = (uint32)(1)
const HSA_EXT_SAMPLER_ADDRESSING_CLAMP_TO_BORDER = (uint32)(2)
const HSA_EXT_SAMPLER_ADDRESSING_REPEAT = (uint32)(3)
const HSA_EXT_SAMPLER_ADDRESSING_MIRRORED_REPEAT = (uint32)(4)
# end enum hsa_ext_sampler_addressing_mode_t

# begin enum hsa_ext_sampler_coordinate_mode_t
typealias hsa_ext_sampler_coordinate_mode_t Uint32
const HSA_EXT_SAMPLER_COORD_NORMALIZED = (uint32)(0)
const HSA_EXT_SAMPLER_COORD_UNNORMALIZED = (uint32)(1)
# end enum hsa_ext_sampler_coordinate_mode_t

# begin enum hsa_ext_sampler_filter_mode_t
typealias hsa_ext_sampler_filter_mode_t Uint32
const HSA_EXT_SAMPLER_FILTER_NEAREST = (uint32)(0)
const HSA_EXT_SAMPLER_FILTER_LINEAR = (uint32)(1)
# end enum hsa_ext_sampler_filter_mode_t

type hsa_ext_image_handle_t
    handle::Uint64
end

type hsa_ext_image_info_t
    image_size::Cint
    image_alignment::Cint
end

type hsa_ext_image_format_t
    channel_type::hsa_ext_image_channel_type_t
    channel_order::hsa_ext_image_channel_order_t
end

type hsa_ext_image_descriptor_t
    geometry::hsa_ext_image_geometry_t
    width::Cint
    height::Cint
    depth::Cint
    array_size::Cint
    format::hsa_ext_image_format_t
end

type hsa_ext_image_range_t
    width::Uint32
    height::Uint32
    depth::Uint32
end

type hsa_ext_image_region_t
    image_offset::hsa_dim3_t
    image_range::hsa_ext_image_range_t
end

type hsa_ext_sampler_handle_t
    handle::Uint64
end

type hsa_ext_sampler_descriptor_t
    coordinate_mode::hsa_ext_sampler_coordinate_mode_t
    filter_mode::hsa_ext_sampler_filter_mode_t
    address_mode::hsa_ext_sampler_addressing_mode_t
end

immutable Array_4_Cfloat
    d1::Cfloat
    d2::Cfloat
    d3::Cfloat
    d4::Cfloat
end

zero(::Type{Array_4_Cfloat}) = Array_4_Cfloat(fill(zero(Cfloat),4)...)

# Skipping MacroDefinition: HSA_EXT_BIT_MASK ( shift , width ) ( ( ( 1 << width ) - 1 ) << shift )

typealias hsa_ext_symbol_definition_callback_t Ptr{Void}

# begin enum hsa_amd_status_t
typealias hsa_amd_status_t Uint32
const HSA_EXT_STATUS_INFO_HALT_ITERATION = (uint32)(1)
# end enum hsa_amd_status_t

# begin enum hsa_amd_agent_info_t
typealias hsa_amd_agent_info_t Uint32
const HSA_EXT_AGENT_INFO_DEVICE_ID = (uint32)(22)
const HSA_EXT_AGENT_INFO_CACHELINE_SIZE = (uint32)(23)
const HSA_EXT_AGENT_INFO_COMPUTE_UNIT_COUNT = (uint32)(24)
const HSA_EXT_AGENT_INFO_MAX_CLOCK_FREQUENCY = (uint32)(25)
const HSA_EXT_AGENT_INFO_DRIVER_NODE_ID = (uint32)(26)
# end enum hsa_amd_agent_info_t

# begin enum hsa_amd_region_info_t
typealias hsa_amd_region_info_t Uint32
const HSA_EXT_REGION_INFO_HOST_ACCESS = (uint32)(10)
# end enum hsa_amd_region_info_t

# begin enum hsa_amd_memory_type_t
typealias hsa_amd_memory_type_t Uint32
const HSA_EXT_MEMORY_TYPE_COHERENT = (uint32)(0)
const HSA_EXT_MEMORY_TYPE_NONCOHERENT = (uint32)(1)
# end enum hsa_amd_memory_type_t

type hsa_amd_dispatch_time_t
    start::Uint64
    _end::Uint64
end

typealias hsa_amd_code_version32_t Uint32
typealias hsa_amd_compute_pgm_rsrc1_t Uint32
typealias hsa_amd_compute_pgm_rsrc2_t Uint32
typealias hsa_amd_code_property32_t Uint32

# begin enum hsa_amd_code_version_t
typealias hsa_amd_code_version_t Uint32
const HSA_EXT_AMD_CODE_VERSION_MAJOR = (uint32)(0)
const HSA_EXT_AMD_CODE_VERSION_MINOR = (uint32)(1)
# end enum hsa_amd_code_version_t

# begin enum hsa_amd_system_vgpr_workitem_id_t
typealias hsa_amd_system_vgpr_workitem_id_t Uint32
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X = (uint32)(0)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X_Y = (uint32)(1)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X_Y_Z = (uint32)(2)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_UNDEFINED = (uint32)(3)
# end enum hsa_amd_system_vgpr_workitem_id_t

# begin enum hsa_amd_element_byte_size_t
typealias hsa_amd_element_byte_size_t Uint32
const HSA_EXT_AMD_ELEMENT_2_BYTES = (uint32)(0)
const HSA_EXT_AMD_ELEMENT_4_BYTES = (uint32)(1)
const HSA_EXT_AMD_ELEMENT_8_BYTES = (uint32)(2)
const HSA_EXT_AMD_ELEMENT_16_BYTES = (uint32)(3)
# end enum hsa_amd_element_byte_size_t

# begin enum hsa_amd_float_round_mode_t
typealias hsa_amd_float_round_mode_t Uint32
const HSA_EXT_AMD_FLOAT_ROUND_TO_NEAREST_EVEN = (uint32)(0)
const HSA_EXT_AMD_FLOAT_ROUND_TO_PLUS_INFINITY = (uint32)(1)
const HSA_EXT_AMD_FLOAT_ROUND_TO_MINUS_INFINITY = (uint32)(2)
const HSA_EXT_AMD_FLOAT_ROUND_TO_ZERO = (uint32)(3)
# end enum hsa_amd_float_round_mode_t

# begin enum hsa_amd_float_denorm_mode_t
typealias hsa_amd_float_denorm_mode_t Uint32
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_SOURCE_OUTPUT = (uint32)(0)
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_OUTPUT = (uint32)(1)
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_SOURCE = (uint32)(2)
const HSA_EXT_AMD_FLOAT_DENORM_NO_FLUSH = (uint32)(3)
# end enum hsa_amd_float_denorm_mode_t

# begin enum hsa_amd_compute_pgm_rsrc1_mask_t
typealias hsa_amd_compute_pgm_rsrc1_mask_t Uint32
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT_SHIFT = (uint32)(0)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT_WIDTH = (uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT = (uint32)(63)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT_SHIFT = (uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT_WIDTH = (uint32)(4)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT = (uint32)(960)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY_SHIFT = (uint32)(10)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY = (uint32)(3072)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32_SHIFT = (uint32)(12)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32 = (uint32)(12288)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64_SHIFT = (uint32)(14)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64 = (uint32)(49152)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32_SHIFT = (uint32)(16)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32 = (uint32)(196608)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64_SHIFT = (uint32)(18)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64 = (uint32)(786432)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV_SHIFT = (uint32)(20)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV = (uint32)(1048576)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP_SHIFT = (uint32)(21)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP = (uint32)(2097152)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE_SHIFT = (uint32)(22)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE = (uint32)(4194304)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE_SHIFT = (uint32)(23)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE = (uint32)(8388608)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY_SHIFT = (uint32)(24)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY = (uint32)(16777216)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER_SHIFT = (uint32)(25)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER = (uint32)(33554432)
# end enum hsa_amd_compute_pgm_rsrc1_mask_t

# begin enum hsa_amd_compute_pgm_rsrc2_mask_t
typealias hsa_amd_compute_pgm_rsrc2_mask_t Uint32
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET_SHIFT = (uint32)(0)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT_SHIFT = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT_WIDTH = (uint32)(5)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT = (uint32)(62)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER_SHIFT = (uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER = (uint32)(64)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X_SHIFT = (uint32)(7)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X = (uint32)(128)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y_SHIFT = (uint32)(8)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y = (uint32)(256)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z_SHIFT = (uint32)(9)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z = (uint32)(512)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO_SHIFT = (uint32)(10)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO = (uint32)(1024)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID_SHIFT = (uint32)(11)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID_WIDTH = (uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID = (uint32)(6144)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH_SHIFT = (uint32)(13)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH = (uint32)(8192)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION_SHIFT = (uint32)(14)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION = (uint32)(16384)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE_SHIFT = (uint32)(15)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE_WIDTH = (uint32)(9)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE = (uint32)(16744448)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION_SHIFT = (uint32)(24)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION = (uint32)(16777216)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE_SHIFT = (uint32)(25)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE = (uint32)(33554432)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO_SHIFT = (uint32)(26)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO = (uint32)(67108864)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW_SHIFT = (uint32)(27)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW = (uint32)(134217728)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW_SHIFT = (uint32)(28)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW = (uint32)(268435456)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT_SHIFT = (uint32)(29)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT = (uint32)(536870912)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO_SHIFT = (uint32)(30)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO_WIDTH = (uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO = (uint32)(1073741824)
# end enum hsa_amd_compute_pgm_rsrc2_mask_t

# begin enum hsa_amd_code_property_mask_t
typealias hsa_amd_code_property_mask_t Uint32
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER_SHIFT = (uint32)(0)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR_SHIFT = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR = (uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR_SHIFT = (uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR = (uint32)(4)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR_SHIFT = (uint32)(3)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR = (uint32)(8)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID_SHIFT = (uint32)(4)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID = (uint32)(16)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT_SHIFT = (uint32)(5)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT = (uint32)(32)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE_SHIFT = (uint32)(6)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE = (uint32)(64)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X_SHIFT = (uint32)(7)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X = (uint32)(128)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y_SHIFT = (uint32)(8)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y = (uint32)(256)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z_SHIFT = (uint32)(9)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z = (uint32)(512)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS_SHIFT = (uint32)(10)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS = (uint32)(1024)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE_SHIFT = (uint32)(11)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE_WIDTH = (uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE = (uint32)(6144)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64_SHIFT = (uint32)(13)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64 = (uint32)(8192)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK_SHIFT = (uint32)(14)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK = (uint32)(16384)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED_SHIFT = (uint32)(15)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED_WIDTH = (uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED = (uint32)(32768)
# end enum hsa_amd_code_property_mask_t

type hsa_amd_compute_pgm_resource_register64_t
    _hsa_amd_compute_pgm_resource_register64_t::Uint64
end

type hsa_amd_kernel_code_t
    amd_code_version_major::hsa_amd_code_version32_t
    amd_code_version_minor::hsa_amd_code_version32_t
    struct_byte_size::Uint32
    target_chip::Uint32
    kernel_code_entry_byte_offset::Int64
    kernel_code_prefetch_byte_offset::Int64
    kernel_code_prefetch_byte_size::Uint64
    max_scratch_backing_memory_byte_size::Uint64
    compute_pgm_resource_registers::hsa_amd_compute_pgm_resource_register64_t
    code_properties::hsa_amd_code_property32_t
    workitem_private_segment_byte_size::Uint32
    workgroup_group_segment_byte_size::Uint32
    gds_segment_byte_size::Uint32
    kernarg_segment_byte_size::Uint64
    workgroup_fbarrier_count::Uint32
    wavefront_sgpr_count::Uint16
    workitem_vgpr_count::Uint16
    reserved_vgpr_first::Uint16
    reserved_vgpr_count::Uint16
    reserved_sgpr_first::Uint16
    reserved_sgpr_count::Uint16
    debug_wavefront_private_segment_offset_sgpr::Uint16
    debug_private_segment_buffer_sgpr::Uint16
    kernarg_segment_alignment::hsa_powertwo8_t
    group_segment_alignment::hsa_powertwo8_t
    private_segment_alignment::hsa_powertwo8_t
    reserved3::Uint8
    code_type::hsa_ext_code_kind32_t
    reserved4::Uint32
    wavefront_size::hsa_powertwo8_t
    optimization_level::Uint8
    hsail_profile::hsa_ext_brig_profile8_t
    hsail_machine_model::hsa_ext_brig_machine_model8_t
    hsail_version_major::Uint32
    hsail_version_minor::Uint32
    reserved5::Uint16
    reserved6::Uint16
    control_directive::hsa_ext_control_directives_t
end

typealias hsa_amd_code_unit_t Uint64
typealias hsa_amd_code_t Uint64
typealias hsa_amd_code_type32_t Uint32
typealias hsa_amd_call_convention32_t Uint32
typealias hsa_amd_profile8_t Uint8
typealias hsa_amd_machine_model8_t Uint8

# begin enum hsa_amd_code_type_t
typealias hsa_amd_code_type_t Uint32
const HSA_EXT_CODE_TYPE_NONE = (uint32)(0)
const HSA_EXT_CODE_TYPE_KERNEL = (uint32)(1)
const HSA_EXT_CODE_TYPE_INDIRECT_FUNCTION = (uint32)(2)
# end enum hsa_amd_code_type_t

# begin enum hsa_amd_code_unit_info_t
typealias hsa_amd_code_unit_info_t Uint32
const HSA_EXT_CODE_UNIT_INFO_VERSION = (uint32)(1)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_COUNT = (uint32)(3)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CODE = (uint32)(4)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CODE_TYPE = (uint32)(5)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_NAME = (uint32)(6)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CALL_CONVENTION = (uint32)(7)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_GROUP_SEGMENT_SIZE = (uint32)(8)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_KERNARG_SEGMENT_SIZE = (uint32)(9)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_SIZE = (uint32)(10)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_DYNAMIC_CALL_STACK = (uint32)(11)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_GROUP_SEGMENT_ALIGNMENT = (uint32)(15)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_KERNARG_SEGMENT_ALIGNMENT = (uint32)(16)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_ALIGNMENT = (uint32)(17)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_WAVEFRONT_SIZE = (uint32)(18)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_WORKGROUP_FBARRIER_COUNT = (uint32)(19)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PROFILE = (uint32)(20)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_MACHINE_MODEL = (uint32)(21)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_HSAIL_VERSION_MAJOR = (uint32)(22)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_HSAIL_VERSION_MINOR = (uint32)(23)
# end enum hsa_amd_code_unit_info_t

typealias hsa_ext_symbol_value_callback_t Ptr{Void}
typealias hsa_ext_code_unit_iterator_callback_t Ptr{Void}
