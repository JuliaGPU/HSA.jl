# Julia wrapper for header: /opt/hsa/lib/../include/hsa.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{UInt8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{UInt8}}),status,status_string)
end

function hsa_init()
    ccall((:hsa_init,libhsa),hsa_status_t,())
end

function hsa_shut_down()
    ccall((:hsa_shut_down,libhsa),hsa_status_t,())
end

function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_system_extension_supported(extension::UInt16,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_system_extension_supported,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Bool}),extension,version_major,version_minor,result)
end

function hsa_system_get_extension_table(extension::UInt16,version_major::UInt16,version_minor::UInt16,table::Ptr{Void})
    ccall((:hsa_system_get_extension_table,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Void}),extension,version_major,version_minor,table)
end

function hsa_agent_get_info(agent::Agent,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_exception_policies(agent::Agent,profile::hsa_profile_t,mask::Ptr{UInt16})
    ccall((:hsa_agent_get_exception_policies,libhsa),hsa_status_t,(hsa_agent_t,hsa_profile_t,Ptr{UInt16}),agent,profile,mask)
end

function hsa_agent_extension_supported(extension::UInt16,agent::Agent,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_agent_extension_supported,libhsa),hsa_status_t,(UInt16,hsa_agent_t,UInt16,UInt16,Ptr{Bool}),extension,agent,version_major,version_minor,result)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::UInt32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,UInt32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::Signal)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Acquire}})
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Relaxed}})
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function hsa_queue_create(agent::Agent,size::UInt32,_type::hsa_queue_type_t,callback::Ptr{Void},data::Ptr{Void},private_segment_size::UInt32,group_segment_size::UInt32,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,UInt32,hsa_queue_type_t,Ptr{Void},Ptr{Void},UInt32,UInt32,Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,data,private_segment_size,group_segment_size,queue)
end

function hsa_soft_queue_create(region::Region,size::UInt32,_type::hsa_queue_type_t,features::UInt32,doorbell_signal::Signal,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_soft_queue_create,libhsa),hsa_status_t,(hsa_region_t,UInt32,hsa_queue_type_t,UInt32,hsa_signal_t,Ptr{Ptr{hsa_queue_t}}),region,size,_type,features,doorbell_signal,queue)
end

function hsa_queue_destroy(queue::Queue)
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Queue)
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_cas_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_add_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_add_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function hsa_region_get_info(region::Region,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_agent_iterate_regions(agent::Agent,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_memory_allocate(region::Region,size::Csize_t,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Csize_t,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_memory_copy(dst::Ptr{Void},src::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_copy,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void},Csize_t),dst,src,size)
end

function hsa_memory_assign_agent(ptr::Ptr{Void},agent::Agent,access::hsa_access_permission_t)
    ccall((:hsa_memory_assign_agent,libhsa),hsa_status_t,(Ptr{Void},hsa_agent_t,hsa_access_permission_t),ptr,agent,access)
end

function hsa_memory_register(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_memory_deregister(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_isa_from_name(name::Ptr{UInt8},isa::Ptr{hsa_isa_t})
    ccall((:hsa_isa_from_name,libhsa),hsa_status_t,(Ptr{UInt8},Ptr{hsa_isa_t}),name,isa)
end

function hsa_isa_get_info(isa::hsa_isa_t,attribute::hsa_isa_info_t,index::UInt32,value::Ptr{Void})
    ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,attribute,index,value)
end

function hsa_isa_compatible(code_object_isa::hsa_isa_t,agent_isa::hsa_isa_t,result::Ptr{Bool})
    ccall((:hsa_isa_compatible,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_t,Ptr{Bool}),code_object_isa,agent_isa,result)
end

function hsa_code_object_serialize(code_object::hsa_code_object_t,alloc_callback::Ptr{Void},callback_data::hsa_callback_data_t,options::Ptr{UInt8},serialized_code_object::Ptr{Ptr{Void}},serialized_code_object_size::Ptr{Csize_t})
    ccall((:hsa_code_object_serialize,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},hsa_callback_data_t,Ptr{UInt8},Ptr{Ptr{Void}},Ptr{Csize_t}),code_object,alloc_callback,callback_data,options,serialized_code_object,serialized_code_object_size)
end

function hsa_code_object_deserialize(serialized_code_object::Ptr{Void},serialized_code_object_size::Csize_t,options::Ptr{UInt8},code_object::Ptr{hsa_code_object_t})
    ccall((:hsa_code_object_deserialize,libhsa),hsa_status_t,(Ptr{Void},Csize_t,Ptr{UInt8},Ptr{hsa_code_object_t}),serialized_code_object,serialized_code_object_size,options,code_object)
end

function hsa_code_object_destroy(code_object::hsa_code_object_t)
    ccall((:hsa_code_object_destroy,libhsa),hsa_status_t,(hsa_code_object_t,),code_object)
end

function hsa_code_object_get_info(code_object::hsa_code_object_t,attribute::hsa_code_object_info_t,value::Ptr{Void})
    ccall((:hsa_code_object_get_info,libhsa),hsa_status_t,(hsa_code_object_t,hsa_code_object_info_t,Ptr{Void}),code_object,attribute,value)
end

function hsa_code_object_get_symbol(code_object::hsa_code_object_t,symbol_name::Ptr{UInt8},symbol::Ptr{hsa_code_symbol_t})
    ccall((:hsa_code_object_get_symbol,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{UInt8},Ptr{hsa_code_symbol_t}),code_object,symbol_name,symbol)
end

function hsa_code_symbol_get_info(code_symbol::hsa_code_symbol_t,attribute::hsa_code_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_code_symbol_get_info,libhsa),hsa_status_t,(hsa_code_symbol_t,hsa_code_symbol_info_t,Ptr{Void}),code_symbol,attribute,value)
end

