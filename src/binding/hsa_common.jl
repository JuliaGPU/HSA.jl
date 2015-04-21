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

Base.zero(::Type{Array_4_Uint64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
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

Base.zero(::Type{Array_5_hsa_signal_t}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
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

Base.zero(::Type{Array_3_Uint64}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
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

Base.zero(::Type{Array_75_Uint8}) = begin  # /home/strollinger/.julia/v0.4/Clang/src/wrap_c.jl, line 265:
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
const AgentInfoCount = HSA_AGENT_INFO_COUNT
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
const PacketTypeVendorSpecific = Uint8(HSA_PACKET_TYPE_VENDOR_SPECIFIC)
const PacketTypeInvalid = Uint8(HSA_PACKET_TYPE_INVALID)
const PacketTypeKernelDispatch = Uint8(HSA_PACKET_TYPE_KERNEL_DISPATCH)
const PacketTypeBarrierAnd = Uint8(HSA_PACKET_TYPE_BARRIER_AND)
const PacketTypeAgentDispatch = Uint8(HSA_PACKET_TYPE_AGENT_DISPATCH)
const PacketTypeBarrierOr = Uint8(HSA_PACKET_TYPE_BARRIER_OR)
const PacketTypeCount = Uint8(HSA_PACKET_TYPE_COUNT)
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
const RegionSegmentArg = HSA_REGION_SEGMENT_ARG
const RegionSegmentKernarg = HSA_REGION_SEGMENT_KERNARG
const RegionSegmentSpill = HSA_REGION_SEGMENT_SPILL
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
const RegionInfoCount = HSA_REGION_INFO_COUNT
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
        field_ptr = convert(Ptr{hsa_queue_type_t},ptr + 0x0000000000000000) # line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_size(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt32},ptr + 0x0000000000000018) # line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_features(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{hsa_queue_feature_t},ptr + 0x0000000000000004) # line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_id(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000020) # line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_base_address(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000008) # line 15:
        return unsafe_load(field_ptr)
    end
end
begin  # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 13:
    function queue_info_doorbell_signal(ptr::Ptr{hsa_queue_t}) # /home/strollinger/hsa/jl/gen/gen_fieldgetters.jl, line 14:
        field_ptr = convert(Ptr{UInt64},ptr + 0x0000000000000010) # line 15:
        return unsafe_load(field_ptr)
    end
end

function system_info_endianness() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_endianness_t}(Base.zero(hsa_endianness_t)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_ENDIANNESS,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_version_major() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_VERSION_MAJOR,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_signal_max_wait() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_SIGNAL_MAX_WAIT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_machine_model() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_machine_model_t}(Base.zero(hsa_machine_model_t)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_MACHINE_MODEL,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_version_minor() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_VERSION_MINOR,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_extensions() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        v_arr = Array(UInt8,128)
        value = pointer(v_arr)
    end # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_EXTENSIONS,value) # line 69:
    test_status(err) # line 71:
    value = v_arr
end

function system_info_timestamp() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_TIMESTAMP,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function system_info_timestamp_frequency() # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # line 67:
    err = ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),HSA_SYSTEM_INFO_TIMESTAMP_FREQUENCY,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_vendor_name(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Array(Uint8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VENDOR_NAME,value) # line 69:
    test_status(err) # line 71:
    value = ascii(value)
end

function agent_info_default_float_rounding_mode(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_default_float_rounding_mode_t}(Base.zero(hsa_default_float_rounding_mode_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_DEFAULT_FLOAT_ROUNDING_MODE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_image2d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE2D_MAX_DIM,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_image_rd_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_RD_MAX,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_queue_min_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_MIN_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_name(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Array(Uint8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = ascii(value)
end

function agent_info_profile(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_profile_t}(Base.zero(hsa_profile_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_PROFILE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_cache_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Tuple{UInt32,UInt32,UInt32,UInt32}}(Base.zero(Tuple{UInt32,UInt32,UInt32,UInt32})) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_CACHE_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_fbarrier_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FBARRIER_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_workgroup_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WORKGROUP_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_extensions(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        v_arr = Array(UInt8,128)
        value = pointer(v_arr)
    end # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_EXTENSIONS,value) # line 69:
    test_status(err) # line 71:
    value = v_arr
end

function ext_agent_info_image_rdwr_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_RDWR_MAX,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_grid_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_GRID_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_node(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NODE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_device(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_device_type_t}(Base.zero(hsa_device_type_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_DEVICE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_queue_type(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_queue_type_t}(Base.zero(hsa_queue_type_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_TYPE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_version_major(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VERSION_MAJOR,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_workgroup_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Tuple{UInt16,UInt16,UInt16}}(Base.zero(Tuple{UInt16,UInt16,UInt16})) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WORKGROUP_MAX_DIM,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_wavefront_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_WAVEFRONT_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_isa(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_isa_t}(Base.zero(hsa_isa_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_ISA,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_version_minor(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt16}(Base.zero(UInt16)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VERSION_MINOR,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_machine_model(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_machine_model_t}(Base.zero(hsa_machine_model_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_MACHINE_MODEL,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_queues_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUES_MAX,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_image3d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE3D_MAX_DIM,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_image_array_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE_ARRAY_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_sampler_max(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_SAMPLER_MAX,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_queue_max_size(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_QUEUE_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_grid_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_GRID_MAX_DIM,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_fast_f16_operation(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FAST_F16_OPERATION,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_feature(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_agent_feature_t}(Base.zero(hsa_agent_feature_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_FEATURE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function agent_info_base_profile_default_float_rounding_modes(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_default_float_rounding_mode_t}(Base.zero(hsa_default_float_rounding_mode_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_BASE_PROFILE_DEFAULT_FLOAT_ROUNDING_MODES,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function ext_agent_info_image1d_max_dim(agent) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_dim3_t}(Base.zero(hsa_dim3_t)) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_EXT_AGENT_INFO_IMAGE1D_MAX_DIM,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_runtime_alloc_alignment(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_runtime_alloc_granule(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_global_flags(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_region_global_flag_t}(Base.zero(hsa_region_global_flag_t)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_GLOBAL_FLAGS,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_alloc_max_size(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_ALLOC_MAX_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_size(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_runtime_alloc_allowed(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function region_info_segment(region) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_region_segment_t}(Base.zero(hsa_region_segment_t)) # line 67:
    err = ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,HSA_REGION_INFO_SEGMENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function isa_info_name_length(isa) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME_LENGTH,Base.zero(UInt32),value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function isa_info_name(isa) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = isa_info_name_length(isa)
        value = Array(Uint8,len)
    end # line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME,Base.zero(UInt32),value) # line 69:
    test_status(err) # line 71:
    value = ascii(value)
end

function executable_info_state(executable) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_executable_state_t}(Base.zero(hsa_executable_state_t)) # line 67:
    err = ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,HSA_EXECUTABLE_INFO_STATE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_info_profile(executable) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_profile_t}(Base.zero(hsa_profile_t)) # line 67:
    err = ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,HSA_EXECUTABLE_INFO_PROFILE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_indirect_function_object(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_OBJECT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_linkage(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_symbol_kind_linkage_t}(Base.zero(hsa_symbol_kind_linkage_t)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_LINKAGE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_kernel_kernarg_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_name(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = executable_symbol_info_type(symbol)
        value = Array(Uint8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = ascii(value)
end

function executable_symbol_info_kernel_group_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_GROUP_SEGMENT_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_variable_allocation(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_variable_allocation_t}(Base.zero(hsa_variable_allocation_t)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALLOCATION,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_kernel_object(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_module_name_length(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME_LENGTH,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_kernel_dynamic_callstack(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_DYNAMIC_CALLSTACK,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_is_definition(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_IS_DEFINITION,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_variable_alignment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ALIGNMENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_variable_segment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_variable_segment_t}(Base.zero(hsa_variable_segment_t)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SEGMENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_kernel_kernarg_segment_alignment(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_KERNARG_SEGMENT_ALIGNMENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_type(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_symbol_kind_t}(Base.zero(hsa_symbol_kind_t)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_TYPE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_module_name(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    begin 
        len = executable_symbol_info_module_name_length(symbol)
        value = Array(Uint8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME,value) # line 69:
    test_status(err) # line 71:
    value = ascii(value)
end

function executable_symbol_info_variable_address(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt64}(Base.zero(UInt64)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_kernel_private_segment_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_PRIVATE_SEGMENT_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_agent(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{hsa_agent_t}(Base.zero(hsa_agent_t)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_AGENT,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_variable_size(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_SIZE,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_name_length(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_variable_is_const(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{Bool}(Base.zero(Bool)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_IS_CONST,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end

function executable_symbol_info_indirect_function_call_convention(symbol) # /home/strollinger/hsa/jl/gen/gen_getters.jl, line 66:
    value = Ref{UInt32}(Base.zero(UInt32)) # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_INDIRECT_FUNCTION_CALL_CONVENTION,value) # line 69:
    test_status(err) # line 71:
    value = value.x
end
