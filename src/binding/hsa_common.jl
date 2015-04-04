
const HSA_ARGUMENT_ALIGN_BYTES = 16
const HSA_QUEUE_ALIGN_BYTES = 64
const HSA_PACKET_ALIGN_BYTES = 64

# Skipping MacroDefinition: HSA_PACKET_ALIGN __ALIGNED__ ( HSA_PACKET_ALIGN_BYTES )

# begin enum hsa_status_t
typealias hsa_status_t Uint32
const HSA_STATUS_SUCCESS = (Uint32)(0)
const HSA_STATUS_INFO_BREAK = (Uint32)(1)
const HSA_EXT_STATUS_INFO_ALREADY_INITIALIZED = (Uint32)(16384)
const HSA_EXT_STATUS_INFO_UNRECOGNIZED_OPTIONS = (Uint32)(16385)
const HSA_STATUS_ERROR = (Uint32)(65536)
const HSA_STATUS_ERROR_INVALID_ARGUMENT = (Uint32)(65537)
const HSA_STATUS_ERROR_INVALID_QUEUE_CREATION = (Uint32)(65538)
const HSA_STATUS_ERROR_INVALID_ALLOCATION = (Uint32)(65539)
const HSA_STATUS_ERROR_INVALID_AGENT = (Uint32)(65540)
const HSA_STATUS_ERROR_INVALID_REGION = (Uint32)(65541)
const HSA_STATUS_ERROR_INVALID_SIGNAL = (Uint32)(65542)
const HSA_STATUS_ERROR_INVALID_QUEUE = (Uint32)(65543)
const HSA_STATUS_ERROR_OUT_OF_RESOURCES = (Uint32)(65544)
const HSA_STATUS_ERROR_INVALID_PACKET_FORMAT = (Uint32)(65545)
const HSA_STATUS_ERROR_RESOURCE_FREE = (Uint32)(65546)
const HSA_STATUS_ERROR_NOT_INITIALIZED = (Uint32)(65547)
const HSA_STATUS_ERROR_REFCOUNT_OVERFLOW = (Uint32)(65548)
const HSA_EXT_STATUS_ERROR_DIRECTIVE_MISMATCH = (Uint32)(81920)
const HSA_EXT_STATUS_ERROR_IMAGE_FORMAT_UNSUPPORTED = (Uint32)(81921)
const HSA_EXT_STATUS_ERROR_IMAGE_SIZE_UNSUPPORTED = (Uint32)(81922)
# end enum hsa_status_t

# begin enum hsa_packet_type_t
typealias hsa_packet_type_t Uint32
const HSA_PACKET_TYPE_ALWAYS_RESERVED = (Uint32)(0)
const HSA_PACKET_TYPE_INVALID = (Uint32)(1)
const HSA_PACKET_TYPE_DISPATCH = (Uint32)(2)
const HSA_PACKET_TYPE_BARRIER = (Uint32)(3)
const HSA_PACKET_TYPE_AGENT_DISPATCH = (Uint32)(4)
# end enum hsa_packet_type_t

# begin enum hsa_queue_type_t
typealias hsa_queue_type_t Uint32
const HSA_QUEUE_TYPE_MULTI = (Uint32)(0)
const HSA_QUEUE_TYPE_SINGLE = (Uint32)(1)
# end enum hsa_queue_type_t

# begin enum hsa_queue_feature_t
typealias hsa_queue_feature_t Uint32
const HSA_QUEUE_FEATURE_DISPATCH = (Uint32)(1)
const HSA_QUEUE_FEATURE_AGENT_DISPATCH = (Uint32)(2)
# end enum hsa_queue_feature_t

# begin enum hsa_fence_scope_t
typealias hsa_fence_scope_t Uint32
const HSA_FENCE_SCOPE_NONE = (Uint32)(0)
const HSA_FENCE_SCOPE_COMPONENT = (Uint32)(1)
const HSA_FENCE_SCOPE_SYSTEM = (Uint32)(2)
# end enum hsa_fence_scope_t