function hsa_code_object_iterate_symbols(code_object::hsa_code_object_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_code_object_iterate_symbols,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},Ptr{Void}),code_object,callback,data)
end

function hsa_executable_create(profile::hsa_profile_t,executable_state::hsa_executable_state_t,options::Ptr{UInt8},executable::Ptr{hsa_executable_t})
    ccall((:hsa_executable_create,libhsa),hsa_status_t,(hsa_profile_t,hsa_executable_state_t,Ptr{UInt8},Ptr{hsa_executable_t}),profile,executable_state,options,executable)
end

function hsa_executable_destroy(executable::hsa_executable_t)
    ccall((:hsa_executable_destroy,libhsa),hsa_status_t,(hsa_executable_t,),executable)
end

function hsa_executable_load_code_object(executable::hsa_executable_t,agent::Agent,code_object::hsa_code_object_t,options::Ptr{UInt8})
    ccall((:hsa_executable_load_code_object,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,hsa_code_object_t,Ptr{UInt8}),executable,agent,code_object,options)
end

function hsa_executable_freeze(executable::hsa_executable_t,options::Ptr{UInt8})
    ccall((:hsa_executable_freeze,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8}),executable,options)
end

function hsa_executable_get_info(executable::hsa_executable_t,attribute::hsa_executable_info_t,value::Ptr{Void})
    ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,attribute,value)
end

function hsa_executable_global_variable_define(executable::hsa_executable_t,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{Void}),executable,variable_name,address)
end

function hsa_executable_agent_global_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_agent_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_readonly_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_readonly_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_validate(executable::hsa_executable_t,result::Ptr{UInt32})
    ccall((:hsa_executable_validate,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt32}),executable,result)
end

function hsa_executable_get_symbol(executable::hsa_executable_t,module_name::Ptr{UInt8},symbol_name::Ptr{UInt8},agent::Agent,call_convention::Int32,symbol::Ptr{hsa_executable_symbol_t})
    ccall((:hsa_executable_get_symbol,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{UInt8},hsa_agent_t,Int32,Ptr{hsa_executable_symbol_t}),executable,module_name,symbol_name,agent,call_convention,symbol)
end

function hsa_executable_symbol_get_info(executable_symbol::hsa_executable_symbol_t,attribute::hsa_executable_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),executable_symbol,attribute,value)
end

function hsa_executable_iterate_symbols(executable::hsa_executable_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_executable_iterate_symbols,libhsa),hsa_status_t,(hsa_executable_t,Ptr{Void},Ptr{Void}),executable,callback,data)
end

function load(signal::Signal)
    load(signal,Val{Acquire})
end

function store!(signal::Signal,value::hsa_signal_value_t)
    store!(signal,value,Val{Release})
end

function exchange!(signal::Signal,value::hsa_signal_value_t)
    exchange!(signal,value,Val{AcquRel})
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    cas!(signal,expected,value,Val{AcquRel})
end

function add!(signal::Signal,value::hsa_signal_value_t)
    add!(signal,value,Val{AcquRel})
end

function subtract!(signal::Signal,value::hsa_signal_value_t)
    subtract!(signal,value,Val{AcquRel})
end

function and!(signal::Signal,value::hsa_signal_value_t)
    and!(signal,value,Val{AcquRel})
end

function or!(signal::Signal,value::hsa_signal_value_t)
    or!(signal,value,Val{AcquRel})
end

function xor!(signal::Signal,value::hsa_signal_value_t)
    xor!(signal,value,Val{AcquRel})
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t)
    wait(signal,condition,compare_value,timeout_hint,wait_state_hint,Val{Acquire})
end

function load_read_index(queue::Queue)
    load_read_index(queue,Val{Acquire})
end

function load_write_index(queue::Queue)
    load_write_index(queue,Val{Acquire})
end

function store_write_index!(queue::Queue,value::UInt64)
    store_write_index!(queue,value,Val{Release})
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64)
    cas_write_index!(queue,expected,value,Val{AcquRel})
end

function add_write_index!(queue::Queue,value::UInt64)
    add_write_index!(queue,value,Val{AcquRel})
