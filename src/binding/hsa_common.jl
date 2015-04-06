# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

# begin enum hsa_status_t
typealias hsa_status_t Uint32
const HSA_STATUS_SUCCESS = @compat (UInt32)(0)
const HSA_STATUS_INFO_BREAK = @compat (UInt32)(1)
const HSA_STATUS_ERROR = @compat (UInt32)(4096)
const HSA_STATUS_ERROR_INVALID_ARGUMENT = @compat (UInt32)(4097)
const HSA_STATUS_ERROR_INVALID_QUEUE_CREATION = @compat (UInt32)(4098)
const HSA_STATUS_ERROR_INVALID_ALLOCATION = @compat (UInt32)(4099)
const HSA_STATUS_ERROR_INVALID_AGENT = @compat (UInt32)(4100)
const HSA_STATUS_ERROR_INVALID_REGION = @compat (UInt32)(4101)
const HSA_STATUS_ERROR_INVALID_SIGNAL = @compat (UInt32)(4102)
const HSA_STATUS_ERROR_INVALID_QUEUE = @compat (UInt32)(4103)
const HSA_STATUS_ERROR_OUT_OF_RESOURCES = @compat (UInt32)(4104)
const HSA_STATUS_ERROR_INVALID_PACKET_FORMAT = @compat (UInt32)(4105)
const HSA_STATUS_ERROR_RESOURCE_FREE = @compat (UInt32)(4106)
const HSA_STATUS_ERROR_NOT_INITIALIZED = @compat (UInt32)(4107)
const HSA_STATUS_ERROR_REFCOUNT_OVERFLOW = @compat (UInt32)(4108)
const HSA_STATUS_ERROR_INCOMPATIBLE_ARGUMENTS = @compat (UInt32)(4109)
const HSA_STATUS_ERROR_INVALID_INDEX = @compat (UInt32)(4110)
const HSA_STATUS_ERROR_INVALID_ISA = @compat (UInt32)(4111)
const HSA_STATUS_ERROR_INVALID_ISA_NAME = @compat (UInt32)(4119)
const HSA_STATUS_ERROR_INVALID_CODE_OBJECT = @compat (UInt32)(4112)
const HSA_STATUS_ERROR_INVALID_EXECUTABLE = @compat (UInt32)(4113)
const HSA_STATUS_ERROR_FROZEN_EXECUTABLE = @compat (UInt32)(4114)
const HSA_STATUS_ERROR_INVALID_SYMBOL_NAME = @compat (UInt32)(4115)
const HSA_STATUS_ERROR_VARIABLE_ALREADY_DEFINED = @compat (UInt32)(4116)
const HSA_STATUS_ERROR_VARIABLE_UNDEFINED = @compat (UInt32)(4117)
const HSA_STATUS_ERROR_EXCEPTION = @compat (UInt32)(4118)
# end enum hsa_status_t

type hsa_dim3_t
    x::Uint32
    y::Uint32
    z::Uint32
end

# begin enum hsa_access_permission_t
typealias hsa_access_permission_t Uint32
const HSA_ACCESS_PERMISSION_RO = @compat (UInt32)(1)
const HSA_ACCESS_PERMISSION_WO = @compat (UInt32)(2)
const HSA_ACCESS_PERMISSION_RW = @compat (UInt32)(3)
# end enum hsa_access_permission_t

# begin enum hsa_endianness_t
typealias hsa_endianness_t Uint32
const HSA_ENDIANNESS_LITTLE = @compat (UInt32)(0)
const HSA_ENDIANNESS_BIG = @compat (UInt32)(1)
# end enum hsa_endianness_t

# begin enum hsa_machine_model_t
typealias hsa_machine_model_t Uint32
const HSA_MACHINE_MODEL_SMALL = @compat (UInt32)(0)
const HSA_MACHINE_MODEL_LARGE = @compat (UInt32)(1)
# end enum hsa_machine_model_t

# begin enum hsa_profile_t
typealias hsa_profile_t Uint32
const HSA_PROFILE_BASE = @compat (UInt32)(0)
const HSA_PROFILE_FULL = @compat (UInt32)(1)
# end enum hsa_profile_t