# begin enum hsa_wait_expectancy_t
typealias hsa_wait_expectancy_t Uint32
const HSA_WAIT_EXPECTANCY_SHORT = (Uint32)(0)
const HSA_WAIT_EXPECTANCY_LONG = (Uint32)(1)
const HSA_WAIT_EXPECTANCY_UNKNOWN = (Uint32)(2)
# end enum hsa_wait_expectancy_t

# begin enum hsa_signal_condition_t
typealias hsa_signal_condition_t Uint32
const HSA_EQ = (Uint32)(0)
const HSA_NE = (Uint32)(1)
const HSA_LT = (Uint32)(2)
const HSA_GTE = (Uint32)(3)
# end enum hsa_signal_condition_t

# begin enum hsa_extension_t
typealias hsa_extension_t Uint32
const HSA_EXT_START = (Uint32)(0)
const HSA_EXT_FINALIZER = (Uint32)(0)
const HSA_EXT_LINKER = (Uint32)(1)
const HSA_EXT_IMAGES = (Uint32)(2)
const HSA_EXT_AMD_PROFILER = (Uint32)(3)
const HSA_SVEXT_START = (Uint32)(10000)
# end enum hsa_extension_t

# begin enum hsa_agent_feature_t
typealias hsa_agent_feature_t Uint32
const HSA_AGENT_FEATURE_DISPATCH = (Uint32)(1)
const HSA_AGENT_FEATURE_AGENT_DISPATCH = (Uint32)(2)
# end enum hsa_agent_feature_t

# begin enum hsa_device_type_t
typealias hsa_device_type_t Uint32
const HSA_DEVICE_TYPE_CPU = (Uint32)(0)
const HSA_DEVICE_TYPE_GPU = (Uint32)(1)
const HSA_DEVICE_TYPE_DSP = (Uint32)(2)
# end enum hsa_device_type_t

# begin enum hsa_system_info_t
typealias hsa_system_info_t Uint32
const HSA_SYSTEM_INFO_VERSION_MAJOR = (Uint32)(0)
const HSA_SYSTEM_INFO_VERSION_MINOR = (Uint32)(1)
const HSA_SYSTEM_INFO_TIMESTAMP = (Uint32)(2)
const HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY = (Uint32)(3)
const HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT = (Uint32)(4)
# end enum hsa_system_info_t

# begin enum hsa_agent_info_t
typealias hsa_agent_info_t Uint32
const HSA_AGENT_INFO_NAME = (Uint32)(0)
const HSA_AGENT_INFO_VENDOR_NAME = (Uint32)(1)
const HSA_AGENT_INFO_FEATURE = (Uint32)(2)
const HSA_AGENT_INFO_WAVEFRONT_SIZE = (Uint32)(3)
const HSA_AGENT_INFO_WORKGROUP_MAX_DIM = (Uint32)(4)
const HSA_AGENT_INFO_WORKGROUP_MAX_SIZE = (Uint32)(5)
const HSA_AGENT_INFO_GRID_MAX_DIM = (Uint32)(6)
const HSA_AGENT_INFO_GRID_MAX_SIZE = (Uint32)(7)
const HSA_AGENT_INFO_FBARRIER_MAX_SIZE = (Uint32)(8)
const HSA_AGENT_INFO_QUEUES_MAX = (Uint32)(9)
const HSA_AGENT_INFO_QUEUE_MAX_SIZE = (Uint32)(10)
const HSA_AGENT_INFO_QUEUE_TYPE = (Uint32)(11)
const HSA_AGENT_INFO_NODE = (Uint32)(12)
const HSA_AGENT_INFO_DEVICE = (Uint32)(13)
const HSA_AGENT_INFO_CACHE_SIZE = (Uint32)(14)
const HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM = (Uint32)(15)
const HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM = (Uint32)(16)
const HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM = (Uint32)(17)
const HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE = (Uint32)(18)
const HSA_EXT_AGENT_INFO_IMAGE_RD_MAX = (Uint32)(19)
const HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX = (Uint32)(20)
const HSA_EXT_AGENT_INFO_SAMPLER_MAX = (Uint32)(21)
const HSA_AGENT_INFO_COUNT = (Uint32)(22)
# end enum hsa_agent_info_t