end

function store_read_index!(queue::Queue,value::UInt64)
    store_read_index!(queue,value,Val{Release})
end


# Convenience Constants
# with HSA_ prefix removed and
# in CamelCase
	
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VENDOR_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME,Base.zero(UInt32),value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        len = executable_symbol_info_name_length(symbol)
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
# Julia wrapper for header: /opt/hsa/lib/../include/hsa_ext_finalize.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{UInt8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{UInt8}}),status,status_string)
end

function hsa_init()
    ccall((:hsa_init,libhsa),hsa_status_t,())
end

function hsa_shut_down()
    ccall((:hsa_shut_down,libhsa),hsa_status_t,())
end

function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_system_extension_supported(extension::UInt16,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_system_extension_supported,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Bool}),extension,version_major,version_minor,result)
end

function hsa_system_get_extension_table(extension::UInt16,version_major::UInt16,version_minor::UInt16,table::Ptr{Void})
    ccall((:hsa_system_get_extension_table,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Void}),extension,version_major,version_minor,table)
end

function hsa_agent_get_info(agent::Agent,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_exception_policies(agent::Agent,profile::hsa_profile_t,mask::Ptr{UInt16})
    ccall((:hsa_agent_get_exception_policies,libhsa),hsa_status_t,(hsa_agent_t,hsa_profile_t,Ptr{UInt16}),agent,profile,mask)
end

function hsa_agent_extension_supported(extension::UInt16,agent::Agent,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_agent_extension_supported,libhsa),hsa_status_t,(UInt16,hsa_agent_t,UInt16,UInt16,Ptr{Bool}),extension,agent,version_major,version_minor,result)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::UInt32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,UInt32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::Signal)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Acquire}})
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Relaxed}})
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function hsa_queue_create(agent::Agent,size::UInt32,_type::hsa_queue_type_t,callback::Ptr{Void},data::Ptr{Void},private_segment_size::UInt32,group_segment_size::UInt32,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,UInt32,hsa_queue_type_t,Ptr{Void},Ptr{Void},UInt32,UInt32,Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,data,private_segment_size,group_segment_size,queue)
end

function hsa_soft_queue_create(region::Region,size::UInt32,_type::hsa_queue_type_t,features::UInt32,doorbell_signal::Signal,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_soft_queue_create,libhsa),hsa_status_t,(hsa_region_t,UInt32,hsa_queue_type_t,UInt32,hsa_signal_t,Ptr{Ptr{hsa_queue_t}}),region,size,_type,features,doorbell_signal,queue)
end

function hsa_queue_destroy(queue::Queue)
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Queue)
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_cas_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_add_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_add_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function hsa_region_get_info(region::Region,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_agent_iterate_regions(agent::Agent,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_memory_allocate(region::Region,size::Csize_t,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Csize_t,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_memory_copy(dst::Ptr{Void},src::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_copy,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void},Csize_t),dst,src,size)
end

function hsa_memory_assign_agent(ptr::Ptr{Void},agent::Agent,access::hsa_access_permission_t)
    ccall((:hsa_memory_assign_agent,libhsa),hsa_status_t,(Ptr{Void},hsa_agent_t,hsa_access_permission_t),ptr,agent,access)
end

function hsa_memory_register(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_memory_deregister(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_isa_from_name(name::Ptr{UInt8},isa::Ptr{hsa_isa_t})
    ccall((:hsa_isa_from_name,libhsa),hsa_status_t,(Ptr{UInt8},Ptr{hsa_isa_t}),name,isa)
end

function hsa_isa_get_info(isa::hsa_isa_t,attribute::hsa_isa_info_t,index::UInt32,value::Ptr{Void})
    ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,attribute,index,value)
end

function hsa_isa_compatible(code_object_isa::hsa_isa_t,agent_isa::hsa_isa_t,result::Ptr{Bool})
    ccall((:hsa_isa_compatible,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_t,Ptr{Bool}),code_object_isa,agent_isa,result)
end

function hsa_code_object_serialize(code_object::hsa_code_object_t,alloc_callback::Ptr{Void},callback_data::hsa_callback_data_t,options::Ptr{UInt8},serialized_code_object::Ptr{Ptr{Void}},serialized_code_object_size::Ptr{Csize_t})
    ccall((:hsa_code_object_serialize,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},hsa_callback_data_t,Ptr{UInt8},Ptr{Ptr{Void}},Ptr{Csize_t}),code_object,alloc_callback,callback_data,options,serialized_code_object,serialized_code_object_size)
end

function hsa_code_object_deserialize(serialized_code_object::Ptr{Void},serialized_code_object_size::Csize_t,options::Ptr{UInt8},code_object::Ptr{hsa_code_object_t})
    ccall((:hsa_code_object_deserialize,libhsa),hsa_status_t,(Ptr{Void},Csize_t,Ptr{UInt8},Ptr{hsa_code_object_t}),serialized_code_object,serialized_code_object_size,options,code_object)
end

function hsa_code_object_destroy(code_object::hsa_code_object_t)
    ccall((:hsa_code_object_destroy,libhsa),hsa_status_t,(hsa_code_object_t,),code_object)
end

function hsa_code_object_get_info(code_object::hsa_code_object_t,attribute::hsa_code_object_info_t,value::Ptr{Void})
    ccall((:hsa_code_object_get_info,libhsa),hsa_status_t,(hsa_code_object_t,hsa_code_object_info_t,Ptr{Void}),code_object,attribute,value)
end

function hsa_code_object_get_symbol(code_object::hsa_code_object_t,symbol_name::Ptr{UInt8},symbol::Ptr{hsa_code_symbol_t})
    ccall((:hsa_code_object_get_symbol,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{UInt8},Ptr{hsa_code_symbol_t}),code_object,symbol_name,symbol)
end

function hsa_code_symbol_get_info(code_symbol::hsa_code_symbol_t,attribute::hsa_code_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_code_symbol_get_info,libhsa),hsa_status_t,(hsa_code_symbol_t,hsa_code_symbol_info_t,Ptr{Void}),code_symbol,attribute,value)
end