# begin enum hsa_system_info_t
typealias hsa_system_info_t Uint32
const HSA_SYSTEM_INFO_VERSION_MAJOR = @compat (UInt32)(0)
const HSA_SYSTEM_INFO_VERSION_MINOR = @compat (UInt32)(1)
const HSA_SYSTEM_INFO_TIMESTAMP = @compat (UInt32)(2)
const HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY = @compat (UInt32)(3)
const HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT = @compat (UInt32)(4)
const HSA_SYSTEM_INFO_ENDIANNESS = @compat (UInt32)(5)
const HSA_SYSTEM_INFO_MACHINE_MODEL = @compat (UInt32)(6)
const HSA_SYSTEM_INFO_EXTENSIONS = @compat (UInt32)(7)
# end enum hsa_system_info_t

# begin enum hsa_extension_t
typealias hsa_extension_t Uint32
const HSA_EXTENSION_FINALIZER = @compat (UInt32)(0)
const HSA_EXTENSION_IMAGES = @compat (UInt32)(1)
const HSA_EXTENSION_AMD_PROFILER = @compat (UInt32)(2)
# end enum hsa_extension_t

type hsa_agent_t
    handle::Uint64
end

# begin enum hsa_agent_feature_t
typealias hsa_agent_feature_t Uint32
const HSA_AGENT_FEATURE_KERNEL_DISPATCH = @compat (UInt32)(1)
const HSA_AGENT_FEATURE_AGENT_DISPATCH = @compat (UInt32)(2)
# end enum hsa_agent_feature_t

# begin enum hsa_device_type_t
typealias hsa_device_type_t Uint32
const HSA_DEVICE_TYPE_CPU = @compat (UInt32)(0)
const HSA_DEVICE_TYPE_GPU = @compat (UInt32)(1)
const HSA_DEVICE_TYPE_DSP = @compat (UInt32)(2)
# end enum hsa_device_type_t

# begin enum hsa_default_float_rounding_mode_t
typealias hsa_default_float_rounding_mode_t Uint32
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_DEFAULT = @compat (UInt32)(0)
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_ZERO = @compat (UInt32)(1)
const HSA_DEFAULT_FLOAT_ROUNDING_MODE_NEAR = @compat (UInt32)(2)
# end enum hsa_default_float_rounding_mode_t

# begin enum hsa_agent_info_t
typealias hsa_agent_info_t Uint32
const HSA_AGENT_INFO_NAME = @compat (UInt32)(0)
const HSA_AGENT_INFO_VENDOR_NAME = @compat (UInt32)(1)
const HSA_AGENT_INFO_FEATURE = @compat (UInt32)(2)
const HSA_AGENT_INFO_MACHINE_MODEL = @compat (UInt32)(3)
const HSA_AGENT_INFO_PROFILE = @compat (UInt32)(4)
const HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE = @compat (UInt32)(5)
const HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES = @compat (UInt32)(23)
const HSA_AGENT_INFO_FAST_F16_OPERATION = @compat (UInt32)(24)
const HSA_AGENT_INFO_WAVEFRONT_SIZE = @compat (UInt32)(6)
const HSA_AGENT_INFO_WORKGROUP_MAX_DIM = @compat (UInt32)(7)
const HSA_AGENT_INFO_WORKGROUP_MAX_SIZE = @compat (UInt32)(8)
const HSA_AGENT_INFO_GRID_MAX_DIM = @compat (UInt32)(9)
const HSA_AGENT_INFO_GRID_MAX_SIZE = @compat (UInt32)(10)
const HSA_AGENT_INFO_FBARRIER_MAX_SIZE = @compat (UInt32)(11)
const HSA_AGENT_INFO_QUEUES_MAX = @compat (UInt32)(12)
const HSA_AGENT_INFO_QUEUE_MIN_SIZE = @compat (UInt32)(13)
const HSA_AGENT_INFO_QUEUE_MAX_SIZE = @compat (UInt32)(14)
const HSA_AGENT_INFO_QUEUE_TYPE = @compat (UInt32)(15)
const HSA_AGENT_INFO_NODE = @compat (UInt32)(16)
const HSA_AGENT_INFO_DEVICE = @compat (UInt32)(17)
const HSA_AGENT_INFO_CACHE_SIZE = @compat (UInt32)(18)
const HSA_AGENT_INFO_ISA = @compat (UInt32)(19)
const HSA_AGENT_INFO_EXTENSIONS = @compat (UInt32)(20)
const HSA_AGENT_INFO_VERSION_MAJOR = @compat (UInt32)(21)
const HSA_AGENT_INFO_VERSION_MINOR = @compat (UInt32)(22)
const HSA_AGENT_INFO_COUNT = @compat (UInt32)(25)
# end enum hsa_agent_info_t