# begin enum hsa_segment_t
typealias hsa_segment_t Uint32
const HSA_SEGMENT_GLOBAL = (Uint32)(0)
const HSA_SEGMENT_PRIVATE = (Uint32)(1)
const HSA_SEGMENT_GROUP = (Uint32)(2)
const HSA_SEGMENT_KERNARG = (Uint32)(3)
const HSA_SEGMENT_READONLY = (Uint32)(4)
const HSA_SEGMENT_SPILL = (Uint32)(5)
const HSA_SEGMENT_ARG = (Uint32)(6)
# end enum hsa_segment_t

# begin enum hsa_region_flag_t
typealias hsa_region_flag_t Uint32
const HSA_REGION_FLAG_KERNARG = (Uint32)(1)
const HSA_REGION_FLAG_CACHED_L1 = (Uint32)(2)
const HSA_REGION_FLAG_CACHED_L2 = (Uint32)(4)
const HSA_REGION_FLAG_CACHED_L3 = (Uint32)(8)
const HSA_REGION_FLAG_CACHED_L4 = (Uint32)(16)
# end enum hsa_region_flag_t

# begin enum hsa_region_info_t
typealias hsa_region_info_t Uint32
const HSA_REGION_INFO_BASE = (Uint32)(0)
const HSA_REGION_INFO_SIZE = (Uint32)(1)
const HSA_REGION_INFO_AGENT = (Uint32)(2)
const HSA_REGION_INFO_FLAGS = (Uint32)(3)
const HSA_REGION_INFO_SEGMENT = (Uint32)(4)
const HSA_REGION_INFO_ALLOC_MAX_SIZE = (Uint32)(5)
const HSA_REGION_INFO_ALLOC_GRANULE = (Uint32)(6)
const HSA_REGION_INFO_ALLOC_ALIGNMENT = (Uint32)(7)
const HSA_REGION_INFO_BANDWIDTH = (Uint32)(8)
const HSA_REGION_INFO_NODE = (Uint32)(9)
const HSA_REGION_INFO_COUNT = (Uint32)(10)
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
const HSA_POWERTWO_1 = (Uint32)(0)
const HSA_POWERTWO_2 = (Uint32)(1)
const HSA_POWERTWO_4 = (Uint32)(2)
const HSA_POWERTWO_8 = (Uint32)(3)
const HSA_POWERTWO_16 = (Uint32)(4)
const HSA_POWERTWO_32 = (Uint32)(5)
const HSA_POWERTWO_64 = (Uint32)(6)
const HSA_POWERTWO_128 = (Uint32)(7)
const HSA_POWERTWO_256 = (Uint32)(8)
# end enum hsa_powertwo_t

type hsa_dim3_t
    x::Uint32
    y::Uint32
    z::Uint32
end

# begin enum hsa_dim_t
typealias hsa_dim_t Uint32
const HSA_DIM_X = (Uint32)(0)
const HSA_DIM_Y = (Uint32)(1)
const HSA_DIM_Z = (Uint32)(2)
# end enum hsa_dim_t

type hsa_runtime_caller_t
    caller::Uint64
end

typealias hsa_runtime_alloc_data_callback_t Ptr{Void}
typealias hsa_ext_brig_profile8_t Uint8

# begin enum hsa_ext_brig_profile_t
typealias hsa_ext_brig_profile_t Uint32
const HSA_EXT_BRIG_PROFILE_BASE = (Uint32)(0)
const HSA_EXT_BRIG_PROFILE_FULL = (Uint32)(1)
# end enum hsa_ext_brig_profile_t

typealias hsa_ext_brig_machine_model8_t Uint8

# begin enum hsa_ext_brig_machine_model_t
typealias hsa_ext_brig_machine_model_t Uint32
const HSA_EXT_BRIG_MACHINE_SMALL = (Uint32)(0)
const HSA_EXT_BRIG_MACHINE_LARGE = (Uint32)(1)
# end enum hsa_ext_brig_machine_model_t