function hsa_code_object_iterate_symbols(code_object::hsa_code_object_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_code_object_iterate_symbols,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},Ptr{Void}),code_object,callback,data)
end

function hsa_executable_create(profile::hsa_profile_t,executable_state::hsa_executable_state_t,options::Ptr{UInt8},executable::Ptr{hsa_executable_t})
    ccall((:hsa_executable_create,libhsa),hsa_status_t,(hsa_profile_t,hsa_executable_state_t,Ptr{UInt8},Ptr{hsa_executable_t}),profile,executable_state,options,executable)
end

function hsa_executable_destroy(executable::hsa_executable_t)
    ccall((:hsa_executable_destroy,libhsa),hsa_status_t,(hsa_executable_t,),executable)
end

function hsa_executable_load_code_object(executable::hsa_executable_t,agent::Agent,code_object::hsa_code_object_t,options::Ptr{UInt8})
    ccall((:hsa_executable_load_code_object,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,hsa_code_object_t,Ptr{UInt8}),executable,agent,code_object,options)
end

function hsa_executable_freeze(executable::hsa_executable_t,options::Ptr{UInt8})
    ccall((:hsa_executable_freeze,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8}),executable,options)
end

function hsa_executable_get_info(executable::hsa_executable_t,attribute::hsa_executable_info_t,value::Ptr{Void})
    ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,attribute,value)
end

function hsa_executable_global_variable_define(executable::hsa_executable_t,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{Void}),executable,variable_name,address)
end

function hsa_executable_agent_global_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_agent_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_readonly_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_readonly_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_validate(executable::hsa_executable_t,result::Ptr{UInt32})
    ccall((:hsa_executable_validate,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt32}),executable,result)
end

function hsa_executable_get_symbol(executable::hsa_executable_t,module_name::Ptr{UInt8},symbol_name::Ptr{UInt8},agent::Agent,call_convention::Int32,symbol::Ptr{hsa_executable_symbol_t})
    ccall((:hsa_executable_get_symbol,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{UInt8},hsa_agent_t,Int32,Ptr{hsa_executable_symbol_t}),executable,module_name,symbol_name,agent,call_convention,symbol)
end

function hsa_executable_symbol_get_info(executable_symbol::hsa_executable_symbol_t,attribute::hsa_executable_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),executable_symbol,attribute,value)
end

function hsa_executable_iterate_symbols(executable::hsa_executable_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_executable_iterate_symbols,libhsa),hsa_status_t,(hsa_executable_t,Ptr{Void},Ptr{Void}),executable,callback,data)
end

function hsa_ext_program_create(machine_model::hsa_machine_model_t,profile::hsa_profile_t,default_float_rounding_mode::hsa_default_float_rounding_mode_t,options::Ptr{UInt8},program::Ptr{hsa_ext_program_t})
    ccall((:hsa_ext_program_create,libhsa),hsa_status_t,(hsa_machine_model_t,hsa_profile_t,hsa_default_float_rounding_mode_t,Ptr{UInt8},Ptr{hsa_ext_program_t}),machine_model,profile,default_float_rounding_mode,options,program)
end

function hsa_ext_program_destroy(program::hsa_ext_program_t)
    ccall((:hsa_ext_program_destroy,libhsa),hsa_status_t,(hsa_ext_program_t,),program)
end

function hsa_ext_program_add_module(program::hsa_ext_program_t,_module::hsa_ext_module_t)
    ccall((:hsa_ext_program_add_module,libhsa),hsa_status_t,(hsa_ext_program_t,hsa_ext_module_t),program,_module)
end

function hsa_ext_program_iterate_modules(program::hsa_ext_program_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_ext_program_iterate_modules,libhsa),hsa_status_t,(hsa_ext_program_t,Ptr{Void},Ptr{Void}),program,callback,data)
end