# begin enum hsa_exception_policy_t
typealias hsa_exception_policy_t Uint32
const HSA_EXCEPTION_POLICY_BREAK = @compat (UInt32)(1)
const HSA_EXCEPTION_POLICY_DETECT = @compat (UInt32)(2)
# end enum hsa_exception_policy_t

type hsa_signal_t
    handle::Uint64
end

typealias hsa_signal_value_t Int64

# begin enum hsa_signal_condition_t
typealias hsa_signal_condition_t Uint32
const HSA_SIGNAL_CONDITION_EQ = @compat (UInt32)(0)
const HSA_SIGNAL_CONDITION_NE = @compat (UInt32)(1)
const HSA_SIGNAL_CONDITION_LT = @compat (UInt32)(2)
const HSA_SIGNAL_CONDITION_GTE = @compat (UInt32)(3)
# end enum hsa_signal_condition_t

# begin enum hsa_wait_state_t
typealias hsa_wait_state_t Uint32
const HSA_WAIT_STATE_BLOCKED = @compat (UInt32)(0)
const HSA_WAIT_STATE_ACTIVE = @compat (UInt32)(1)
# end enum hsa_wait_state_t

type hsa_region_t
    handle::Uint64
end

# begin enum hsa_queue_type_t
typealias hsa_queue_type_t Uint32
const HSA_QUEUE_TYPE_MULTI = @compat (UInt32)(0)
const HSA_QUEUE_TYPE_SINGLE = @compat (UInt32)(1)
# end enum hsa_queue_type_t

# begin enum hsa_queue_feature_t
typealias hsa_queue_feature_t Uint32
const HSA_QUEUE_FEATURE_KERNEL_DISPATCH = @compat (UInt32)(1)
const HSA_QUEUE_FEATURE_AGENT_DISPATCH = @compat (UInt32)(2)
# end enum hsa_queue_feature_t

type hsa_queue_t
    _type::hsa_queue_type_t
    features::Uint32
    base_address::Ptr{Void}
    doorbell_signal::hsa_signal_t
    size::Uint32
    reserved1::Uint32
    id::Uint64
end

# begin enum hsa_packet_type_t
typealias hsa_packet_type_t Uint32
const HSA_PACKET_TYPE_VENDOR_SPECIFIC = @compat (UInt32)(0)
const HSA_PACKET_TYPE_INVALID = @compat (UInt32)(1)
const HSA_PACKET_TYPE_KERNEL_DISPATCH = @compat (UInt32)(2)
const HSA_PACKET_TYPE_BARRIER_AND = @compat (UInt32)(3)
const HSA_PACKET_TYPE_AGENT_DISPATCH = @compat (UInt32)(4)
const HSA_PACKET_TYPE_BARRIER_OR = @compat (UInt32)(5)
const HSA_PACKET_TYPE_COUNT = @compat (UInt32)(6)
# end enum hsa_packet_type_t

# begin enum hsa_fence_scope_t
typealias hsa_fence_scope_t Uint32
const HSA_FENCE_SCOPE_NONE = @compat (UInt32)(0)
const HSA_FENCE_SCOPE_AGENT = @compat (UInt32)(1)
const HSA_FENCE_SCOPE_SYSTEM = @compat (UInt32)(2)
# end enum hsa_fence_scope_t

# begin enum hsa_packet_header_t
typealias hsa_packet_header_t Uint32
const HSA_PACKET_HEADER_TYPE = @compat (UInt32)(0)
const HSA_PACKET_HEADER_BARRIER = @compat (UInt32)(8)
const HSA_PACKET_HEADER_ACQUIRE_FENCE_SCOPE = @compat (UInt32)(9)
const HSA_PACKET_HEADER_RELEASE_FENCE_SCOPE = @compat (UInt32)(11)
# end enum hsa_packet_header_t

# begin enum hsa_packet_header_width_t
typealias hsa_packet_header_width_t Uint32
const HSA_PACKET_HEADER_WIDTH_TYPE = @compat (UInt32)(8)
const HSA_PACKET_HEADER_WIDTH_BARRIER = @compat (UInt32)(1)
const HSA_PACKET_HEADER_WIDTH_ACQUIRE_FENCE_SCOPE = @compat (UInt32)(2)
const HSA_PACKET_HEADER_WIDTH_RELEASE_FENCE_SCOPE = @compat (UInt32)(2)
# end enum hsa_packet_header_width_t