typealias hsa_ext_brig_section_id32_t Uint32

# begin enum hsa_ext_brig_section_id_t
typealias hsa_ext_brig_section_id_t Uint32
const HSA_EXT_BRIG_SECTION_DATA = (Uint32)(0)
const HSA_EXT_BRIG_SECTION_CODE = (Uint32)(1)
const HSA_EXT_BRIG_SECTION_OPERAND = (Uint32)(2)
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
const HSA_EXT_EXCEPTION_INVALID_OPERATION = (Uint32)(1)
const HSA_EXT_EXCEPTION_DIVIDE_BY_ZERO = (Uint32)(2)
const HSA_EXT_EXCEPTION_OVERFLOW = (Uint32)(4)
const HSA_EXT_EXCEPTION_UNDERFLOW = (Uint32)(8)
const HSA_EXT_EXCEPTION_INEXACT = (Uint32)(16)
# end enum hsa_ext_exception_kind_t

typealias hsa_ext_control_directive_present64_t Uint64

# begin enum hsa_ext_control_directive_present_t
typealias hsa_ext_control_directive_present_t Uint32
const HSA_EXT_CONTROL_DIRECTIVE_ENABLE_BREAK_EXCEPTIONS = (Uint32)(0)
const HSA_EXT_CONTROL_DIRECTIVE_ENABLE_DETECT_EXCEPTIONS = (Uint32)(1)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_DYNAMIC_GROUP_SIZE = (Uint32)(2)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_FLAT_GRID_SIZE = (Uint32)(4)
const HSA_EXT_CONTROL_DIRECTIVE_MAX_FLAT_WORKGROUP_SIZE = (Uint32)(8)
const HSA_EXT_CONTROL_DIRECTIVE_REQUESTED_WORKGROUPS_PER_CU = (Uint32)(16)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_GRID_SIZE = (Uint32)(32)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_WORKGROUP_SIZE = (Uint32)(64)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRED_DIM = (Uint32)(128)
const HSA_EXT_CONTROL_DIRECTIVE_REQUIRE_NO_PARTIAL_WORKGROUPS = (Uint32)(256)
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
const HSA_EXT_CODE_NONE = (Uint32)(0)
const HSA_EXT_CODE_KERNEL = (Uint32)(1)
const HSA_EXT_CODE_INDIRECT_FUNCTION = (Uint32)(2)
const HSA_EXT_CODE_RUNTIME_FIRST = (Uint32)(1073741824)
const HSA_EXT_CODE_RUNTIME_LAST = (Uint32)(2147483647)
const HSA_EXT_CODE_VENDOR_FIRST = (Uint32)(0x0000000080000000)
const HSA_EXT_CODE_VENDOR_LAST = (Uint32)(0x00000000ffffffff)
# end enum hsa_ext_code_kind_t

typealias hsa_ext_program_call_convention_id32_t Uint32

# begin enum hsa_ext_program_call_convention_id_t
typealias hsa_ext_program_call_convention_id_t Cint
const HSA_EXT_PROGRAM_CALL_CONVENTION_FINALIZER_DETERMINED = (Int32)(-1)
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
const HSA_EXT_IMAGE_FORMAT_NOT_SUPPORTED = (Uint32)(0)
const HSA_EXT_IMAGE_FORMAT_READ_ONLY = (Uint32)(1)
const HSA_EXT_IMAGE_FORMAT_WRITE_ONLY = (Uint32)(2)
const HSA_EXT_IMAGE_FORMAT_READ_WRITE = (Uint32)(4)
const HSA_EXT_IMAGE_FORMAT_READ_MODIFY_WRITE = (Uint32)(8)
const HSA_EXT_IMAGE_FORMAT_ACCESS_INVARIANT_IMAGE_DATA = (Uint32)(16)
# end enum hsa_ext_image_format_capability_t