function hsa_ext_program_get_info(program::hsa_ext_program_t,attribute::hsa_ext_program_info_t,value::Ptr{Void})
    ccall((:hsa_ext_program_get_info,libhsa),hsa_status_t,(hsa_ext_program_t,hsa_ext_program_info_t,Ptr{Void}),program,attribute,value)
end

function hsa_ext_program_finalize(program::hsa_ext_program_t,isa::hsa_isa_t,call_convention::Int32,control_directives::hsa_ext_control_directives_t,options::Ptr{UInt8},code_object_type::hsa_code_object_type_t,code_object::Ptr{hsa_code_object_t})
    ccall((:hsa_ext_program_finalize,libhsa),hsa_status_t,(hsa_ext_program_t,hsa_isa_t,Int32,hsa_ext_control_directives_t,Ptr{UInt8},hsa_code_object_type_t,Ptr{hsa_code_object_t}),program,isa,call_convention,control_directives,options,code_object_type,code_object)
end

function load(signal::Signal)
    load(signal,Val{Acquire})
end

function store!(signal::Signal,value::hsa_signal_value_t)
    store!(signal,value,Val{Release})
end

function exchange!(signal::Signal,value::hsa_signal_value_t)
    exchange!(signal,value,Val{AcquRel})
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    cas!(signal,expected,value,Val{AcquRel})
end

function add!(signal::Signal,value::hsa_signal_value_t)
    add!(signal,value,Val{AcquRel})
end

function subtract!(signal::Signal,value::hsa_signal_value_t)
    subtract!(signal,value,Val{AcquRel})
end

function and!(signal::Signal,value::hsa_signal_value_t)
    and!(signal,value,Val{AcquRel})
end

function or!(signal::Signal,value::hsa_signal_value_t)
    or!(signal,value,Val{AcquRel})
end

function xor!(signal::Signal,value::hsa_signal_value_t)
    xor!(signal,value,Val{AcquRel})
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t)
    wait(signal,condition,compare_value,timeout_hint,wait_state_hint,Val{Acquire})
end

function load_read_index(queue::Queue)
    load_read_index(queue,Val{Acquire})
end

function load_write_index(queue::Queue)
    load_write_index(queue,Val{Acquire})
end

function store_write_index!(queue::Queue,value::UInt64)
    store_write_index!(queue,value,Val{Release})
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64)
    cas_write_index!(queue,expected,value,Val{AcquRel})
end

function add_write_index!(queue::Queue,value::UInt64)
    add_write_index!(queue,value,Val{AcquRel})
end

function store_read_index!(queue::Queue,value::UInt64)
    store_read_index!(queue,value,Val{Release})
end


# Convenience Constants
# with HSA_ prefix removed and
# in CamelCase
	
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VENDOR_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME,Base.zero(UInt32),value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        len = executable_symbol_info_name_length(symbol)
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
# Julia wrapper for header: /opt/hsa/lib/../include/hsa_ext_image.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{UInt8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{UInt8}}),status,status_string)
end

function hsa_init()
    ccall((:hsa_init,libhsa),hsa_status_t,())
end

function hsa_shut_down()
    ccall((:hsa_shut_down,libhsa),hsa_status_t,())
end

function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_system_extension_supported(extension::UInt16,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_system_extension_supported,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Bool}),extension,version_major,version_minor,result)
end

function hsa_system_get_extension_table(extension::UInt16,version_major::UInt16,version_minor::UInt16,table::Ptr{Void})
    ccall((:hsa_system_get_extension_table,libhsa),hsa_status_t,(UInt16,UInt16,UInt16,Ptr{Void}),extension,version_major,version_minor,table)
end

function hsa_agent_get_info(agent::Agent,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_exception_policies(agent::Agent,profile::hsa_profile_t,mask::Ptr{UInt16})
    ccall((:hsa_agent_get_exception_policies,libhsa),hsa_status_t,(hsa_agent_t,hsa_profile_t,Ptr{UInt16}),agent,profile,mask)
end

function hsa_agent_extension_supported(extension::UInt16,agent::Agent,version_major::UInt16,version_minor::UInt16,result::Ptr{Bool})
    ccall((:hsa_agent_extension_supported,libhsa),hsa_status_t,(UInt16,hsa_agent_t,UInt16,UInt16,Ptr{Bool}),extension,agent,version_major,version_minor,result)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::UInt32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,UInt32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::Signal)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Acquire}})
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function load(signal::Signal,::Type{Val{Relaxed}})
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function store!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function exchange!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function add!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function subtract!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function and!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function or!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{AcquRel}})
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function xor!(signal::Signal,value::hsa_signal_value_t,::Type{Val{Release}})
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Acquire}})
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t,::Type{Val{Relaxed}})
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,UInt64,hsa_wait_state_t),signal,condition,compare_value,timeout_hint,wait_state_hint)
end

