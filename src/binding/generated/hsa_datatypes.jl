# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

# begin enum hsa_status_t
typealias hsa_status_t UInt32
const HSA_STATUS_SUCCESS = (UInt32)(0)
const HSA_STATUS_INFO_BREAK = (UInt32)(1)
const HSA_STATUS_ERROR = (UInt32)(4096)
const HSA_STATUS_ERROR_INVALID_ARGUMENT = (UInt32)(4097)
const HSA_STATUS_ERROR_INVALID_QUEUE_CREATION = (UInt32)(4098)
const HSA_STATUS_ERROR_INVALID_ALLOCATION = (UInt32)(4099)
const HSA_STATUS_ERROR_INVALID_AGENT = (UInt32)(4100)
const HSA_STATUS_ERROR_INVALID_REGION = (UInt32)(4101)
const HSA_STATUS_ERROR_INVALID_SIGNAL = (UInt32)(4102)
const HSA_STATUS_ERROR_INVALID_QUEUE = (UInt32)(4103)
const HSA_STATUS_ERROR_OUT_OF_RESOURCES = (UInt32)(4104)
const HSA_STATUS_ERROR_INVALID_PACKET_FORMAT = (UInt32)(4105)
const HSA_STATUS_ERROR_RESOURCE_FREE = (UInt32)(4106)
const HSA_STATUS_ERROR_NOT_INITIALIZED = (UInt32)(4107)
const HSA_STATUS_ERROR_REFCOUNT_OVERFLOW = (UInt32)(4108)
const HSA_STATUS_ERROR_INCOMPATIBLE_ARGUMENTS = (UInt32)(4109)
const HSA_STATUS_ERROR_INVALID_INDEX = (UInt32)(4110)
const HSA_STATUS_ERROR_INVALID_ISA = (UInt32)(4111)
const HSA_STATUS_ERROR_INVALID_ISA_NAME = (UInt32)(4119)
const HSA_STATUS_ERROR_INVALID_CODE_OBJECT = (UInt32)(4112)
const HSA_STATUS_ERROR_INVALID_EXECUTABLE = (UInt32)(4113)
const HSA_STATUS_ERROR_FROZEN_EXECUTABLE = (UInt32)(4114)
const HSA_STATUS_ERROR_INVALID_SYMBOL_NAME = (UInt32)(4115)
const HSA_STATUS_ERROR_VARIABLE_ALREADY_DEFINED = (UInt32)(4116)
const HSA_STATUS_ERROR_VARIABLE_UNDEFINED = (UInt32)(4117)
const HSA_STATUS_ERROR_EXCEPTION = (UInt32)(4118)
# end enum hsa_status_t

type hsa_dim3_t
    x::UInt32
    y::UInt32
    z::UInt32
end

# begin enum hsa_access_permission_t
typealias hsa_access_permission_t UInt32
const HSA_ACCESS_PERMISSION_RO = (UInt32)(1)
const HSA_ACCESS_PERMISSION_WO = (UInt32)(2)
const HSA_ACCESS_PERMISSION_RW = (UInt32)(3)
# end enum hsa_access_permission_t

# begin enum hsa_endianness_t
typealias hsa_endianness_t UInt32
const HSA_ENDIANNESS_LITTLE = (UInt32)(0)
const HSA_ENDIANNESS_BIG = (UInt32)(1)
# end enum hsa_endianness_t

# begin enum hsa_machine_model_t
typealias hsa_machine_model_t UInt32
const HSA_MACHINE_MODEL_SMALL = (UInt32)(0)
const HSA_MACHINE_MODEL_LARGE = (UInt32)(1)
# end enum hsa_machine_model_t

# begin enum hsa_profile_t
typealias hsa_profile_t UInt32
const HSA_PROFILE_BASE = (UInt32)(0)
const HSA_PROFILE_FULL = (UInt32)(1)
# end enum hsa_profile_t

# begin enum hsa_system_info_t
typealias hsa_system_info_t UInt32
const HSA_SYSTEM_INFO_VERSION_MAJOR = (UInt32)(0)
const HSA_SYSTEM_INFO_VERSION_MINOR = (UInt32)(1)
const HSA_SYSTEM_INFO_TIMESTAMP = (UInt32)(2)
const HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY = (UInt32)(3)
const HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT = (UInt32)(4)
const HSA_SYSTEM_INFO_ENDIANNESS = (UInt32)(5)
const HSA_SYSTEM_INFO_MACHINE_MODEL = (UInt32)(6)
const HSA_SYSTEM_INFO_EXTENSIONS = (UInt32)(7)
# end enum hsa_system_info_t

# begin enum hsa_extension_t
typealias hsa_extension_t UInt32
const HSA_EXTENSION_FINALIZER = (UInt32)(0)
const HSA_EXTENSION_IMAGES = (UInt32)(1)
const HSA_EXTENSION_AMD_PROFILER = (UInt32)(2)
# end enum hsa_extension_t

type hsa_agent_t
    handle::UInt64
end

# begin enum hsa_agent_feature_t
typealias hsa_agent_feature_t UInt32
const HSA_AGENT_FEATURE_KERNEL_DISPATCH = (UInt32)(1)
const HSA_AGENT_FEATURE_AGENT_DISPATCH = (UInt32)(2)
# end enum hsa_agent_feature_t

# begin enum hsa_device_type_t
typealias hsa_device_type_t UInt32
const HSA_DEVICE_TYPE_CPU = (UInt32)(0)
const HSA_DEVICE_TYPE_GPU = (UInt32)(1)
const HSA_DEVICE_TYPE_DSP = (UInt32)(2)
# end enum hsa_device_type_t

# begin enum hsa_default_float_rounding_mode_t
typealias hsa_default_float_rounding_mode_t UInt32
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_DEFAULT = (UInt32)(0)
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_ZERO = (UInt32)(1)
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_NEAR = (UInt32)(2)
# end enum hsa_default_float_rounding_mode_t

# begin enum hsa_agent_info_t
typealias hsa_agent_info_t UInt32
const HSA_AGENT_INFO_NAME = (UInt32)(0)
const HSA_AGENT_INFO_VENDOR_NAME = (UInt32)(1)
const HSA_AGENT_INFO_FEATURE = (UInt32)(2)
const HSA_AGENT_INFO_MACHINE_MODEL = (UInt32)(3)
const HSA_AGENT_INFO_PROFILE = (UInt32)(4)
const HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE = (UInt32)(5)
const HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES = (UInt32)(23)
const HSA_AGENT_INFO_FAST_F16_OPERATION = (UInt32)(24)
const HSA_AGENT_INFO_WAVEFRONT_SIZE = (UInt32)(6)
const HSA_AGENT_INFO_WORKGROUP_MAX_DIM = (UInt32)(7)
const HSA_AGENT_INFO_WORKGROUP_MAX_SIZE = (UInt32)(8)
const HSA_AGENT_INFO_GRID_MAX_DIM = (UInt32)(9)
const HSA_AGENT_INFO_GRID_MAX_SIZE = (UInt32)(10)
const HSA_AGENT_INFO_FBARRIER_MAX_SIZE = (UInt32)(11)
const HSA_AGENT_INFO_QUEUES_MAX = (UInt32)(12)
const HSA_AGENT_INFO_QUEUE_MIN_SIZE = (UInt32)(13)
const HSA_AGENT_INFO_QUEUE_MAX_SIZE = (UInt32)(14)
const HSA_AGENT_INFO_QUEUE_TYPE = (UInt32)(15)
const HSA_AGENT_INFO_NODE = (UInt32)(16)
const HSA_AGENT_INFO_DEVICE = (UInt32)(17)
const HSA_AGENT_INFO_CACHE_SIZE = (UInt32)(18)
const HSA_AGENT_INFO_ISA = (UInt32)(19)
const HSA_AGENT_INFO_EXTENSIONS = (UInt32)(20)
const HSA_AGENT_INFO_VERSION_MAJOR = (UInt32)(21)
const HSA_AGENT_INFO_VERSION_MINOR = (UInt32)(22)
# end enum hsa_agent_info_t