# begin enum hsa_ext_image_access_permission_t
typealias hsa_ext_image_access_permission_t Uint32
const HSA_EXT_IMAGE_ACCESS_PERMISSION_READ_ONLY = (Uint32)(0)
const HSA_EXT_IMAGE_ACCESS_PERMISSION_WRITE_ONLY = (Uint32)(1)
const HSA_EXT_IMAGE_ACCESS_PERMISSION_READ_WRITE = (Uint32)(2)
# end enum hsa_ext_image_access_permission_t

# begin enum hsa_ext_image_geometry_t
typealias hsa_ext_image_geometry_t Uint32
const HSA_EXT_IMAGE_GEOMETRY_1D = (Uint32)(0)
const HSA_EXT_IMAGE_GEOMETRY_2D = (Uint32)(1)
const HSA_EXT_IMAGE_GEOMETRY_3D = (Uint32)(2)
const HSA_EXT_IMAGE_GEOMETRY_1DA = (Uint32)(3)
const HSA_EXT_IMAGE_GEOMETRY_2DA = (Uint32)(4)
const HSA_EXT_IMAGE_GEOMETRY_1DB = (Uint32)(5)
const HSA_EXT_IMAGE_GEOMETRY_2DDEPTH = (Uint32)(6)
const HSA_EXT_IMAGE_GEOMETRY_2DADEPTH = (Uint32)(7)
# end enum hsa_ext_image_geometry_t

# begin enum hsa_ext_image_channel_type_t
typealias hsa_ext_image_channel_type_t Uint32
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT8 = (Uint32)(0)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT16 = (Uint32)(1)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT8 = (Uint32)(2)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT16 = (Uint32)(3)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT24 = (Uint32)(4)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_555 = (Uint32)(5)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_565 = (Uint32)(6)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_101010 = (Uint32)(7)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT8 = (Uint32)(8)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT16 = (Uint32)(9)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT32 = (Uint32)(10)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT8 = (Uint32)(11)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT16 = (Uint32)(12)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT32 = (Uint32)(13)
const HSA_EXT_IMAGE_CHANNEL_TYPE_HALF_FLOAT = (Uint32)(14)
const HSA_EXT_IMAGE_CHANNEL_TYPE_FLOAT = (Uint32)(15)
# end enum hsa_ext_image_channel_type_t

# begin enum hsa_ext_image_channel_order_t
typealias hsa_ext_image_channel_order_t Uint32
const HSA_EXT_IMAGE_CHANNEL_ORDER_A = (Uint32)(0)
const HSA_EXT_IMAGE_CHANNEL_ORDER_R = (Uint32)(1)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RX = (Uint32)(2)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RG = (Uint32)(3)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGX = (Uint32)(4)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RA = (Uint32)(5)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGB = (Uint32)(6)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBX = (Uint32)(7)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBA = (Uint32)(8)
const HSA_EXT_IMAGE_CHANNEL_ORDER_BGRA = (Uint32)(9)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ARGB = (Uint32)(10)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ABGR = (Uint32)(11)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGB = (Uint32)(12)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBX = (Uint32)(13)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBA = (Uint32)(14)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SBGRA = (Uint32)(15)
const HSA_EXT_IMAGE_CHANNEL_ORDER_INTENSITY = (Uint32)(16)
const HSA_EXT_IMAGE_CHANNEL_ORDER_LUMINANCE = (Uint32)(17)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH = (Uint32)(18)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH_STENCIL = (Uint32)(19)
# end enum hsa_ext_image_channel_order_t

# begin enum hsa_ext_sampler_addressing_mode_t
typealias hsa_ext_sampler_addressing_mode_t Uint32
const HSA_EXT_SAMPLER_ADDRESSING_UNDEFINED = (Uint32)(0)
const HSA_EXT_SAMPLER_ADDRESSING_CLAMP_TO_EDGE = (Uint32)(1)
const HSA_EXT_SAMPLER_ADDRESSING_CLAMP_TO_BORDER = (Uint32)(2)
const HSA_EXT_SAMPLER_ADDRESSING_REPEAT = (Uint32)(3)
const HSA_EXT_SAMPLER_ADDRESSING_MIRRORED_REPEAT = (Uint32)(4)
# end enum hsa_ext_sampler_addressing_mode_t