function hsa_queue_create(agent::Agent,size::UInt32,_type::hsa_queue_type_t,callback::Ptr{Void},data::Ptr{Void},private_segment_size::UInt32,group_segment_size::UInt32,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,UInt32,hsa_queue_type_t,Ptr{Void},Ptr{Void},UInt32,UInt32,Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,data,private_segment_size,group_segment_size,queue)
end

function hsa_soft_queue_create(region::Region,size::UInt32,_type::hsa_queue_type_t,features::UInt32,doorbell_signal::Signal,queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_soft_queue_create,libhsa),hsa_status_t,(hsa_region_t,UInt32,hsa_queue_type_t,UInt32,hsa_signal_t,Ptr{Ptr{hsa_queue_t}}),region,size,_type,features,doorbell_signal,queue)
end

function hsa_queue_destroy(queue::Queue)
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Queue)
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_read_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Acquire}})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function load_write_index(queue::Queue,::Type{Val{Relaxed}})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},),queue)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_cas_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64,UInt64),queue,expected,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{AcquRel}})
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Acquire}})
    ccall((:hsa_queue_add_write_index_acquire,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function add_write_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_add_write_index_release,libhsa),UInt64,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Relaxed}})
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function store_read_index!(queue::Queue,value::UInt64,::Type{Val{Release}})
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},UInt64),queue,value)
end

function hsa_region_get_info(region::Region,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_agent_iterate_regions(agent::Agent,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_memory_allocate(region::Region,size::Csize_t,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Csize_t,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_memory_copy(dst::Ptr{Void},src::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_copy,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void},Csize_t),dst,src,size)
end

function hsa_memory_assign_agent(ptr::Ptr{Void},agent::Agent,access::hsa_access_permission_t)
    ccall((:hsa_memory_assign_agent,libhsa),hsa_status_t,(Ptr{Void},hsa_agent_t,hsa_access_permission_t),ptr,agent,access)
end

function hsa_memory_register(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_memory_deregister(ptr::Ptr{Void},size::Csize_t)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Csize_t),ptr,size)
end

function hsa_isa_from_name(name::Ptr{UInt8},isa::Ptr{hsa_isa_t})
    ccall((:hsa_isa_from_name,libhsa),hsa_status_t,(Ptr{UInt8},Ptr{hsa_isa_t}),name,isa)
end

function hsa_isa_get_info(isa::hsa_isa_t,attribute::hsa_isa_info_t,index::UInt32,value::Ptr{Void})
    ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,attribute,index,value)
end

function hsa_isa_compatible(code_object_isa::hsa_isa_t,agent_isa::hsa_isa_t,result::Ptr{Bool})
    ccall((:hsa_isa_compatible,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_t,Ptr{Bool}),code_object_isa,agent_isa,result)
end

function hsa_code_object_serialize(code_object::hsa_code_object_t,alloc_callback::Ptr{Void},callback_data::hsa_callback_data_t,options::Ptr{UInt8},serialized_code_object::Ptr{Ptr{Void}},serialized_code_object_size::Ptr{Csize_t})
    ccall((:hsa_code_object_serialize,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},hsa_callback_data_t,Ptr{UInt8},Ptr{Ptr{Void}},Ptr{Csize_t}),code_object,alloc_callback,callback_data,options,serialized_code_object,serialized_code_object_size)
end

function hsa_code_object_deserialize(serialized_code_object::Ptr{Void},serialized_code_object_size::Csize_t,options::Ptr{UInt8},code_object::Ptr{hsa_code_object_t})
    ccall((:hsa_code_object_deserialize,libhsa),hsa_status_t,(Ptr{Void},Csize_t,Ptr{UInt8},Ptr{hsa_code_object_t}),serialized_code_object,serialized_code_object_size,options,code_object)
end

function hsa_code_object_destroy(code_object::hsa_code_object_t)
    ccall((:hsa_code_object_destroy,libhsa),hsa_status_t,(hsa_code_object_t,),code_object)
end

function hsa_code_object_get_info(code_object::hsa_code_object_t,attribute::hsa_code_object_info_t,value::Ptr{Void})
    ccall((:hsa_code_object_get_info,libhsa),hsa_status_t,(hsa_code_object_t,hsa_code_object_info_t,Ptr{Void}),code_object,attribute,value)
end

function hsa_code_object_get_symbol(code_object::hsa_code_object_t,symbol_name::Ptr{UInt8},symbol::Ptr{hsa_code_symbol_t})
    ccall((:hsa_code_object_get_symbol,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{UInt8},Ptr{hsa_code_symbol_t}),code_object,symbol_name,symbol)
end

function hsa_code_symbol_get_info(code_symbol::hsa_code_symbol_t,attribute::hsa_code_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_code_symbol_get_info,libhsa),hsa_status_t,(hsa_code_symbol_t,hsa_code_symbol_info_t,Ptr{Void}),code_symbol,attribute,value)
end