# begin enum hsa_exception_policy_t
typealias hsa_exception_policy_t UInt32
const HSA_EXCEPTION_POLICY_BREAK = (UInt32)(1)
const HSA_EXCEPTION_POLICY_DETECT = (UInt32)(2)
# end enum hsa_exception_policy_t

type hsa_signal_t
    handle::UInt64
end

typealias hsa_signal_value_t Int64

# begin enum hsa_signal_condition_t
typealias hsa_signal_condition_t UInt32
const HSA_SIGNAL_CONDITION_EQ = (UInt32)(0)
const HSA_SIGNAL_CONDITION_NE = (UInt32)(1)
const HSA_SIGNAL_CONDITION_LT = (UInt32)(2)
const HSA_SIGNAL_CONDITION_GTE = (UInt32)(3)
# end enum hsa_signal_condition_t

# begin enum hsa_wait_state_t
typealias hsa_wait_state_t UInt32
const HSA_WAIT_STATE_BLOCKED = (UInt32)(0)
const HSA_WAIT_STATE_ACTIVE = (UInt32)(1)
# end enum hsa_wait_state_t

type hsa_region_t
    handle::UInt64
end

# begin enum hsa_queue_type_t
typealias hsa_queue_type_t UInt32
const HSA_QUEUE_TYPE_MULTI = (UInt32)(0)
const HSA_QUEUE_TYPE_SINGLE = (UInt32)(1)
# end enum hsa_queue_type_t

# begin enum hsa_queue_feature_t
typealias hsa_queue_feature_t UInt32
const HSA_QUEUE_FEATURE_KERNEL_DISPATCH = (UInt32)(1)
const HSA_QUEUE_FEATURE_AGENT_DISPATCH = (UInt32)(2)
# end enum hsa_queue_feature_t

type hsa_queue_t
    _type::hsa_queue_type_t
    features::UInt32
    base_address::Ptr{Void}
    doorbell_signal::hsa_signal_t
    size::UInt32
    reserved1::UInt32
    id::UInt64
end

# begin enum hsa_packet_type_t
typealias hsa_packet_type_t UInt32
const HSA_PACKET_TYPE_VENDOR_SPECIFIC = (UInt32)(0)
const HSA_PACKET_TYPE_INVALID = (UInt32)(1)
const HSA_PACKET_TYPE_KERNEL_DISPATCH = (UInt32)(2)
const HSA_PACKET_TYPE_BARRIER_AND = (UInt32)(3)
const HSA_PACKET_TYPE_AGENT_DISPATCH = (UInt32)(4)
const HSA_PACKET_TYPE_BARRIER_OR = (UInt32)(5)
# end enum hsa_packet_type_t

# begin enum hsa_fence_scope_t
typealias hsa_fence_scope_t UInt32
const HSA_FENCE_SCOPE_NONE = (UInt32)(0)
const HSA_FENCE_SCOPE_AGENT = (UInt32)(1)
const HSA_FENCE_SCOPE_SYSTEM = (UInt32)(2)
# end enum hsa_fence_scope_t

# begin enum hsa_packet_header_t
typealias hsa_packet_header_t UInt32
const HSA_PACKET_HEADER_TYPE = (UInt32)(0)
const HSA_PACKET_HEADER_BARRIER = (UInt32)(8)
const HSA_PACKET_HEADER_ACQUIRE_FENCE_SCOPE = (UInt32)(9)
const HSA_PACKET_HEADER_RELEASE_FENCE_SCOPE = (UInt32)(11)
# end enum hsa_packet_header_t

# begin enum hsa_packet_header_width_t
typealias hsa_packet_header_width_t UInt32
const HSA_PACKET_HEADER_WIDTH_TYPE = (UInt32)(8)
const HSA_PACKET_HEADER_WIDTH_BARRIER = (UInt32)(1)
const HSA_PACKET_HEADER_WIDTH_ACQUIRE_FENCE_SCOPE = (UInt32)(2)
const HSA_PACKET_HEADER_WIDTH_RELEASE_FENCE_SCOPE = (UInt32)(2)
# end enum hsa_packet_header_width_t

# begin enum hsa_kernel_dispatch_packet_setup_t
typealias hsa_kernel_dispatch_packet_setup_t UInt32
const HSA_KERNEL_DISPATCH_PACKET_SETUP_DIMENSIONS = (UInt32)(0)
# end enum hsa_kernel_dispatch_packet_setup_t

# begin enum hsa_kernel_dispatch_packet_setup_width_t
typealias hsa_kernel_dispatch_packet_setup_width_t UInt32
const HSA_KERNEL_DISPATCH_PACKET_SETUP_WIDTH_DIMENSIONS = (UInt32)(2)
# end enum hsa_kernel_dispatch_packet_setup_width_t

type hsa_kernel_dispatch_packet_t
    header::UInt16
    setup::UInt16
    workgroup_size_x::UInt16
    workgroup_size_y::UInt16
    workgroup_size_z::UInt16
    reserved0::UInt16
    grid_size_x::UInt32
    grid_size_y::UInt32
    grid_size_z::UInt32
    private_segment_size::UInt32
    group_segment_size::UInt32
    kernel_object::UInt64
    kernarg_address::Ptr{Void}
    reserved2::UInt64
    completion_signal::hsa_signal_t
end

immutable Array_4_UInt64
    d1::UInt64
    d2::UInt64
    d3::UInt64
    d4::UInt64
end