# begin enum hsa_ext_sampler_coordinate_mode_t
typealias hsa_ext_sampler_coordinate_mode_t Uint32
const HSA_EXT_SAMPLER_COORD_NORMALIZED = (Uint32)(0)
const HSA_EXT_SAMPLER_COORD_UNNORMALIZED = (Uint32)(1)
# end enum hsa_ext_sampler_coordinate_mode_t

# begin enum hsa_ext_sampler_filter_mode_t
typealias hsa_ext_sampler_filter_mode_t Uint32
const HSA_EXT_SAMPLER_FILTER_NEAREST = (Uint32)(0)
const HSA_EXT_SAMPLER_FILTER_LINEAR = (Uint32)(1)
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
const HSA_EXT_STATUS_INFO_HALT_ITERATION = (Uint32)(1)
# end enum hsa_amd_status_t

# begin enum hsa_amd_agent_info_t
typealias hsa_amd_agent_info_t Uint32
const HSA_EXT_AGENT_INFO_DEVICE_ID = (Uint32)(22)
const HSA_EXT_AGENT_INFO_CACHELINE_SIZE = (Uint32)(23)
const HSA_EXT_AGENT_INFO_COMPUTE_UNIT_COUNT = (Uint32)(24)
const HSA_EXT_AGENT_INFO_MAX_CLOCK_FREQUENCY = (Uint32)(25)
const HSA_EXT_AGENT_INFO_DRIVER_NODE_ID = (Uint32)(26)
# end enum hsa_amd_agent_info_t

# begin enum hsa_amd_region_info_t
typealias hsa_amd_region_info_t Uint32
const HSA_EXT_REGION_INFO_HOST_ACCESS = (Uint32)(10)
# end enum hsa_amd_region_info_t

# begin enum hsa_amd_memory_type_t
typealias hsa_amd_memory_type_t Uint32
const HSA_EXT_MEMORY_TYPE_COHERENT = (Uint32)(0)
const HSA_EXT_MEMORY_TYPE_NONCOHERENT = (Uint32)(1)
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
const HSA_EXT_AMD_CODE_VERSION_MAJOR = (Uint32)(0)
const HSA_EXT_AMD_CODE_VERSION_MINOR = (Uint32)(1)
# end enum hsa_amd_code_version_t

# begin enum hsa_amd_system_vgpr_workitem_id_t
typealias hsa_amd_system_vgpr_workitem_id_t Uint32
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X = (Uint32)(0)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X_Y = (Uint32)(1)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_X_Y_Z = (Uint32)(2)
const HSA_EXT_AMD_SYSTEM_VGPR_WORKITEM_ID_UNDEFINED = (Uint32)(3)
# end enum hsa_amd_system_vgpr_workitem_id_t

# begin enum hsa_amd_element_byte_size_t
typealias hsa_amd_element_byte_size_t Uint32
const HSA_EXT_AMD_ELEMENT_2_BYTES = (Uint32)(0)
const HSA_EXT_AMD_ELEMENT_4_BYTES = (Uint32)(1)
const HSA_EXT_AMD_ELEMENT_8_BYTES = (Uint32)(2)
const HSA_EXT_AMD_ELEMENT_16_BYTES = (Uint32)(3)
# end enum hsa_amd_element_byte_size_t

# begin enum hsa_amd_float_round_mode_t
typealias hsa_amd_float_round_mode_t Uint32
const HSA_EXT_AMD_FLOAT_ROUND_TO_NEAREST_EVEN = (Uint32)(0)
const HSA_EXT_AMD_FLOAT_ROUND_TO_PLUS_INFINITY = (Uint32)(1)
const HSA_EXT_AMD_FLOAT_ROUND_TO_MINUS_INFINITY = (Uint32)(2)
const HSA_EXT_AMD_FLOAT_ROUND_TO_ZERO = (Uint32)(3)
# end enum hsa_amd_float_round_mode_t