function hsa_code_object_iterate_symbols(code_object::hsa_code_object_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_code_object_iterate_symbols,libhsa),hsa_status_t,(hsa_code_object_t,Ptr{Void},Ptr{Void}),code_object,callback,data)
end

function hsa_executable_create(profile::hsa_profile_t,executable_state::hsa_executable_state_t,options::Ptr{UInt8},executable::Ptr{hsa_executable_t})
    ccall((:hsa_executable_create,libhsa),hsa_status_t,(hsa_profile_t,hsa_executable_state_t,Ptr{UInt8},Ptr{hsa_executable_t}),profile,executable_state,options,executable)
end

function hsa_executable_destroy(executable::hsa_executable_t)
    ccall((:hsa_executable_destroy,libhsa),hsa_status_t,(hsa_executable_t,),executable)
end

function hsa_executable_load_code_object(executable::hsa_executable_t,agent::Agent,code_object::hsa_code_object_t,options::Ptr{UInt8})
    ccall((:hsa_executable_load_code_object,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,hsa_code_object_t,Ptr{UInt8}),executable,agent,code_object,options)
end

function hsa_executable_freeze(executable::hsa_executable_t,options::Ptr{UInt8})
    ccall((:hsa_executable_freeze,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8}),executable,options)
end

function hsa_executable_get_info(executable::hsa_executable_t,attribute::hsa_executable_info_t,value::Ptr{Void})
    ccall((:hsa_executable_get_info,libhsa),hsa_status_t,(hsa_executable_t,hsa_executable_info_t,Ptr{Void}),executable,attribute,value)
end

function hsa_executable_global_variable_define(executable::hsa_executable_t,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{Void}),executable,variable_name,address)
end

function hsa_executable_agent_global_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_agent_global_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_readonly_variable_define(executable::hsa_executable_t,agent::Agent,variable_name::Ptr{UInt8},address::Ptr{Void})
    ccall((:hsa_executable_readonly_variable_define,libhsa),hsa_status_t,(hsa_executable_t,hsa_agent_t,Ptr{UInt8},Ptr{Void}),executable,agent,variable_name,address)
end

function hsa_executable_validate(executable::hsa_executable_t,result::Ptr{UInt32})
    ccall((:hsa_executable_validate,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt32}),executable,result)
end

function hsa_executable_get_symbol(executable::hsa_executable_t,module_name::Ptr{UInt8},symbol_name::Ptr{UInt8},agent::Agent,call_convention::Int32,symbol::Ptr{hsa_executable_symbol_t})
    ccall((:hsa_executable_get_symbol,libhsa),hsa_status_t,(hsa_executable_t,Ptr{UInt8},Ptr{UInt8},hsa_agent_t,Int32,Ptr{hsa_executable_symbol_t}),executable,module_name,symbol_name,agent,call_convention,symbol)
end

function hsa_executable_symbol_get_info(executable_symbol::hsa_executable_symbol_t,attribute::hsa_executable_symbol_info_t,value::Ptr{Void})
    ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),executable_symbol,attribute,value)
end

function hsa_executable_iterate_symbols(executable::hsa_executable_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_executable_iterate_symbols,libhsa),hsa_status_t,(hsa_executable_t,Ptr{Void},Ptr{Void}),executable,callback,data)
end

function hsa_ext_image_get_capability(agent::Agent,geometry::hsa_ext_image_geometry_t,image_format::Ptr{hsa_ext_image_format_t},capability_mask::Ptr{UInt32})
    ccall((:hsa_ext_image_get_capability,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_geometry_t,Ptr{hsa_ext_image_format_t},Ptr{UInt32}),agent,geometry,image_format,capability_mask)
end

function hsa_ext_image_data_get_info(agent::Agent,image_descriptor::Ptr{hsa_ext_image_descriptor_t},access_permission::hsa_access_permission_t,image_data_info::Ptr{hsa_ext_image_data_info_t})
    ccall((:hsa_ext_image_data_get_info,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},hsa_access_permission_t,Ptr{hsa_ext_image_data_info_t}),agent,image_descriptor,access_permission,image_data_info)
end

function hsa_ext_image_create(agent::Agent,image_descriptor::Ptr{hsa_ext_image_descriptor_t},image_data::Ptr{Void},access_permission::hsa_access_permission_t,image::Ptr{hsa_ext_image_t})
    ccall((:hsa_ext_image_create,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},Ptr{Void},hsa_access_permission_t,Ptr{hsa_ext_image_t}),agent,image_descriptor,image_data,access_permission,image)
end

function hsa_ext_image_destroy(agent::Agent,image::hsa_ext_image_t)
    ccall((:hsa_ext_image_destroy,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_t),agent,image)
end

function hsa_ext_image_copy(agent::Agent,src_image::hsa_ext_image_t,src_offset::Ptr{hsa_dim3_t},dst_image::hsa_ext_image_t,dst_offset::Ptr{hsa_dim3_t},range::Ptr{hsa_dim3_t})
    ccall((:hsa_ext_image_copy,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_t,Ptr{hsa_dim3_t},hsa_ext_image_t,Ptr{hsa_dim3_t},Ptr{hsa_dim3_t}),agent,src_image,src_offset,dst_image,dst_offset,range)