Base.zero(::Type{Array_4_UInt64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 266:
        Array_4_UInt64(fill(zero(UInt64),4)...)
    end

type hsa_agent_dispatch_packet_t
    header::UInt16
    _type::UInt16
    reserved0::UInt32
    return_address::Ptr{Void}
    arg::Array_4_UInt64
    reserved2::UInt64
    completion_signal::hsa_signal_t
end

immutable Array_5_hsa_signal_t
    d1::hsa_signal_t
    d2::hsa_signal_t
    d3::hsa_signal_t
    d4::hsa_signal_t
    d5::hsa_signal_t
end

Base.zero(::Type{Array_5_hsa_signal_t}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 266:
        Array_5_hsa_signal_t(fill(zero(hsa_signal_t),5)...)
    end

type hsa_barrier_and_packet_t
    header::UInt16
    reserved0::UInt16
    reserved1::UInt32
    dep_signal::Array_5_hsa_signal_t
    reserved2::UInt64
    completion_signal::hsa_signal_t
end

type hsa_barrier_or_packet_t
    header::UInt16
    reserved0::UInt16
    reserved1::UInt32
    dep_signal::Array_5_hsa_signal_t
    reserved2::UInt64
    completion_signal::hsa_signal_t
end

# begin enum hsa_region_segment_t
typealias hsa_region_segment_t UInt32
const HSA_REGION_SEGMENT_GLOBAL = (UInt32)(0)
const HSA_REGION_SEGMENT_READONLY = (UInt32)(1)
const HSA_REGION_SEGMENT_PRIVATE = (UInt32)(2)
const HSA_REGION_SEGMENT_GROUP = (UInt32)(3)
# end enum hsa_region_segment_t

# begin enum hsa_region_global_flag_t
typealias hsa_region_global_flag_t UInt32
const HSA_REGION_GLOBAL_FLAG_KERNARG = (UInt32)(1)
const HSA_REGION_GLOBAL_FLAG_FINE_GRAINED = (UInt32)(2)
const HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED = (UInt32)(4)
# end enum hsa_region_global_flag_t

# begin enum hsa_region_info_t
typealias hsa_region_info_t UInt32
const HSA_REGION_INFO_SEGMENT = (UInt32)(0)
const HSA_REGION_INFO_GLOBAL_FLAGS = (UInt32)(1)
const HSA_REGION_INFO_SIZE = (UInt32)(2)
const HSA_REGION_INFO_ALLOC_MAX_SIZE = (UInt32)(4)
const HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED = (UInt32)(5)
const HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE = (UInt32)(6)
const HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT = (UInt32)(7)
# end enum hsa_region_info_t

# begin enum hsa_symbol_kind_t
typealias hsa_symbol_kind_t UInt32
const HSA_SYMBOL_KIND_VARIABLE = (UInt32)(0)
const HSA_SYMBOL_KIND_KERNEL = (UInt32)(1)
const HSA_SYMBOL_KIND_INDIRECT_FUNCTION = (UInt32)(2)
# end enum hsa_symbol_kind_t

# begin enum hsa_variable_allocation_t
typealias hsa_variable_allocation_t UInt32
const HSA_VARIABLE_ALLOCATION_AGENT = (UInt32)(0)
const HSA_VARIABLE_ALLOCATION_PROGRAM = (UInt32)(1)
# end enum hsa_variable_allocation_t

# begin enum hsa_symbol_linkage_t
typealias hsa_symbol_linkage_t UInt32
const HSA_SYMBOL_LINKAGE_MODULE = (UInt32)(0)
const HSA_SYMBOL_LINKAGE_PROGRAM = (UInt32)(1)
# end enum hsa_symbol_linkage_t

# begin enum hsa_variable_segment_t
typealias hsa_variable_segment_t UInt32
const HSA_VARIABLE_SEGMENT_GLOBAL = (UInt32)(0)
const HSA_VARIABLE_SEGMENT_READONLY = (UInt32)(1)
# end enum hsa_variable_segment_t

type hsa_isa_t
    handle::UInt64
end

# begin enum hsa_isa_info_t
typealias hsa_isa_info_t UInt32
const HSA_ISA_INFO_NAME_LENGTH = (UInt32)(0)
const HSA_ISA_INFO_NAME = (UInt32)(1)
const HSA_ISA_INFO_CALL_CONVENTION_COUNT = (UInt32)(2)
const HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONT_SIZE = (UInt32)(3)
const HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONTS_PER_COMPUTE_UNIT = (UInt32)(4)
# end enum hsa_isa_info_t

type hsa_code_object_t
    handle::UInt64
end

type hsa_callback_data_t
    handle::UInt64
end

# begin enum hsa_code_object_type_t
typealias hsa_code_object_type_t UInt32
const HSA_CODE_OBJECT_TYPE_PROGRAM = (UInt32)(0)
# end enum hsa_code_object_type_t

# begin enum hsa_code_object_info_t
typealias hsa_code_object_info_t UInt32
const HSA_CODE_OBJECT_INFO_VERSION = (UInt32)(0)
const HSA_CODE_OBJECT_INFO_TYPE = (UInt32)(1)
const HSA_CODE_OBJECT_INFO_ISA = (UInt32)(2)
const HSA_CODE_OBJECT_INFO_MACHINE_MODEL = (UInt32)(3)
const HSA_CODE_OBJECT_INFO_PROFILE = (UInt32)(4)
const HSA_CODE_OBJECT_INFO_DEFAULT_FLOAT_ROUNDING_MODE = (UInt32)(5)
# end enum hsa_code_object_info_t

type hsa_code_symbol_t
    handle::UInt64
end

# begin enum hsa_code_symbol_info_t
typealias hsa_code_symbol_info_t UInt32
const HSA_CODE_SYMBOL_INFO_TYPE = (UInt32)(0)
const HSA_CODE_SYMBOL_INFO_NAME_LENGTH = (UInt32)(1)
const HSA_CODE_SYMBOL_INFO_NAME = (UInt32)(2)
const HSA_CODE_SYMBOL_INFO_MODULE_NAME_LENGTH = (UInt32)(3)
const HSA_CODE_SYMBOL_INFO_MODULE_NAME = (UInt32)(4)
const HSA_CODE_SYMBOL_INFO_LINKAGE = (UInt32)(5)
const HSA_CODE_SYMBOL_INFO_IS_DEFINITION = (UInt32)(17)
const HSA_CODE_SYMBOL_INFO_VARIABLE_ALLOCATION = (UInt32)(6)
const HSA_CODE_SYMBOL_INFO_VARIABLE_SEGMENT = (UInt32)(7)
const HSA_CODE_SYMBOL_INFO_VARIABLE_ALIGNMENT = (UInt32)(8)
const HSA_CODE_SYMBOL_INFO_VARIABLE_SIZE = (UInt32)(9)
const HSA_CODE_SYMBOL_INFO_VARIABLE_IS_CONST = (UInt32)(10)
const HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE = (UInt32)(11)
const HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT = (UInt32)(12)
const HSA_CODE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE = (UInt32)(13)
const HSA_CODE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE = (UInt32)(14)
const HSA_CODE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK = (UInt32)(15)
const HSA_CODE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION = (UInt32)(16)
# end enum hsa_code_symbol_info_t

type hsa_executable_t
    handle::UInt64
end

# begin enum hsa_executable_state_t
typealias hsa_executable_state_t UInt32
const HSA_EXECUTABLE_STATE_UNFROZEN = (UInt32)(0)
const HSA_EXECUTABLE_STATE_FROZEN = (UInt32)(1)
# end enum hsa_executable_state_t

# begin enum hsa_executable_info_t
typealias hsa_executable_info_t UInt32
const HSA_EXECUTABLE_INFO_PROFILE = (UInt32)(1)
const HSA_EXECUTABLE_INFO_STATE = (UInt32)(2)
# end enum hsa_executable_info_t

type hsa_executable_symbol_t
    handle::UInt64
end

# begin enum hsa_executable_symbol_info_t
typealias hsa_executable_symbol_info_t UInt32
const HSA_EXECUTABLE_SYMBOL_INFO_TYPE = (UInt32)(0)
const HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH = (UInt32)(1)
const HSA_EXECUTABLE_SYMBOL_INFO_NAME = (UInt32)(2)
const HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH = (UInt32)(3)
const HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME = (UInt32)(4)
const HSA_EXECUTABLE_SYMBOL_INFO_AGENT = (UInt32)(20)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS = (UInt32)(21)
const HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE = (UInt32)(5)
const HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION = (UInt32)(17)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION = (UInt32)(6)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT = (UInt32)(7)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT = (UInt32)(8)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE = (UInt32)(9)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST = (UInt32)(10)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT = (UInt32)(22)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE = (UInt32)(11)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT = (UInt32)(12)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE = (UInt32)(13)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE = (UInt32)(14)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK = (UInt32)(15)
const HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT = (UInt32)(23)
const HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION = (UInt32)(16)
# end enum hsa_executable_symbol_info_t

type BrigModuleHeader
end

typealias BrigModule_t Ptr{BrigModuleHeader}
typealias hsa_ext_module_t BrigModule_t

type hsa_ext_program_t
    handle::UInt64
end

# begin enum hsa_ext_program_info_t
typealias hsa_ext_program_info_t UInt32
const HSA_EXT_PROGRAM_INFO_MACHINE_MODEL = (UInt32)(0)
const HSA_EXT_PROGRAM_INFO_PROFILE = (UInt32)(1)
const HSA_EXT_PROGRAM_INFO_DEFAULT_FLOAT_ROUNDING_MODE = (UInt32)(2)
# end enum hsa_ext_program_info_t

# begin enum hsa_ext_finalizer_call_convention_t
typealias hsa_ext_finalizer_call_convention_t Cint
const HSA_EXT_FINALIZER_CALL_CONVENTION_AUTO = (Int32)(-1)
# end enum hsa_ext_finalizer_call_convention_t

immutable Array_3_UInt64
    d1::UInt64
    d2::UInt64
    d3::UInt64
end

Base.zero(::Type{Array_3_UInt64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 266:
        Array_3_UInt64(fill(zero(UInt64),3)...)
    end

immutable Array_75_UInt8
    d1::UInt8
    d2::UInt8
    d3::UInt8
    d4::UInt8
    d5::UInt8
    d6::UInt8
    d7::UInt8
    d8::UInt8
    d9::UInt8
    d10::UInt8
    d11::UInt8
    d12::UInt8
    d13::UInt8
    d14::UInt8
    d15::UInt8
    d16::UInt8
    d17::UInt8
    d18::UInt8
    d19::UInt8
    d20::UInt8
    d21::UInt8
    d22::UInt8
    d23::UInt8
    d24::UInt8
    d25::UInt8
    d26::UInt8
    d27::UInt8
    d28::UInt8
    d29::UInt8
    d30::UInt8
    d31::UInt8
    d32::UInt8
    d33::UInt8
    d34::UInt8
    d35::UInt8
    d36::UInt8
    d37::UInt8
    d38::UInt8
    d39::UInt8
    d40::UInt8
    d41::UInt8
    d42::UInt8
    d43::UInt8
    d44::UInt8
    d45::UInt8
    d46::UInt8
    d47::UInt8
    d48::UInt8
    d49::UInt8
    d50::UInt8
    d51::UInt8
    d52::UInt8
    d53::UInt8
    d54::UInt8
    d55::UInt8
    d56::UInt8
    d57::UInt8
    d58::UInt8
    d59::UInt8
    d60::UInt8
    d61::UInt8
    d62::UInt8
    d63::UInt8
    d64::UInt8
    d65::UInt8
    d66::UInt8
    d67::UInt8
    d68::UInt8
    d69::UInt8
    d70::UInt8
    d71::UInt8
    d72::UInt8
    d73::UInt8
    d74::UInt8
    d75::UInt8
end

Base.zero(::Type{Array_75_UInt8}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 266:
        Array_75_UInt8(fill(zero(UInt8),75)...)
    end

type hsa_ext_control_directives_t
    control_directives_mask::UInt64
    break_exceptions_mask::UInt16
    detect_exceptions_mask::UInt16
    max_dynamic_group_size::UInt32
    max_flat_grid_size::UInt64
    max_flat_workgroup_size::UInt32
    reserved1::UInt32
    required_grid_size::Array_3_UInt64
    required_workgroup_size::hsa_dim3_t
    required_dim::UInt8
    reserved2::Array_75_UInt8
end

type hsa_ext_finalizer_1_00_pfn_t
    hsa_ext_program_create::Ptr{Void}
    hsa_ext_program_destroy::Ptr{Void}
    hsa_ext_program_add_module::Ptr{Void}
    hsa_ext_program_iterate_modules::Ptr{Void}
    hsa_ext_program_get_info::Ptr{Void}
    hsa_ext_program_finalize::Ptr{Void}
end

type hsa_ext_image_t
    handle::UInt64
end

# begin enum hsa_ext_image_geometry_t
typealias hsa_ext_image_geometry_t UInt32
const HSA_EXT_IMAGE_GEOMETRY_1D = (UInt32)(0)
const HSA_EXT_IMAGE_GEOMETRY_2D = (UInt32)(1)
const HSA_EXT_IMAGE_GEOMETRY_3D = (UInt32)(2)
const HSA_EXT_IMAGE_GEOMETRY_1DA = (UInt32)(3)
const HSA_EXT_IMAGE_GEOMETRY_2DA = (UInt32)(4)
const HSA_EXT_IMAGE_GEOMETRY_1DB = (UInt32)(5)
const HSA_EXT_IMAGE_GEOMETRY_2DDEPTH = (UInt32)(6)
const HSA_EXT_IMAGE_GEOMETRY_2DADEPTH = (UInt32)(7)
# end enum hsa_ext_image_geometry_t

# begin enum hsa_ext_image_channel_type_t
typealias hsa_ext_image_channel_type_t UInt32
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT8 = (UInt32)(0)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT16 = (UInt32)(1)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT8 = (UInt32)(2)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT16 = (UInt32)(3)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT24 = (UInt32)(4)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_555 = (UInt32)(5)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_565 = (UInt32)(6)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_101010 = (UInt32)(7)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT8 = (UInt32)(8)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT16 = (UInt32)(9)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT32 = (UInt32)(10)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT8 = (UInt32)(11)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT16 = (UInt32)(12)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT32 = (UInt32)(13)
const HSA_EXT_IMAGE_CHANNEL_TYPE_HALF_FLOAT = (UInt32)(14)
const HSA_EXT_IMAGE_CHANNEL_TYPE_FLOAT = (UInt32)(15)
# end enum hsa_ext_image_channel_type_t

# begin enum hsa_ext_image_channel_order_t
typealias hsa_ext_image_channel_order_t UInt32
const HSA_EXT_IMAGE_CHANNEL_ORDER_A = (UInt32)(0)
const HSA_EXT_IMAGE_CHANNEL_ORDER_R = (UInt32)(1)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RX = (UInt32)(2)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RG = (UInt32)(3)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGX = (UInt32)(4)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RA = (UInt32)(5)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGB = (UInt32)(6)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBX = (UInt32)(7)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBA = (UInt32)(8)
const HSA_EXT_IMAGE_CHANNEL_ORDER_BGRA = (UInt32)(9)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ARGB = (UInt32)(10)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ABGR = (UInt32)(11)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGB = (UInt32)(12)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBX = (UInt32)(13)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBA = (UInt32)(14)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SBGRA = (UInt32)(15)
const HSA_EXT_IMAGE_CHANNEL_ORDER_INTENSITY = (UInt32)(16)
const HSA_EXT_IMAGE_CHANNEL_ORDER_LUMINANCE = (UInt32)(17)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH = (UInt32)(18)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH_STENCIL = (UInt32)(19)
# end enum hsa_ext_image_channel_order_t

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

# begin enum hsa_ext_image_capability_t
typealias hsa_ext_image_capability_t UInt32
const HSA_EXT_IMAGE_CAPABILITY_NOT_SUPPORTED = (UInt32)(0)
const HSA_EXT_IMAGE_CAPABILITY_READ_ONLY = (UInt32)(1)
const HSA_EXT_IMAGE_CAPABILITY_WRITE_ONLY = (UInt32)(2)
const HSA_EXT_IMAGE_CAPABILITY_READ_WRITE = (UInt32)(4)
const HSA_EXT_IMAGE_CAPABILITY_READ_MODIFY_WRITE = (UInt32)(8)
const HSA_EXT_IMAGE_CAPABILITY_ACCESS_INVARIANT_DATA_LAYOUT = (UInt32)(16)
# end enum hsa_ext_image_capability_t

type hsa_ext_image_data_info_t
    size::Cint
    alignment::Cint
end

type hsa_ext_image_region_t
    offset::hsa_dim3_t
    range::hsa_dim3_t
end

type hsa_ext_sampler_t
    handle::UInt64
end

# begin enum hsa_ext_sampler_addressing_mode_t
typealias hsa_ext_sampler_addressing_mode_t UInt32
const HSA_EXT_SAMPLER_ADDRESSING_MODE_UNDEFINED = (UInt32)(0)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_EDGE = (UInt32)(1)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_BORDER = (UInt32)(2)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_REPEAT = (UInt32)(3)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_MIRRORED_REPEAT = (UInt32)(4)
# end enum hsa_ext_sampler_addressing_mode_t

# begin enum hsa_ext_sampler_coordinate_mode_t
typealias hsa_ext_sampler_coordinate_mode_t UInt32
const HSA_EXT_SAMPLER_COORDINATE_MODE_UNNORMALIZED = (UInt32)(0)
const HSA_EXT_SAMPLER_COORDINATE_MODE_NORMALIZED = (UInt32)(1)
# end enum hsa_ext_sampler_coordinate_mode_t

# begin enum hsa_ext_sampler_filter_mode_t
typealias hsa_ext_sampler_filter_mode_t UInt32
const HSA_EXT_SAMPLER_FILTER_MODE_NEAREST = (UInt32)(0)
const HSA_EXT_SAMPLER_FILTER_MODE_LINEAR = (UInt32)(1)
# end enum hsa_ext_sampler_filter_mode_t

type hsa_ext_sampler_descriptor_t
    coordinate_mode::hsa_ext_sampler_coordinate_mode_t
    filter_mode::hsa_ext_sampler_filter_mode_t
    address_mode::hsa_ext_sampler_addressing_mode_t
end

type hsa_ext_images_1_00_pfn_t
    hsa_ext_image_get_capability::Ptr{Void}
    hsa_ext_image_data_get_info::Ptr{Void}
    hsa_ext_image_create::Ptr{Void}
    hsa_ext_image_destroy::Ptr{Void}
    hsa_ext_image_copy::Ptr{Void}
    hsa_ext_image_import::Ptr{Void}
    hsa_ext_image_export::Ptr{Void}
    hsa_ext_image_clear::Ptr{Void}
    hsa_ext_sampler_create::Ptr{Void}
    hsa_ext_sampler_destroy::Ptr{Void}
end


# Convenience Constants
# with HSA_ prefix removed and
# in CamelCase
    
const StatusSuccess = HSA_STATUS_SUCCESS
const StatusInfoBreak = HSA_STATUS_INFO_BREAK
const StatusError = HSA_STATUS_ERROR
const StatusErrorInvalidArgument = HSA_STATUS_ERROR_INVALID_ARGUMENT
const StatusErrorInvalidQueueCreation = HSA_STATUS_ERROR_INVALID_QUEUE_CREATION
const StatusErrorInvalidAllocation = HSA_STATUS_ERROR_INVALID_ALLOCATION
const StatusErrorInvalidAgent = HSA_STATUS_ERROR_INVALID_AGENT
const StatusErrorInvalidRegion = HSA_STATUS_ERROR_INVALID_REGION
const StatusErrorInvalidSignal = HSA_STATUS_ERROR_INVALID_SIGNAL
const StatusErrorInvalidQueue = HSA_STATUS_ERROR_INVALID_QUEUE
const StatusErrorOutOfResources = HSA_STATUS_ERROR_OUT_OF_RESOURCES
const StatusErrorInvalidPacketFormat = HSA_STATUS_ERROR_INVALID_PACKET_FORMAT
const StatusErrorResourceFree = HSA_STATUS_ERROR_RESOURCE_FREE
const StatusErrorNotInitialized = HSA_STATUS_ERROR_NOT_INITIALIZED
const StatusErrorRefcountOverflow = HSA_STATUS_ERROR_REFCOUNT_OVERFLOW
const StatusErrorIncompatibleArguments = HSA_STATUS_ERROR_INCOMPATIBLE_ARGUMENTS
const StatusErrorInvalidIndex = HSA_STATUS_ERROR_INVALID_INDEX
const StatusErrorInvalidIsa = HSA_STATUS_ERROR_INVALID_ISA
const StatusErrorInvalidIsaName = HSA_STATUS_ERROR_INVALID_ISA_NAME
const StatusErrorInvalidCodeObject = HSA_STATUS_ERROR_INVALID_CODE_OBJECT
const StatusErrorInvalidExecutable = HSA_STATUS_ERROR_INVALID_EXECUTABLE
const StatusErrorFrozenExecutable = HSA_STATUS_ERROR_FROZEN_EXECUTABLE
const StatusErrorInvalidSymbolName = HSA_STATUS_ERROR_INVALID_SYMBOL_NAME
const StatusErrorVariableAlreadyDefined = HSA_STATUS_ERROR_VARIABLE_ALREADY_DEFINED
const StatusErrorVariableUndefined = HSA_STATUS_ERROR_VARIABLE_UNDEFINED
const StatusErrorException = HSA_STATUS_ERROR_EXCEPTION
const AccessPermissionRo = HSA_ACCESS_PERMISSION_RO
const AccessPermissionWo = HSA_ACCESS_PERMISSION_WO
const AccessPermissionRw = HSA_ACCESS_PERMISSION_RW
const EndiannessLittle = HSA_ENDIANNESS_LITTLE
const EndiannessBig = HSA_ENDIANNESS_BIG
const MachineModelSmall = HSA_MACHINE_MODEL_SMALL
const MachineModelLarge = HSA_MACHINE_MODEL_LARGE
const ProfileBase = HSA_PROFILE_BASE
const ProfileFull = HSA_PROFILE_FULL
const SystemInfoVersionMajor = HSA_SYSTEM_INFO_VERSION_MAJOR
const SystemInfoVersionMinor = HSA_SYSTEM_INFO_VERSION_MINOR
const SystemInfoTimestamp = HSA_SYSTEM_INFO_TIMESTAMP
const SystemInfoTimestampFrequency = HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY
const SystemInfoSignalMaxWait = HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT
const SystemInfoEndianness = HSA_SYSTEM_INFO_ENDIANNESS
const SystemInfoMachineModel = HSA_SYSTEM_INFO_MACHINE_MODEL
const SystemInfoExtensions = HSA_SYSTEM_INFO_EXTENSIONS
const ExtensionFinalizer = HSA_EXTENSION_FINALIZER
const ExtensionImages = HSA_EXTENSION_IMAGES
const ExtensionAmdProfiler = HSA_EXTENSION_AMD_PROFILER
const AgentFeatureKernelDispatch = HSA_AGENT_FEATURE_KERNEL_DISPATCH
const AgentFeatureAgentDispatch = HSA_AGENT_FEATURE_AGENT_DISPATCH
const DeviceTypeCpu = HSA_DEVICE_TYPE_CPU
const DeviceTypeGpu = HSA_DEVICE_TYPE_GPU
const DeviceTypeDsp = HSA_DEVICE_TYPE_DSP
const DefaultFloatRoundingModeDefault = HSA_DEFAULT_FLOAT_ROUNDING_MODE_DEFAULT
const DefaultFloatRoundingModeZero = HSA_DEFAULT_FLOAT_ROUNDING_MODE_ZERO
const DefaultFloatRoundingModeNear = HSA_DEFAULT_FLOAT_ROUNDING_MODE_NEAR
const AgentInfoName = HSA_AGENT_INFO_NAME
const AgentInfoVendorName = HSA_AGENT_INFO_VENDOR_NAME
const AgentInfoFeature = HSA_AGENT_INFO_FEATURE
const AgentInfoMachineModel = HSA_AGENT_INFO_MACHINE_MODEL
const AgentInfoProfile = HSA_AGENT_INFO_PROFILE
const AgentInfoDefaultFloatRoundingMode = HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE
const AgentInfoBaseProfileDefaultFloatRoundingModes = HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES
const AgentInfoWavefrontSize = HSA_AGENT_INFO_WAVEFRONT_SIZE
const AgentInfoWorkgroupMaxDim = HSA_AGENT_INFO_WORKGROUP_MAX_DIM
const AgentInfoWorkgroupMaxSize = HSA_AGENT_INFO_WORKGROUP_MAX_SIZE
const AgentInfoGridMaxDim = HSA_AGENT_INFO_GRID_MAX_DIM
const AgentInfoGridMaxSize = HSA_AGENT_INFO_GRID_MAX_SIZE
const AgentInfoFbarrierMaxSize = HSA_AGENT_INFO_FBARRIER_MAX_SIZE
const AgentInfoQueuesMax = HSA_AGENT_INFO_QUEUES_MAX
const AgentInfoQueueMinSize = HSA_AGENT_INFO_QUEUE_MIN_SIZE
const AgentInfoQueueMaxSize = HSA_AGENT_INFO_QUEUE_MAX_SIZE
const AgentInfoQueueType = HSA_AGENT_INFO_QUEUE_TYPE
const AgentInfoNode = HSA_AGENT_INFO_NODE
const AgentInfoDevice = HSA_AGENT_INFO_DEVICE
const AgentInfoCacheSize = HSA_AGENT_INFO_CACHE_SIZE
const AgentInfoIsa = HSA_AGENT_INFO_ISA
const AgentInfoExtensions = HSA_AGENT_INFO_EXTENSIONS
const AgentInfoVersionMajor = HSA_AGENT_INFO_VERSION_MAJOR
const AgentInfoVersionMinor = HSA_AGENT_INFO_VERSION_MINOR
const ExceptionPolicyBreak = HSA_EXCEPTION_POLICY_BREAK
const ExceptionPolicyDetect = HSA_EXCEPTION_POLICY_DETECT
const SignalConditionEq = HSA_SIGNAL_CONDITION_EQ
const SignalConditionNe = HSA_SIGNAL_CONDITION_NE
const SignalConditionLt = HSA_SIGNAL_CONDITION_LT
const SignalConditionGte = HSA_SIGNAL_CONDITION_GTE
const WaitStateBlocked = HSA_WAIT_STATE_BLOCKED
const WaitStateActive = HSA_WAIT_STATE_ACTIVE
const QueueTypeMulti = HSA_QUEUE_TYPE_MULTI
const QueueTypeSingle = HSA_QUEUE_TYPE_SINGLE
const QueueFeatureKernelDispatch = HSA_QUEUE_FEATURE_KERNEL_DISPATCH
const QueueFeatureAgentDispatch = HSA_QUEUE_FEATURE_AGENT_DISPATCH
const PacketTypeVendorSpecific = UInt8(HSA_PACKET_TYPE_VENDOR_SPECIFIC)
const PacketTypeInvalid = UInt8(HSA_PACKET_TYPE_INVALID)
const PacketTypeKernelDispatch = UInt8(HSA_PACKET_TYPE_KERNEL_DISPATCH)
const PacketTypeBarrierAnd = UInt8(HSA_PACKET_TYPE_BARRIER_AND)
const PacketTypeAgentDispatch = UInt8(HSA_PACKET_TYPE_AGENT_DISPATCH)
const PacketTypeBarrierOr = UInt8(HSA_PACKET_TYPE_BARRIER_OR)
const FenceScopeNone = HSA_FENCE_SCOPE_NONE
const FenceScopeAgent = HSA_FENCE_SCOPE_AGENT
const FenceScopeSystem = HSA_FENCE_SCOPE_SYSTEM
const PacketHeaderType = HSA_PACKET_HEADER_TYPE
const PacketHeaderBarrier = HSA_PACKET_HEADER_BARRIER
const PacketHeaderAcquireFenceScope = HSA_PACKET_HEADER_ACQUIRE_FENCE_SCOPE
const PacketHeaderReleaseFenceScope = HSA_PACKET_HEADER_RELEASE_FENCE_SCOPE
const PacketHeaderWidthType = HSA_PACKET_HEADER_WIDTH_TYPE
const PacketHeaderWidthBarrier = HSA_PACKET_HEADER_WIDTH_BARRIER
const PacketHeaderWidthAcquireFenceScope = HSA_PACKET_HEADER_WIDTH_ACQUIRE_FENCE_SCOPE
const PacketHeaderWidthReleaseFenceScope = HSA_PACKET_HEADER_WIDTH_RELEASE_FENCE_SCOPE
const KernelDispatchPacketSetupDimensions = HSA_KERNEL_DISPATCH_PACKET_SETUP_DIMENSIONS
const KernelDispatchPacketSetupWidthDimensions = HSA_KERNEL_DISPATCH_PACKET_SETUP_WIDTH_DIMENSIONS
const RegionSegmentGlobal = HSA_REGION_SEGMENT_GLOBAL
const RegionSegmentReadonly = HSA_REGION_SEGMENT_READONLY
const RegionSegmentPrivate = HSA_REGION_SEGMENT_PRIVATE
const RegionSegmentGroup = HSA_REGION_SEGMENT_GROUP
const RegionGlobalFlagKernarg = HSA_REGION_GLOBAL_FLAG_KERNARG
const RegionGlobalFlagFineGrained = HSA_REGION_GLOBAL_FLAG_FINE_GRAINED
const RegionGlobalFlagCoarseGrained = HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED
const RegionInfoSegment = HSA_REGION_INFO_SEGMENT
const RegionInfoGlobalFlags = HSA_REGION_INFO_GLOBAL_FLAGS
const RegionInfoSize = HSA_REGION_INFO_SIZE
const RegionInfoAllocMaxSize = HSA_REGION_INFO_ALLOC_MAX_SIZE
const RegionInfoRuntimeAllocAllowed = HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED
const RegionInfoRuntimeAllocGranule = HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE
const RegionInfoRuntimeAllocAlignment = HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT
const SymbolKindVariable = HSA_SYMBOL_KIND_VARIABLE
const SymbolKindKernel = HSA_SYMBOL_KIND_KERNEL
const SymbolKindIndirectFunction = HSA_SYMBOL_KIND_INDIRECT_FUNCTION
const VariableAllocationAgent = HSA_VARIABLE_ALLOCATION_AGENT
const VariableAllocationProgram = HSA_VARIABLE_ALLOCATION_PROGRAM
const SymbolLinkageModule = HSA_SYMBOL_LINKAGE_MODULE
const SymbolLinkageProgram = HSA_SYMBOL_LINKAGE_PROGRAM
const VariableSegmentGlobal = HSA_VARIABLE_SEGMENT_GLOBAL
const VariableSegmentReadonly = HSA_VARIABLE_SEGMENT_READONLY
const IsaInfoNameLength = HSA_ISA_INFO_NAME_LENGTH
const IsaInfoName = HSA_ISA_INFO_NAME
const IsaInfoCallConventionCount = HSA_ISA_INFO_CALL_CONVENTION_COUNT
const IsaInfoCallConventionInfoWavefrontSize = HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONT_SIZE
const IsaInfoCallConventionInfoWavefrontsPerComputeUnit = HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONTS_PER_COMPUTE_UNIT
const CodeObjectTypeProgram = HSA_CODE_OBJECT_TYPE_PROGRAM
const CodeObjectInfoVersion = HSA_CODE_OBJECT_INFO_VERSION
const CodeObjectInfoType = HSA_CODE_OBJECT_INFO_TYPE
const CodeObjectInfoIsa = HSA_CODE_OBJECT_INFO_ISA
const CodeObjectInfoMachineModel = HSA_CODE_OBJECT_INFO_MACHINE_MODEL
const CodeObjectInfoProfile = HSA_CODE_OBJECT_INFO_PROFILE
const CodeObjectInfoDefaultFloatRoundingMode = HSA_CODE_OBJECT_INFO_DEFAULT_FLOAT_ROUNDING_MODE
const CodeSymbolInfoType = HSA_CODE_SYMBOL_INFO_TYPE
const CodeSymbolInfoNameLength = HSA_CODE_SYMBOL_INFO_NAME_LENGTH
const CodeSymbolInfoName = HSA_CODE_SYMBOL_INFO_NAME
const CodeSymbolInfoModuleNameLength = HSA_CODE_SYMBOL_INFO_MODULE_NAME_LENGTH
const CodeSymbolInfoModuleName = HSA_CODE_SYMBOL_INFO_MODULE_NAME
const CodeSymbolInfoLinkage = HSA_CODE_SYMBOL_INFO_LINKAGE
const CodeSymbolInfoIsDefinition = HSA_CODE_SYMBOL_INFO_IS_DEFINITION
const CodeSymbolInfoVariableAllocation = HSA_CODE_SYMBOL_INFO_VARIABLE_ALLOCATION
const CodeSymbolInfoVariableSegment = HSA_CODE_SYMBOL_INFO_VARIABLE_SEGMENT
const CodeSymbolInfoVariableAlignment = HSA_CODE_SYMBOL_INFO_VARIABLE_ALIGNMENT
const CodeSymbolInfoVariableSize = HSA_CODE_SYMBOL_INFO_VARIABLE_SIZE
const CodeSymbolInfoVariableIsConst = HSA_CODE_SYMBOL_INFO_VARIABLE_IS_CONST
const CodeSymbolInfoKernelKernargSegmentSize = HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE
const CodeSymbolInfoKernelKernargSegmentAlignment = HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT
const CodeSymbolInfoKernelGroupSegmentSize = HSA_CODE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE
const CodeSymbolInfoKernelPrivateSegmentSize = HSA_CODE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE
const CodeSymbolInfoKernelDynamicCallstack = HSA_CODE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK
const CodeSymbolInfoIndirectFunctionCallConvention = HSA_CODE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION
const ExecutableStateUnfrozen = HSA_EXECUTABLE_STATE_UNFROZEN
const ExecutableStateFrozen = HSA_EXECUTABLE_STATE_FROZEN
const ExecutableInfoProfile = HSA_EXECUTABLE_INFO_PROFILE
const ExecutableInfoState = HSA_EXECUTABLE_INFO_STATE
const ExecutableSymbolInfoType = HSA_EXECUTABLE_SYMBOL_INFO_TYPE
const ExecutableSymbolInfoNameLength = HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH
const ExecutableSymbolInfoName = HSA_EXECUTABLE_SYMBOL_INFO_NAME
const ExecutableSymbolInfoModuleNameLength = HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH
const ExecutableSymbolInfoModuleName = HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME
const ExecutableSymbolInfoAgent = HSA_EXECUTABLE_SYMBOL_INFO_AGENT
const ExecutableSymbolInfoVariableAddress = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS
const ExecutableSymbolInfoLinkage = HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE
const ExecutableSymbolInfoIsDefinition = HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION
const ExecutableSymbolInfoVariableAllocation = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION
const ExecutableSymbolInfoVariableSegment = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT
const ExecutableSymbolInfoVariableAlignment = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT
const ExecutableSymbolInfoVariableSize = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE
const ExecutableSymbolInfoVariableIsConst = HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST
const ExecutableSymbolInfoKernelObject = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT
const ExecutableSymbolInfoKernelKernargSegmentSize = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE
const ExecutableSymbolInfoKernelKernargSegmentAlignment = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT
const ExecutableSymbolInfoKernelGroupSegmentSize = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE
const ExecutableSymbolInfoKernelPrivateSegmentSize = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE
const ExecutableSymbolInfoKernelDynamicCallstack = HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK
const ExecutableSymbolInfoIndirectFunctionObject = HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT
const ExecutableSymbolInfoIndirectFunctionCallConvention = HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION
const ExtProgramInfoMachineModel = HSA_EXT_PROGRAM_INFO_MACHINE_MODEL
const ExtProgramInfoProfile = HSA_EXT_PROGRAM_INFO_PROFILE
const ExtProgramInfoDefaultFloatRoundingMode = HSA_EXT_PROGRAM_INFO_DEFAULT_FLOAT_ROUNDING_MODE
const ExtFinalizerCallConventionAuto = HSA_EXT_FINALIZER_CALL_CONVENTION_AUTO
const ExtImageChannelTypeHalfFloat = HSA_EXT_IMAGE_CHANNEL_TYPE_HALF_FLOAT
const ExtImageChannelTypeFloat = HSA_EXT_IMAGE_CHANNEL_TYPE_FLOAT
const ExtImageChannelOrderA = HSA_EXT_IMAGE_CHANNEL_ORDER_A
const ExtImageChannelOrderR = HSA_EXT_IMAGE_CHANNEL_ORDER_R
const ExtImageChannelOrderRx = HSA_EXT_IMAGE_CHANNEL_ORDER_RX
const ExtImageChannelOrderRg = HSA_EXT_IMAGE_CHANNEL_ORDER_RG
const ExtImageChannelOrderRgx = HSA_EXT_IMAGE_CHANNEL_ORDER_RGX
const ExtImageChannelOrderRa = HSA_EXT_IMAGE_CHANNEL_ORDER_RA
const ExtImageChannelOrderRgb = HSA_EXT_IMAGE_CHANNEL_ORDER_RGB
const ExtImageChannelOrderRgbx = HSA_EXT_IMAGE_CHANNEL_ORDER_RGBX
const ExtImageChannelOrderRgba = HSA_EXT_IMAGE_CHANNEL_ORDER_RGBA
const ExtImageChannelOrderBgra = HSA_EXT_IMAGE_CHANNEL_ORDER_BGRA
const ExtImageChannelOrderArgb = HSA_EXT_IMAGE_CHANNEL_ORDER_ARGB
const ExtImageChannelOrderAbgr = HSA_EXT_IMAGE_CHANNEL_ORDER_ABGR
const ExtImageChannelOrderSrgb = HSA_EXT_IMAGE_CHANNEL_ORDER_SRGB
const ExtImageChannelOrderSrgbx = HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBX
const ExtImageChannelOrderSrgba = HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBA
const ExtImageChannelOrderSbgra = HSA_EXT_IMAGE_CHANNEL_ORDER_SBGRA
const ExtImageChannelOrderIntensity = HSA_EXT_IMAGE_CHANNEL_ORDER_INTENSITY
const ExtImageChannelOrderLuminance = HSA_EXT_IMAGE_CHANNEL_ORDER_LUMINANCE
const ExtImageChannelOrderDepth = HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH
const ExtImageChannelOrderDepthStencil = HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH_STENCIL
const ExtImageCapabilityNotSupported = HSA_EXT_IMAGE_CAPABILITY_NOT_SUPPORTED
const ExtImageCapabilityReadOnly = HSA_EXT_IMAGE_CAPABILITY_READ_ONLY
const ExtImageCapabilityWriteOnly = HSA_EXT_IMAGE_CAPABILITY_WRITE_ONLY
const ExtImageCapabilityReadWrite = HSA_EXT_IMAGE_CAPABILITY_READ_WRITE
const ExtImageCapabilityReadModifyWrite = HSA_EXT_IMAGE_CAPABILITY_READ_MODIFY_WRITE
const ExtImageCapabilityAccessInvariantDataLayout = HSA_EXT_IMAGE_CAPABILITY_ACCESS_INVARIANT_DATA_LAYOUT
const ExtSamplerAddressingModeUndefined = HSA_EXT_SAMPLER_ADDRESSING_MODE_UNDEFINED
const ExtSamplerAddressingModeClampToEdge = HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_EDGE
const ExtSamplerAddressingModeClampToBorder = HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_BORDER
const ExtSamplerAddressingModeRepeat = HSA_EXT_SAMPLER_ADDRESSING_MODE_REPEAT
const ExtSamplerAddressingModeMirroredRepeat = HSA_EXT_SAMPLER_ADDRESSING_MODE_MIRRORED_REPEAT
const ExtSamplerCoordinateModeUnnormalized = HSA_EXT_SAMPLER_COORDINATE_MODE_UNNORMALIZED
const ExtSamplerCoordinateModeNormalized = HSA_EXT_SAMPLER_COORDINATE_MODE_NORMALIZED
const ExtSamplerFilterModeNearest = HSA_EXT_SAMPLER_FILTER_MODE_NEAREST
const ExtSamplerFilterModeLinear = HSA_EXT_SAMPLER_FILTER_MODE_LINEAR

begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_type(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{hsa_queue_type_t},ptr + 0x0000000000000000) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_size(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt32},ptr + 0x0000000000000018) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_features(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{hsa_queue_feature_t},ptr + 0x0000000000000004) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_id(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000020) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_base_address(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000008) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_doorbell_signal(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000010) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 15:
        return unsafe_load(field_ptr)
    end
end

function system_info_endianness() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_endianness_t}(Base.zero(hsa_endianness_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_ENDIANNESS,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_version_major() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_VERSION_MAJOR,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_signal_max_wait() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_machine_model() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_machine_model_t}(Base.zero(hsa_machine_model_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_MACHINE_MODEL,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_version_minor() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_VERSION_MINOR,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_extensions() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        v_arr = Array(UInt8,128)
        value = pointer(v_arr)
    end # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_EXTENSIONS,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = v_arr
end

function system_info_timestamp() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_TIMESTAMP,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function system_info_timestamp_frequency() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_vendor_name(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Array(UInt8,64) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VENDOR_NAME,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = strip(ascii(value),'\0')
end

function agent_info_default_float_rounding_mode(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_default_float_rounding_mode_t}(Base.zero(hsa_default_float_rounding_mode_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_image2d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_image_rd_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_RD_MAX,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_queue_min_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_MIN_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_name(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Array(UInt8,64) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NAME,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = strip(ascii(value),'\0')
end

function agent_info_profile(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_profile_t}(Base.zero(hsa_profile_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_PROFILE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_cache_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Tuple{UInt32,UInt32,UInt32,UInt32}}(Base.zero(Tuple{UInt32,UInt32,UInt32,UInt32})) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_CACHE_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_fbarrier_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FBARRIER_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_workgroup_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WORKGROUP_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_extensions(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        v_arr = Array(UInt8,128)
        value = pointer(v_arr)
    end # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_EXTENSIONS,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = v_arr
end

function ext_agent_info_image_rdwr_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_grid_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_GRID_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_node(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NODE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_device(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_device_type_t}(Base.zero(hsa_device_type_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_DEVICE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_queue_type(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_queue_type_t}(Base.zero(hsa_queue_type_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_TYPE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_version_major(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VERSION_MAJOR,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_workgroup_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Tuple{UInt16,UInt16,UInt16}}(Base.zero(Tuple{UInt16,UInt16,UInt16})) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WORKGROUP_MAX_DIM,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_wavefront_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WAVEFRONT_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_isa(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_isa_t}(Base.zero(hsa_isa_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_ISA,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_version_minor(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VERSION_MINOR,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_machine_model(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_machine_model_t}(Base.zero(hsa_machine_model_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_MACHINE_MODEL,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_queues_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUES_MAX,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_image3d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_image_array_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_sampler_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_SAMPLER_MAX,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_queue_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_grid_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_GRID_MAX_DIM,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_fast_f16_operation(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FAST_F16_OPERATION,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_feature(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_agent_feature_t}(Base.zero(hsa_agent_feature_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FEATURE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function agent_info_base_profile_default_float_rounding_modes(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_default_float_rounding_mode_t}(Base.zero(hsa_default_float_rounding_mode_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function ext_agent_info_image1d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_runtime_alloc_alignment(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_runtime_alloc_granule(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_global_flags(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_region_global_flag_t}(Base.zero(hsa_region_global_flag_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_GLOBAL_FLAGS,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_alloc_max_size(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_ALLOC_MAX_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_size(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_runtime_alloc_allowed(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function region_info_segment(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_region_segment_t}(Base.zero(hsa_region_segment_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_SEGMENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function isa_info_name_length(isa) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME_LENGTH,Base.zero(UInt32),value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function isa_info_name(isa) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = isa_info_name_length(isa)
        value = Array(UInt8,len)
    end # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME,Base.zero(UInt32),value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = strip(ascii(value),'\0')
end

function executable_info_state(executable) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_executable_state_t}(Base.zero(hsa_executable_state_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,HSA_EXECUTABLE_INFO_STATE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_info_profile(executable) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_profile_t}(Base.zero(hsa_profile_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,HSA_EXECUTABLE_INFO_PROFILE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_indirect_function_object(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_linkage(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_symbol_kind_linkage_t}(Base.zero(hsa_symbol_kind_linkage_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_kernel_kernarg_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_name(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = executable_symbol_info_name_length(symbol)
        value = Array(UInt8,len)
    end # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = strip(ascii(value),'\0')
end

function executable_symbol_info_kernel_group_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_variable_allocation(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_variable_allocation_t}(Base.zero(hsa_variable_allocation_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_kernel_object(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_module_name_length(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_kernel_dynamic_callstack(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_is_definition(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_variable_alignment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_variable_segment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_variable_segment_t}(Base.zero(hsa_variable_segment_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_kernel_kernarg_segment_alignment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_type(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_symbol_kind_t}(Base.zero(hsa_symbol_kind_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_TYPE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_module_name(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = executable_symbol_info_module_name_length(symbol)
        value = Array(UInt8,len)
    end # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = strip(ascii(value),'\0')
end

function executable_symbol_info_variable_address(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_kernel_private_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_agent(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_agent_t}(Base.zero(hsa_agent_t)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_AGENT,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_variable_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_name_length(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_variable_is_const(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end

function executable_symbol_info_indirect_function_call_convention(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION,value) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 69:
    test_status(err) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 71:
    value = value.x
end