# begin enum hsa_amd_float_denorm_mode_t
typealias hsa_amd_float_denorm_mode_t Uint32
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_SOURCE_OUTPUT = (Uint32)(0)
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_OUTPUT = (Uint32)(1)
const HSA_EXT_AMD_FLOAT_DENORM_FLUSH_SOURCE = (Uint32)(2)
const HSA_EXT_AMD_FLOAT_DENORM_NO_FLUSH = (Uint32)(3)
# end enum hsa_amd_float_denorm_mode_t

# begin enum hsa_amd_compute_pgm_rsrc1_mask_t
typealias hsa_amd_compute_pgm_rsrc1_mask_t Uint32
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT_SHIFT = (Uint32)(0)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT_WIDTH = (Uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WORKITEM_VGPR_COUNT = (Uint32)(63)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT_SHIFT = (Uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT_WIDTH = (Uint32)(4)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_GRANULATED_WAVEFRONT_SGPR_COUNT = (Uint32)(960)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY_SHIFT = (Uint32)(10)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIORITY = (Uint32)(3072)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32_SHIFT = (Uint32)(12)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_32 = (Uint32)(12288)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64_SHIFT = (Uint32)(14)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_ROUND_16_64 = (Uint32)(49152)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32_SHIFT = (Uint32)(16)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_32 = (Uint32)(196608)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64_SHIFT = (Uint32)(18)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_FLOAT_MODE_DENORM_16_64 = (Uint32)(786432)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV_SHIFT = (Uint32)(20)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_PRIV = (Uint32)(1048576)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP_SHIFT = (Uint32)(21)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_DX10_CLAMP = (Uint32)(2097152)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE_SHIFT = (Uint32)(22)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_DEBUG_MODE = (Uint32)(4194304)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE_SHIFT = (Uint32)(23)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_ENABLE_IEEE_MODE = (Uint32)(8388608)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY_SHIFT = (Uint32)(24)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_BULKY = (Uint32)(16777216)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER_SHIFT = (Uint32)(25)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC1_CDBG_USER = (Uint32)(33554432)
# end enum hsa_amd_compute_pgm_rsrc1_mask_t

# begin enum hsa_amd_compute_pgm_rsrc2_mask_t
typealias hsa_amd_compute_pgm_rsrc2_mask_t Uint32
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET_SHIFT = (Uint32)(0)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_PRIVATE_SEGMENT_WAVE_BYTE_OFFSET = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT_SHIFT = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT_WIDTH = (Uint32)(5)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_USER_SGPR_COUNT = (Uint32)(62)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER_SHIFT = (Uint32)(6)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_TRAP_HANDLER = (Uint32)(64)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X_SHIFT = (Uint32)(7)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_X = (Uint32)(128)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y_SHIFT = (Uint32)(8)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Y = (Uint32)(256)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z_SHIFT = (Uint32)(9)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_ID_Z = (Uint32)(512)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO_SHIFT = (Uint32)(10)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_SGPR_WORKGROUP_INFO = (Uint32)(1024)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID_SHIFT = (Uint32)(11)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_VGPR_WORKITEM_ID = (Uint32)(6144)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH_SHIFT = (Uint32)(13)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_ADDRESS_WATCH = (Uint32)(8192)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION_SHIFT = (Uint32)(14)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_MEMORY_VIOLATION = (Uint32)(16384)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE_SHIFT = (Uint32)(15)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE_WIDTH = (Uint32)(9)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_GRANULATED_LDS_SIZE = (Uint32)(16744448)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION_SHIFT = (Uint32)(24)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INVALID_OPERATION = (Uint32)(16777216)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE_SHIFT = (Uint32)(25)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_FP_DENORMAL_SOURCE = (Uint32)(33554432)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO_SHIFT = (Uint32)(26)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_DIVISION_BY_ZERO = (Uint32)(67108864)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW_SHIFT = (Uint32)(27)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_OVERFLOW = (Uint32)(134217728)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW_SHIFT = (Uint32)(28)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_UNDERFLOW = (Uint32)(268435456)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT_SHIFT = (Uint32)(29)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_IEEE_754_FP_INEXACT = (Uint32)(536870912)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO_SHIFT = (Uint32)(30)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_COMPUTE_PGM_RSRC2_ENABLE_EXCEPTION_INT_DIVIDE_BY_ZERO = (Uint32)(1073741824)
# end enum hsa_amd_compute_pgm_rsrc2_mask_t

# begin enum hsa_amd_code_property_mask_t
typealias hsa_amd_code_property_mask_t Uint32
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER_SHIFT = (Uint32)(0)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_BUFFER = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR_SHIFT = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_PTR = (Uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR_SHIFT = (Uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_QUEUE_PTR = (Uint32)(4)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR_SHIFT = (Uint32)(3)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_KERNARG_SEGMENT_PTR = (Uint32)(8)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID_SHIFT = (Uint32)(4)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_DISPATCH_ID = (Uint32)(16)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT_SHIFT = (Uint32)(5)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_FLAT_SCRATCH_INIT = (Uint32)(32)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE_SHIFT = (Uint32)(6)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_PRIVATE_SEGMENT_SIZE = (Uint32)(64)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X_SHIFT = (Uint32)(7)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_X = (Uint32)(128)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y_SHIFT = (Uint32)(8)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Y = (Uint32)(256)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z_SHIFT = (Uint32)(9)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_SGPR_GRID_WORKGROUP_COUNT_Z = (Uint32)(512)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS_SHIFT = (Uint32)(10)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_ENABLE_ORDERED_APPEND_GDS = (Uint32)(1024)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE_SHIFT = (Uint32)(11)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE_WIDTH = (Uint32)(2)
const HSA_EXT_AMD_CODE_PROPERTY_PRIVATE_ELEMENT_SIZE = (Uint32)(6144)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64_SHIFT = (Uint32)(13)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_PTR64 = (Uint32)(8192)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK_SHIFT = (Uint32)(14)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DYNAMIC_CALLSTACK = (Uint32)(16384)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED_SHIFT = (Uint32)(15)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED_WIDTH = (Uint32)(1)
const HSA_EXT_AMD_CODE_PROPERTY_IS_DEBUG_SUPPORTED = (Uint32)(32768)
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
const HSA_EXT_CODE_TYPE_NONE = (Uint32)(0)
const HSA_EXT_CODE_TYPE_KERNEL = (Uint32)(1)
const HSA_EXT_CODE_TYPE_INDIRECT_FUNCTION = (Uint32)(2)
# end enum hsa_amd_code_type_t

# begin enum hsa_amd_code_unit_info_t
typealias hsa_amd_code_unit_info_t Uint32
const HSA_EXT_CODE_UNIT_INFO_VERSION = (Uint32)(1)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_COUNT = (Uint32)(3)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CODE = (Uint32)(4)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CODE_TYPE = (Uint32)(5)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_NAME = (Uint32)(6)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CALL_CONVENTION = (Uint32)(7)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_GROUP_SEGMENT_SIZE = (Uint32)(8)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_KERNARG_SEGMENT_SIZE = (Uint32)(9)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_SIZE = (Uint32)(10)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_DYNAMIC_CALL_STACK = (Uint32)(11)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_GROUP_SEGMENT_ALIGNMENT = (Uint32)(15)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_KERNARG_SEGMENT_ALIGNMENT = (Uint32)(16)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PRIVATE_SEGMENT_ALIGNMENT = (Uint32)(17)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_WAVEFRONT_SIZE = (Uint32)(18)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_WORKGROUP_FBARRIER_COUNT = (Uint32)(19)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_PROFILE = (Uint32)(20)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_MACHINE_MODEL = (Uint32)(21)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_HSAIL_VERSION_MAJOR = (Uint32)(22)
const HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_HSAIL_VERSION_MINOR = (Uint32)(23)
# end enum hsa_amd_code_unit_info_t

typealias hsa_ext_symbol_value_callback_t Ptr{Void}
typealias hsa_ext_code_unit_iterator_callback_t Ptr{Void}