end

function hsa_ext_image_import(agent::Agent,src_memory::Ptr{Void},src_row_pitch::Csize_t,src_slice_pitch::Csize_t,dst_image::hsa_ext_image_t,image_region::Ptr{hsa_ext_image_region_t})
    ccall((:hsa_ext_image_import,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Csize_t,Csize_t,hsa_ext_image_t,Ptr{hsa_ext_image_region_t}),agent,src_memory,src_row_pitch,src_slice_pitch,dst_image,image_region)
end

function hsa_ext_image_export(agent::Agent,src_image::hsa_ext_image_t,dst_memory::Ptr{Void},dst_row_pitch::Csize_t,dst_slice_pitch::Csize_t,image_region::Ptr{hsa_ext_image_region_t})
    ccall((:hsa_ext_image_export,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_t,Ptr{Void},Csize_t,Csize_t,Ptr{hsa_ext_image_region_t}),agent,src_image,dst_memory,dst_row_pitch,dst_slice_pitch,image_region)
end

function hsa_ext_image_clear(agent::Agent,image::hsa_ext_image_t,data::Ptr{Void},image_region::Ptr{hsa_ext_image_region_t})
    ccall((:hsa_ext_image_clear,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_t,Ptr{Void},Ptr{hsa_ext_image_region_t}),agent,image,data,image_region)
end

function hsa_ext_sampler_create(agent::Agent,sampler_descriptor::Ptr{hsa_ext_sampler_descriptor_t},sampler::Ptr{hsa_ext_sampler_t})
    ccall((:hsa_ext_sampler_create,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_sampler_descriptor_t},Ptr{hsa_ext_sampler_t}),agent,sampler_descriptor,sampler)
end

function hsa_ext_sampler_destroy(agent::Agent,sampler::hsa_ext_sampler_t)
    ccall((:hsa_ext_sampler_destroy,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_sampler_t),agent,sampler)
end

function load(signal::Signal)
    load(signal,Val{Acquire})
end

function store!(signal::Signal,value::hsa_signal_value_t)
    store!(signal,value,Val{Release})
end

function exchange!(signal::Signal,value::hsa_signal_value_t)
    exchange!(signal,value,Val{AcquRel})
end

function cas!(signal::Signal,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    cas!(signal,expected,value,Val{AcquRel})
end

function add!(signal::Signal,value::hsa_signal_value_t)
    add!(signal,value,Val{AcquRel})
end

function subtract!(signal::Signal,value::hsa_signal_value_t)
    subtract!(signal,value,Val{AcquRel})
end

function and!(signal::Signal,value::hsa_signal_value_t)
    and!(signal,value,Val{AcquRel})
end

function or!(signal::Signal,value::hsa_signal_value_t)
    or!(signal,value,Val{AcquRel})
end

function xor!(signal::Signal,value::hsa_signal_value_t)
    xor!(signal,value,Val{AcquRel})
end

function wait(signal::Signal,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::UInt64,wait_state_hint::hsa_wait_state_t)
    wait(signal,condition,compare_value,timeout_hint,wait_state_hint,Val{Acquire})
end

function load_read_index(queue::Queue)
    load_read_index(queue,Val{Acquire})
end

function load_write_index(queue::Queue)
    load_write_index(queue,Val{Acquire})
end

function store_write_index!(queue::Queue,value::UInt64)
    store_write_index!(queue,value,Val{Release})
end

function cas_write_index!(queue::Queue,expected::UInt64,value::UInt64)
    cas_write_index!(queue,expected,value,Val{AcquRel})
end

function add_write_index!(queue::Queue,value::UInt64)
    add_write_index!(queue,value,Val{AcquRel})
end

function store_read_index!(queue::Queue,value::UInt64)
    store_read_index!(queue,value,Val{Release})
end


# Convenience Constants
# with HSA_ prefix removed and
# in CamelCase
	
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_VENDOR_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
    value = Array(UInt8,64) # line 67:
    err = ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,HSA_AGENT_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_isa_get_info,libhsa),hsa_status_t,(hsa_isa_t,hsa_isa_info_t,UInt32,Ptr{Void}),isa,HSA_ISA_INFO_NAME,Base.zero(UInt32),value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        len = executable_symbol_info_name_length(symbol)
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
        value = Array(UInt8,len)
    end # line 67:
    err = ccall((:hsa_executable_symbol_get_info,libhsa),hsa_status_t,(hsa_executable_symbol_t,hsa_executable_symbol_info_t,Ptr{Void}),symbol,HSA_EXECUTABLE_SYMBOL_INFO_MODULE_NAME,value) # line 69:
    test_status(err) # line 71:
    value = strip(ascii(value),'\0')
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