# begin enum hsa_kernel_dispatch_packet_setup_t
typealias hsa_kernel_dispatch_packet_setup_t Uint32
const HSA_KERNEL_DISPATCH_PACKET_SETUP_DIMENSIONS = @compat (UInt32)(0)
# end enum hsa_kernel_dispatch_packet_setup_t

# begin enum hsa_kernel_dispatch_packet_setup_width_t
typealias hsa_kernel_dispatch_packet_setup_width_t Uint32
const HSA_KERNEL_DISPATCH_PACKET_SETUP_WIDTH_DIMENSIONS = @compat (UInt32)(2)
# end enum hsa_kernel_dispatch_packet_setup_width_t

type hsa_kernel_dispatch_packet_t
    header::Uint16
    setup::Uint16
    workgroup_size_x::Uint16
    workgroup_size_y::Uint16
    workgroup_size_z::Uint16
    reserved0::Uint16
    grid_size_x::Uint32
    grid_size_y::Uint32
    grid_size_z::Uint32
    private_segment_size::Uint32
    group_segment_size::Uint32
    kernel_object::Uint64
    kernarg_address::Ptr{Void}
    reserved2::Uint64
    completion_signal::hsa_signal_t
end

immutable Array_4_Uint64
    d1::Uint64
    d2::Uint64
    d3::Uint64
    d4::Uint64
end

zero(::Type{Array_4_Uint64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
        Array_4_Uint64(fill(zero(Uint64),4)...)
    end

type hsa_agent_dispatch_packet_t
    header::Uint16
    _type::Uint16
    reserved0::Uint32
    return_address::Ptr{Void}
    arg::Array_4_Uint64
    reserved2::Uint64
    completion_signal::hsa_signal_t
end

immutable Array_5_hsa_signal_t
    d1::hsa_signal_t
    d2::hsa_signal_t
    d3::hsa_signal_t
    d4::hsa_signal_t
    d5::hsa_signal_t
end

zero(::Type{Array_5_hsa_signal_t}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
        Array_5_hsa_signal_t(fill(zero(hsa_signal_t),5)...)
    end

type hsa_barrier_and_packet_t
    header::Uint16
    reserved0::Uint16
    reserved1::Uint32
    dep_signal::Array_5_hsa_signal_t
    reserved2::Uint64
    completion_signal::hsa_signal_t
end

type hsa_barrier_or_packet_t
    header::Uint16
    reserved0::Uint16
    reserved1::Uint32
    dep_signal::Array_5_hsa_signal_t
    reserved2::Uint64
    completion_signal::hsa_signal_t
end

# begin enum hsa_region_segment_t
typealias hsa_region_segment_t Uint32
const HSA_REGION_SEGMENT_GLOBAL = @compat (UInt32)(0)
const HSA_REGION_SEGMENT_READONLY = @compat (UInt32)(1)
const HSA_REGION_SEGMENT_PRIVATE = @compat (UInt32)(2)
const HSA_REGION_SEGMENT_GROUP = @compat (UInt32)(3)
const HSA_REGION_SEGMENT_ARG = @compat (UInt32)(4)
const HSA_REGION_SEGMENT_KERNARG = @compat (UInt32)(5)
const HSA_REGION_SEGMENT_SPILL = @compat (UInt32)(6)
# end enum hsa_region_segment_t

# begin enum hsa_region_global_flag_t
typealias hsa_region_global_flag_t Uint32
const HSA_REGION_GLOBAL_FLAG_KERNARG = @compat (UInt32)(1)
const HSA_REGION_GLOBAL_FLAG_FINE_GRAINED = @compat (UInt32)(2)
const HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED = @compat (UInt32)(4)
# end enum hsa_region_global_flag_t

# begin enum hsa_region_info_t
typealias hsa_region_info_t Uint32
const HSA_REGION_INFO_SEGMENT = @compat (UInt32)(0)
const HSA_REGION_INFO_GLOBAL_FLAGS = @compat (UInt32)(1)
const HSA_REGION_INFO_SIZE = @compat (UInt32)(2)
const HSA_REGION_INFO_ALLOC_MAX_SIZE = @compat (UInt32)(4)
const HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED = @compat (UInt32)(5)
const HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE = @compat (UInt32)(6)
const HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT = @compat (UInt32)(7)
const HSA_REGION_INFO_COUNT = @compat (UInt32)(8)
# end enum hsa_region_info_t

# begin enum hsa_symbol_kind_t
typealias hsa_symbol_kind_t Uint32
const HSA_SYMBOL_KIND_VARIABLE = @compat (UInt32)(0)
const HSA_SYMBOL_KIND_KERNEL = @compat (UInt32)(1)
const HSA_SYMBOL_KIND_INDIRECT_FUNCTION = @compat (UInt32)(2)
# end enum hsa_symbol_kind_t

# begin enum hsa_variable_allocation_t
typealias hsa_variable_allocation_t Uint32
const HSA_VARIABLE_ALLOCATION_AGENT = @compat (UInt32)(0)
const HSA_VARIABLE_ALLOCATION_PROGRAM = @compat (UInt32)(1)
# end enum hsa_variable_allocation_t

# begin enum hsa_symbol_linkage_t
typealias hsa_symbol_linkage_t Uint32
const HSA_SYMBOL_LINKAGE_MODULE = @compat (UInt32)(0)
const HSA_SYMBOL_LINKAGE_PROGRAM = @compat (UInt32)(1)
# end enum hsa_symbol_linkage_t

# begin enum hsa_variable_segment_t
typealias hsa_variable_segment_t Uint32
const HSA_VARIABLE_SEGMENT_GLOBAL = @compat (UInt32)(0)
const HSA_VARIABLE_SEGMENT_READONLY = @compat (UInt32)(1)
# end enum hsa_variable_segment_t

type hsa_isa_t
    handle::Uint64
end

# begin enum hsa_isa_info_t
typealias hsa_isa_info_t Uint32
const HSA_ISA_INFO_NAME_LENGTH = @compat (UInt32)(0)
const HSA_ISA_INFO_NAME = @compat (UInt32)(1)
const HSA_ISA_INFO_CALL_CONVENTION_COUNT = @compat (UInt32)(2)
const HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONT_SIZE = @compat (UInt32)(3)
const HSA_ISA_INFO_CALL_CONVENTION_INFO_WAVEFRONTS_PER_COMPUTE_UNIT = @compat (UInt32)(4)
# end enum hsa_isa_info_t

type hsa_code_object_t
    handle::Uint64
end

type hsa_callback_data_t
    handle::Uint64
end

# begin enum hsa_code_object_type_t
typealias hsa_code_object_type_t Uint32
const HSA_CODE_OBJECT_TYPE_PROGRAM = @compat (UInt32)(0)
# end enum hsa_code_object_type_t

# begin enum hsa_code_object_info_t
typealias hsa_code_object_info_t Uint32
const HSA_CODE_OBJECT_INFO_VERSION = @compat (UInt32)(0)
const HSA_CODE_OBJECT_INFO_TYPE = @compat (UInt32)(1)
const HSA_CODE_OBJECT_INFO_ISA = @compat (UInt32)(2)
const HSA_CODE_OBJECT_INFO_MACHINE_MODEL = @compat (UInt32)(3)
const HSA_CODE_OBJECT_INFO_PROFILE = @compat (UInt32)(4)
const HSA_CODE_OBJECT_INFO_DEFAULT_FLOAT_ROUNDING_MODE = @compat (UInt32)(5)
# end enum hsa_code_object_info_t

type hsa_code_symbol_t
    handle::Uint64
end

# begin enum hsa_code_symbol_info_t
typealias hsa_code_symbol_info_t Uint32
const HSA_CODE_SYMBOL_INFO_TYPE = @compat (UInt32)(0)
const HSA_CODE_SYMBOL_INFO_NAME_LENGTH = @compat (UInt32)(1)
const HSA_CODE_SYMBOL_INFO_NAME = @compat (UInt32)(2)
const HSA_CODE_SYMBOL_INFO_MODULE_NAME_LENGTH = @compat (UInt32)(3)
const HSA_CODE_SYMBOL_INFO_MODULE_NAME = @compat (UInt32)(4)
const HSA_CODE_SYMBOL_INFO_LINKAGE = @compat (UInt32)(5)
const HSA_CODE_SYMBOL_INFO_IS_DEFINITION = @compat (UInt32)(17)
const HSA_CODE_SYMBOL_INFO_VARIABLE_ALLOCATION = @compat (UInt32)(6)
const HSA_CODE_SYMBOL_INFO_VARIABLE_SEGMENT = @compat (UInt32)(7)
const HSA_CODE_SYMBOL_INFO_VARIABLE_ALIGNMENT = @compat (UInt32)(8)
const HSA_CODE_SYMBOL_INFO_VARIABLE_SIZE = @compat (UInt32)(9)
const HSA_CODE_SYMBOL_INFO_VARIABLE_IS_CONST = @compat (UInt32)(10)
const HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE = @compat (UInt32)(11)
const HSA_CODE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT = @compat (UInt32)(12)
const HSA_CODE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE = @compat (UInt32)(13)
const HSA_CODE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE = @compat (UInt32)(14)
const HSA_CODE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK = @compat (UInt32)(15)
const HSA_CODE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION = @compat (UInt32)(16)
# end enum hsa_code_symbol_info_t

type hsa_executable_t
    handle::Uint64
end

# begin enum hsa_executable_state_t
typealias hsa_executable_state_t Uint32
const HSA_EXECUTABLE_STATE_UNFROZEN = @compat (UInt32)(0)
const HSA_EXECUTABLE_STATE_FROZEN = @compat (UInt32)(1)
# end enum hsa_executable_state_t

# begin enum hsa_executable_info_t
typealias hsa_executable_info_t Uint32
const HSA_EXECUTABLE_INFO_PROFILE = @compat (UInt32)(1)
const HSA_EXECUTABLE_INFO_STATE = @compat (UInt32)(2)
# end enum hsa_executable_info_t

type hsa_executable_symbol_t
    handle::Uint64
end

# begin enum hsa_executable_symbol_info_t
typealias hsa_executable_symbol_info_t Uint32
const HSA_EXECUTABLE_SYMBOL_INFO_TYPE = @compat (UInt32)(0)
const HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH = @compat (UInt32)(1)
const HSA_EXECUTABLE_SYMBOL_INFO_NAME = @compat (UInt32)(2)
const HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH = @compat (UInt32)(3)
const HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME = @compat (UInt32)(4)
const HSA_EXECUTABLE_SYMBOL_INFO_AGENT = @compat (UInt32)(20)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS = @compat (UInt32)(21)
const HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE = @compat (UInt32)(5)
const HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION = @compat (UInt32)(17)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION = @compat (UInt32)(6)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT = @compat (UInt32)(7)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT = @compat (UInt32)(8)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE = @compat (UInt32)(9)
const HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST = @compat (UInt32)(10)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT = @compat (UInt32)(22)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE = @compat (UInt32)(11)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT = @compat (UInt32)(12)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE = @compat (UInt32)(13)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE = @compat (UInt32)(14)
const HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK = @compat (UInt32)(15)
const HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT = @compat (UInt32)(23)
const HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION = @compat (UInt32)(16)
# end enum hsa_executable_symbol_info_t

# begin enum hsa_amd_status_t
typealias hsa_amd_status_t Uint32
const HSA_EXT_AMD_STATUS_INFO_HALT_ITERATION = @compat (UInt32)(8192)
const HSA_EXT_AMD_STATUS_ERROR_INVALID_OPTION = @compat (UInt32)(12288)
# end enum hsa_amd_status_t

# begin enum hsa_amd_agent_info_t
typealias hsa_amd_agent_info_t Uint32
const HSA_EXT_AMD_AGENT_INFO_DEVICE_ID = @compat (UInt32)(25)
const HSA_EXT_AMD_AGENT_INFO_CACHELINE_SIZE = @compat (UInt32)(26)
const HSA_EXT_AMD_AGENT_INFO_COMPUTE_UNIT_COUNT = @compat (UInt32)(27)
const HSA_EXT_AMD_AGENT_INFO_MAX_CLOCK_FREQUENCY = @compat (UInt32)(28)
const HSA_EXT_AMD_AGENT_INFO_DRIVER_NODE_ID = @compat (UInt32)(29)
const HSA_EXT_AMD_AGENT_INFO_MAX_ADDRESS_WATCH_POINTS = @compat (UInt32)(30)
# end enum hsa_amd_agent_info_t

# begin enum hsa_amd_region_info_t
typealias hsa_amd_region_info_t Uint32
const HSA_EXT_AMD_REGION_INFO_HOST_ACCESS = @compat (UInt32)(8)
const HSA_EXT_AMD_REGION_INFO_BASE = @compat (UInt32)(9)
# end enum hsa_amd_region_info_t

# begin enum hsa_amd_memory_type_t
typealias hsa_amd_memory_type_t Uint32
const HSA_EXT_AMD_MEMORY_TYPE_COHERENT = @compat (UInt32)(0)
const HSA_EXT_AMD_MEMORY_TYPE_NONCOHERENT = @compat (UInt32)(1)
# end enum hsa_amd_memory_type_t

type hsa_amd_dispatch_time_t
    start::Uint64
    _end::Uint64
end

typealias hsa_ext_signal_handler Ptr{Void}
typealias BrigModule_t Ptr{Void}
typealias hsa_ext_module_t BrigModule_t

type hsa_ext_program_t
    handle::Uint64
end

# begin enum hsa_ext_program_info_t
typealias hsa_ext_program_info_t Uint32
const HSA_EXT_PROGRAM_INFO_MACHINE_MODEL = @compat (UInt32)(0)
const HSA_EXT_PROGRAM_INFO_PROFILE = @compat (UInt32)(1)
const HSA_EXT_PROGRAM_INFO_DEFAULT_FLOAT_ROUNDING_MODE = @compat (UInt32)(2)
# end enum hsa_ext_program_info_t

# begin enum hsa_ext_finalizer_call_convention_t
typealias hsa_ext_finalizer_call_convention_t Cint
const HSA_EXT_FINALIZER_CALL_CONVENTION_AUTO = @compat (Int32)(-1)
# end enum hsa_ext_finalizer_call_convention_t

immutable Array_3_Uint64
    d1::Uint64
    d2::Uint64
    d3::Uint64
end

zero(::Type{Array_3_Uint64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
        Array_3_Uint64(fill(zero(Uint64),3)...)
    end

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

zero(::Type{Array_75_Uint8}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
        Array_75_Uint8(fill(zero(Uint8),75)...)
    end

type hsa_ext_control_directives_t
    control_directives_mask::Uint64
    break_exceptions_mask::Uint16
    detect_exceptions_mask::Uint16
    max_dynamic_group_size::Uint32
    max_flat_grid_size::Uint64
    max_flat_workgroup_size::Uint32
    reserved1::Uint32
    required_grid_size::Array_3_Uint64
    required_workgroup_size::hsa_dim3_t
    required_dim::Uint8
    reserved2::Array_75_Uint8
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
    handle::Uint64
end

# begin enum hsa_ext_image_geometry_t
typealias hsa_ext_image_geometry_t Uint32
const HSA_EXT_IMAGE_GEOMETRY_1D = @compat (UInt32)(0)
const HSA_EXT_IMAGE_GEOMETRY_2D = @compat (UInt32)(1)
const HSA_EXT_IMAGE_GEOMETRY_3D = @compat (UInt32)(2)
const HSA_EXT_IMAGE_GEOMETRY_1DA = @compat (UInt32)(3)
const HSA_EXT_IMAGE_GEOMETRY_2DA = @compat (UInt32)(4)
const HSA_EXT_IMAGE_GEOMETRY_1DB = @compat (UInt32)(5)
const HSA_EXT_IMAGE_GEOMETRY_2DDEPTH = @compat (UInt32)(6)
const HSA_EXT_IMAGE_GEOMETRY_2DADEPTH = @compat (UInt32)(7)
# end enum hsa_ext_image_geometry_t

# begin enum hsa_ext_image_channel_type_t
typealias hsa_ext_image_channel_type_t Uint32
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT8 = @compat (UInt32)(0)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SNORM_INT16 = @compat (UInt32)(1)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT8 = @compat (UInt32)(2)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT16 = @compat (UInt32)(3)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_INT24 = @compat (UInt32)(4)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_555 = @compat (UInt32)(5)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_565 = @compat (UInt32)(6)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNORM_SHORT_101010 = @compat (UInt32)(7)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT8 = @compat (UInt32)(8)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT16 = @compat (UInt32)(9)
const HSA_EXT_IMAGE_CHANNEL_TYPE_SIGNED_INT32 = @compat (UInt32)(10)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT8 = @compat (UInt32)(11)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT16 = @compat (UInt32)(12)
const HSA_EXT_IMAGE_CHANNEL_TYPE_UNSIGNED_INT32 = @compat (UInt32)(13)
const HSA_EXT_IMAGE_CHANNEL_TYPE_HALF_FLOAT = @compat (UInt32)(14)
const HSA_EXT_IMAGE_CHANNEL_TYPE_FLOAT = @compat (UInt32)(15)
# end enum hsa_ext_image_channel_type_t

# begin enum hsa_ext_image_channel_order_t
typealias hsa_ext_image_channel_order_t Uint32
const HSA_EXT_IMAGE_CHANNEL_ORDER_A = @compat (UInt32)(0)
const HSA_EXT_IMAGE_CHANNEL_ORDER_R = @compat (UInt32)(1)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RX = @compat (UInt32)(2)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RG = @compat (UInt32)(3)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGX = @compat (UInt32)(4)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RA = @compat (UInt32)(5)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGB = @compat (UInt32)(6)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBX = @compat (UInt32)(7)
const HSA_EXT_IMAGE_CHANNEL_ORDER_RGBA = @compat (UInt32)(8)
const HSA_EXT_IMAGE_CHANNEL_ORDER_BGRA = @compat (UInt32)(9)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ARGB = @compat (UInt32)(10)
const HSA_EXT_IMAGE_CHANNEL_ORDER_ABGR = @compat (UInt32)(11)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGB = @compat (UInt32)(12)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBX = @compat (UInt32)(13)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SRGBA = @compat (UInt32)(14)
const HSA_EXT_IMAGE_CHANNEL_ORDER_SBGRA = @compat (UInt32)(15)
const HSA_EXT_IMAGE_CHANNEL_ORDER_INTENSITY = @compat (UInt32)(16)
const HSA_EXT_IMAGE_CHANNEL_ORDER_LUMINANCE = @compat (UInt32)(17)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH = @compat (UInt32)(18)
const HSA_EXT_IMAGE_CHANNEL_ORDER_DEPTH_STENCIL = @compat (UInt32)(19)
# end enum hsa_ext_image_channel_order_t

type hsa_ext_image_format_t
    channel_type::hsa_ext_image_channel_type_t
    channel_order::hsa_ext_image_channel_order_t
end

type hsa_ext_image_descriptor_t
    geometry::hsa_ext_image_geometry_t
    width::Csize_t
    height::Csize_t
    depth::Csize_t
    array_size::Csize_t
    format::hsa_ext_image_format_t
end

# begin enum hsa_ext_image_capability_t
typealias hsa_ext_image_capability_t Uint32
const HSA_EXT_IMAGE_CAPABILITY_NOT_SUPPORTED = @compat (UInt32)(0)
const HSA_EXT_IMAGE_CAPABILITY_READ_ONLY = @compat (UInt32)(1)
const HSA_EXT_IMAGE_CAPABILITY_WRITE_ONLY = @compat (UInt32)(2)
const HSA_EXT_IMAGE_CAPABILITY_READ_WRITE = @compat (UInt32)(4)
const HSA_EXT_IMAGE_CAPABILITY_READ_MODIFY_WRITE = @compat (UInt32)(8)
const HSA_EXT_IMAGE_CAPABILITY_ACCESS_INVARIANT_DATA_LAYOUT = @compat (UInt32)(16)
# end enum hsa_ext_image_capability_t

type hsa_ext_image_data_info_t
    size::Csize_t
    alignment::Csize_t
end

type hsa_ext_image_region_t
    offset::hsa_dim3_t
    range::hsa_dim3_t
end

type hsa_ext_sampler_t
    handle::Uint64
end

# begin enum hsa_ext_sampler_addressing_mode_t
typealias hsa_ext_sampler_addressing_mode_t Uint32
const HSA_EXT_SAMPLER_ADDRESSING_MODE_UNDEFINED = @compat (UInt32)(0)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_EDGE = @compat (UInt32)(1)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_CLAMP_TO_BORDER = @compat (UInt32)(2)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_REPEAT = @compat (UInt32)(3)
const HSA_EXT_SAMPLER_ADDRESSING_MODE_MIRRORED_REPEAT = @compat (UInt32)(4)
# end enum hsa_ext_sampler_addressing_mode_t

# begin enum hsa_ext_sampler_coordinate_mode_t
typealias hsa_ext_sampler_coordinate_mode_t Uint32
const HSA_EXT_SAMPLER_COORDINATE_MODE_UNNORMALIZED = @compat (UInt32)(0)
const HSA_EXT_SAMPLER_COORDINATE_MODE_NORMALIZED = @compat (UInt32)(1)
# end enum hsa_ext_sampler_coordinate_mode_t

# begin enum hsa_ext_sampler_filter_mode_t
typealias hsa_ext_sampler_filter_mode_t Uint32
const HSA_EXT_SAMPLER_FILTER_MODE_NEAREST = @compat (UInt32)(0)
const HSA_EXT_SAMPLER_FILTER_MODE_LINEAR = @compat (UInt32)(1)
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
