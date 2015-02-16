# Julia wrapper for header: ../../../hsail/runtime/inc/hsa.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_info(agent::hsa_agent_t,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_queue_create(agent::hsa_agent_t,size::Cint,_type::hsa_queue_type_t,callback::Ptr{Void},service_queue::Ptr{hsa_queue_t},queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,Cint,hsa_queue_type_t,Ptr{Void},Ptr{hsa_queue_t},Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,service_queue,queue)
end

function hsa_queue_destroy(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_store_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_cas_write_index_acq_rel(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_acquire(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_relaxed(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_release(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_add_write_index_acq_rel(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_acquire(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_agent_iterate_regions(agent::hsa_agent_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_region_get_info(region::hsa_region_t,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_memory_register(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_deregister(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_allocate(region::hsa_region_t,size::Cint,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Cint,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::Uint32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,Uint32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::hsa_signal_t)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_relaxed(signal::hsa_signal_t)
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_acquire(signal::hsa_signal_t)
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_store_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_store_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_wait_relaxed(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_wait_acquire(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_and_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_cas_relaxed(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acquire(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_release(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acq_rel(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{Uint8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,status_string)
end

function hsa_extension_query(extension::hsa_extension_t,result::Ptr{Cint})
    ccall((:hsa_extension_query,libhsa),hsa_status_t,(hsa_extension_t,Ptr{Cint}),extension,result)
end
# Julia wrapper for header: ../../../hsail/runtime/inc/hsa_ext_finalize.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function hsa_ext_query_finalization_code_descriptor_count()
    ccall((:hsa_ext_query_finalization_code_descriptor_count,libhsa),Cint,())
end

function hsa_ext_query_finalization_code_descriptor()
    ccall((:hsa_ext_query_finalization_code_descriptor,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end

function HSA_API()
    ccall((:HSA_API,libhsa),Cint,())
end
# Julia wrapper for header: ../../../hsail/runtime/inc/hsa_ext_image.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_info(agent::hsa_agent_t,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_queue_create(agent::hsa_agent_t,size::Cint,_type::hsa_queue_type_t,callback::Ptr{Void},service_queue::Ptr{hsa_queue_t},queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,Cint,hsa_queue_type_t,Ptr{Void},Ptr{hsa_queue_t},Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,service_queue,queue)
end

function hsa_queue_destroy(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_store_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_cas_write_index_acq_rel(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_acquire(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_relaxed(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_release(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_add_write_index_acq_rel(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_acquire(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_agent_iterate_regions(agent::hsa_agent_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_region_get_info(region::hsa_region_t,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_memory_register(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_deregister(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_allocate(region::hsa_region_t,size::Cint,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Cint,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::Uint32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,Uint32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::hsa_signal_t)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_relaxed(signal::hsa_signal_t)
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_acquire(signal::hsa_signal_t)
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_store_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_store_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_wait_relaxed(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_wait_acquire(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_and_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_cas_relaxed(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acquire(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_release(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acq_rel(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{Uint8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,status_string)
end

function hsa_extension_query(extension::hsa_extension_t,result::Ptr{Cint})
    ccall((:hsa_extension_query,libhsa),hsa_status_t,(hsa_extension_t,Ptr{Cint}),extension,result)
end

function hsa_ext_get_image_info_max_dim(component::hsa_agent_t,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_ext_get_image_info_max_dim,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),component,attribute,value)
end

function hsa_ext_image_get_format_capability(agent::hsa_agent_t,image_format::Ptr{hsa_ext_image_format_t},image_geometry::hsa_ext_image_geometry_t,capability_mask::Ptr{Uint32})
    ccall((:hsa_ext_image_get_format_capability,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_format_t},hsa_ext_image_geometry_t,Ptr{Uint32}),agent,image_format,image_geometry,capability_mask)
end

function hsa_ext_image_get_info(agent::hsa_agent_t,image_descriptor::Ptr{hsa_ext_image_descriptor_t},access_permission::hsa_ext_image_access_permission_t,image_info::Ptr{hsa_ext_image_info_t})
    ccall((:hsa_ext_image_get_info,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},hsa_ext_image_access_permission_t,Ptr{hsa_ext_image_info_t}),agent,image_descriptor,access_permission,image_info)
end

function hsa_ext_image_create_handle(agent::hsa_agent_t,image_descriptor::Ptr{hsa_ext_image_descriptor_t},image_data::Ptr{Void},access_permission::hsa_ext_image_access_permission_t,image_handle::Ptr{hsa_ext_image_handle_t})
    ccall((:hsa_ext_image_create_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},Ptr{Void},hsa_ext_image_access_permission_t,Ptr{hsa_ext_image_handle_t}),agent,image_descriptor,image_data,access_permission,image_handle)
end

function hsa_ext_image_import(agent::hsa_agent_t,src_memory::Ptr{Void},src_row_pitch::Cint,src_slice_pitch::Cint,dst_image_handle::hsa_ext_image_handle_t,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_import,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Cint,Cint,hsa_ext_image_handle_t,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_memory,src_row_pitch,src_slice_pitch,dst_image_handle,image_region,completion_signal)
end

function hsa_ext_image_export(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_memory::Ptr{Void},dst_row_pitch::Cint,dst_slice_pitch::Cint,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_export,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Ptr{Void},Cint,Cint,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_image_handle,dst_memory,dst_row_pitch,dst_slice_pitch,image_region,completion_signal)
end

function hsa_ext_image_copy(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_image_handle::hsa_ext_image_handle_t,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_copy,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,hsa_ext_image_handle_t,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_image_handle,dst_image_handle,image_region,completion_signal)
end

function hsa_ext_image_clear(agent::hsa_agent_t,image_handle::hsa_ext_image_handle_t,data::Array_4_Cfloat,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_clear,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Array_4_Cfloat,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,image_handle,data,image_region,completion_signal)
end

function hsa_ext_image_copy_split_offset(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_image_handle::hsa_ext_image_handle_t,src_origin::hsa_dim3_t,dst_origin::hsa_dim3_t,size::hsa_ext_image_range_t,completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_copy_split_offset,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,hsa_ext_image_handle_t,hsa_dim3_t,hsa_dim3_t,hsa_ext_image_range_t,Ptr{hsa_signal_t}),agent,src_image_handle,dst_image_handle,src_origin,dst_origin,size,completion_signal)
end

function hsa_ext_image_clear_generic_data(agent::hsa_agent_t,image_handle::hsa_ext_image_handle_t,data::Ptr{Void},image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_clear_generic_data,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Ptr{Void},Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,image_handle,data,image_region,completion_signal)
end

function hsa_ext_image_destroy_handle(agent::hsa_agent_t,image_handle::Ptr{hsa_ext_image_handle_t})
    ccall((:hsa_ext_image_destroy_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_handle_t}),agent,image_handle)
end

function hsa_ext_sampler_create_handle(agent::hsa_agent_t,sampler_descriptor::Ptr{hsa_ext_sampler_descriptor_t},sampler_handle::Ptr{hsa_ext_sampler_handle_t})
    ccall((:hsa_ext_sampler_create_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_sampler_descriptor_t},Ptr{hsa_ext_sampler_handle_t}),agent,sampler_descriptor,sampler_handle)
end

function hsa_ext_sampler_destroy_handle(agent::hsa_agent_t,sampler_handle::Ptr{hsa_ext_sampler_handle_t})
    ccall((:hsa_ext_sampler_destroy_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_sampler_handle_t}),agent,sampler_handle)
end
# Julia wrapper for header: ../../../hsail/runtime/inc/hsa_ext_amd.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function hsa_system_get_info(attribute::hsa_system_info_t,value::Ptr{Void})
    ccall((:hsa_system_get_info,libhsa),hsa_status_t,(hsa_system_info_t,Ptr{Void}),attribute,value)
end

function hsa_iterate_agents(callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_iterate_agents,libhsa),hsa_status_t,(Ptr{Void},Ptr{Void}),callback,data)
end

function hsa_agent_get_info(agent::hsa_agent_t,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_agent_get_info,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),agent,attribute,value)
end

function hsa_queue_create(agent::hsa_agent_t,size::Cint,_type::hsa_queue_type_t,callback::Ptr{Void},service_queue::Ptr{hsa_queue_t},queue::Ptr{Ptr{hsa_queue_t}})
    ccall((:hsa_queue_create,libhsa),hsa_status_t,(hsa_agent_t,Cint,hsa_queue_type_t,Ptr{Void},Ptr{hsa_queue_t},Ptr{Ptr{hsa_queue_t}}),agent,size,_type,callback,service_queue,queue)
end

function hsa_queue_destroy(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_destroy,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_inactivate(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_inactivate,libhsa),hsa_status_t,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_read_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_read_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_acquire(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_load_write_index_relaxed(queue::Ptr{hsa_queue_t})
    ccall((:hsa_queue_load_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},),queue)
end

function hsa_queue_store_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_write_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_cas_write_index_acq_rel(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_acquire(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_relaxed(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_cas_write_index_release(queue::Ptr{hsa_queue_t},expected::Uint64,value::Uint64)
    ccall((:hsa_queue_cas_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64,Uint64),queue,expected,value)
end

function hsa_queue_add_write_index_acq_rel(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acq_rel,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_acquire(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_acquire,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_relaxed,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_add_write_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_add_write_index_release,libhsa),Uint64,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_relaxed(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_relaxed,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_queue_store_read_index_release(queue::Ptr{hsa_queue_t},value::Uint64)
    ccall((:hsa_queue_store_read_index_release,libhsa),Void,(Ptr{hsa_queue_t},Uint64),queue,value)
end

function hsa_agent_iterate_regions(agent::hsa_agent_t,callback::Ptr{Void},data::Ptr{Void})
    ccall((:hsa_agent_iterate_regions,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Ptr{Void}),agent,callback,data)
end

function hsa_region_get_info(region::hsa_region_t,attribute::hsa_region_info_t,value::Ptr{Void})
    ccall((:hsa_region_get_info,libhsa),hsa_status_t,(hsa_region_t,hsa_region_info_t,Ptr{Void}),region,attribute,value)
end

function hsa_memory_register(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_register,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_deregister(address::Ptr{Void},size::Cint)
    ccall((:hsa_memory_deregister,libhsa),hsa_status_t,(Ptr{Void},Cint),address,size)
end

function hsa_memory_allocate(region::hsa_region_t,size::Cint,ptr::Ptr{Ptr{Void}})
    ccall((:hsa_memory_allocate,libhsa),hsa_status_t,(hsa_region_t,Cint,Ptr{Ptr{Void}}),region,size,ptr)
end

function hsa_memory_free(ptr::Ptr{Void})
    ccall((:hsa_memory_free,libhsa),hsa_status_t,(Ptr{Void},),ptr)
end

function hsa_signal_create(initial_value::hsa_signal_value_t,num_consumers::Uint32,consumers::Ptr{hsa_agent_t},signal::Ptr{hsa_signal_t})
    ccall((:hsa_signal_create,libhsa),hsa_status_t,(hsa_signal_value_t,Uint32,Ptr{hsa_agent_t},Ptr{hsa_signal_t}),initial_value,num_consumers,consumers,signal)
end

function hsa_signal_destroy(signal::hsa_signal_t)
    ccall((:hsa_signal_destroy,libhsa),hsa_status_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_relaxed(signal::hsa_signal_t)
    ccall((:hsa_signal_load_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_load_acquire(signal::hsa_signal_t)
    ccall((:hsa_signal_load_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,),signal)
end

function hsa_signal_store_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_store_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_store_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_wait_relaxed(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_wait_acquire(signal::hsa_signal_t,condition::hsa_signal_condition_t,compare_value::hsa_signal_value_t,timeout_hint::Uint64,wait_expectancy_hint::hsa_wait_expectancy_t)
    ccall((:hsa_signal_wait_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_condition_t,hsa_signal_value_t,Uint64,hsa_wait_expectancy_t),signal,condition,compare_value,timeout_hint,wait_expectancy_hint)
end

function hsa_signal_and_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_and_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_and_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_or_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_or_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_xor_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_xor_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_add_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_add_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_relaxed,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acquire,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_release,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_subtract_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_subtract_acq_rel,libhsa),Void,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_relaxed(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acquire(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_release(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_exchange_acq_rel(signal::hsa_signal_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_exchange_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t),signal,value)
end

function hsa_signal_cas_relaxed(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_relaxed,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acquire(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acquire,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_release(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_release,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_signal_cas_acq_rel(signal::hsa_signal_t,expected::hsa_signal_value_t,value::hsa_signal_value_t)
    ccall((:hsa_signal_cas_acq_rel,libhsa),hsa_signal_value_t,(hsa_signal_t,hsa_signal_value_t,hsa_signal_value_t),signal,expected,value)
end

function hsa_status_string(status::hsa_status_t,status_string::Ptr{Ptr{Uint8}})
    ccall((:hsa_status_string,libhsa),hsa_status_t,(hsa_status_t,Ptr{Ptr{Uint8}}),status,status_string)
end

function hsa_extension_query(extension::hsa_extension_t,result::Ptr{Cint})
    ccall((:hsa_extension_query,libhsa),hsa_status_t,(hsa_extension_t,Ptr{Cint}),extension,result)
end

function hsa_ext_finalize(caller::hsa_runtime_caller_t,agent::hsa_agent_t,program_agent_id::Uint32,program_agent_count::Uint32,finalization_request_count::Cint,finalization_request_list::Ptr{hsa_ext_finalization_request_t},control_directives::Ptr{hsa_ext_control_directives_t},symbol_definition_callback::hsa_ext_symbol_definition_callback_t,symbol_address_callback::hsa_ext_symbol_address_callback_t,error_message_callback::hsa_ext_error_message_callback_t,optimization_level::Uint8,options::Ptr{Uint8},debug_information::Cint,finalization::Ptr{hsa_ext_finalization_handle_t})
    ccall((:hsa_ext_finalize,libhsa),hsa_status_t,(hsa_runtime_caller_t,hsa_agent_t,Uint32,Uint32,Cint,Ptr{hsa_ext_finalization_request_t},Ptr{hsa_ext_control_directives_t},hsa_ext_symbol_definition_callback_t,hsa_ext_symbol_address_callback_t,hsa_ext_error_message_callback_t,Uint8,Ptr{Uint8},Cint,Ptr{hsa_ext_finalization_handle_t}),caller,agent,program_agent_id,program_agent_count,finalization_request_count,finalization_request_list,control_directives,symbol_definition_callback,symbol_address_callback,error_message_callback,optimization_level,options,debug_information,finalization)
end

function hsa_ext_query_finalization_code_descriptor_count(agent::hsa_agent_t,finalization::hsa_ext_finalization_handle_t,code_descriptor_count::Ptr{Uint32})
    ccall((:hsa_ext_query_finalization_code_descriptor_count,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_finalization_handle_t,Ptr{Uint32}),agent,finalization,code_descriptor_count)
end

function hsa_ext_query_finalization_code_descriptor(agent::hsa_agent_t,finalization::hsa_ext_finalization_handle_t,index::Uint32,code_descriptor::Ptr{hsa_ext_code_descriptor_t})
    ccall((:hsa_ext_query_finalization_code_descriptor,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_finalization_handle_t,Uint32,Ptr{hsa_ext_code_descriptor_t}),agent,finalization,index,code_descriptor)
end

function hsa_ext_destroy_finalization(agent::hsa_agent_t,finalization::hsa_ext_finalization_handle_t)
    ccall((:hsa_ext_destroy_finalization,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_finalization_handle_t),agent,finalization)
end

function hsa_ext_serialize_finalization(caller::hsa_runtime_caller_t,agent::hsa_agent_t,finalization::hsa_ext_finalization_handle_t,alloc_serialize_data_callback::hsa_runtime_alloc_data_callback_t,error_message_callback::hsa_ext_error_message_callback_t,debug_information::Cint,serialized_object::Ptr{Void})
    ccall((:hsa_ext_serialize_finalization,libhsa),hsa_status_t,(hsa_runtime_caller_t,hsa_agent_t,hsa_ext_finalization_handle_t,hsa_runtime_alloc_data_callback_t,hsa_ext_error_message_callback_t,Cint,Ptr{Void}),caller,agent,finalization,alloc_serialize_data_callback,error_message_callback,debug_information,serialized_object)
end

function hsa_ext_deserialize_finalization(caller::hsa_runtime_caller_t,serialized_object::Ptr{Void},agent::hsa_agent_t,program_agent_id::Uint32,program_agent_count::Uint32,symbol_address_callback::hsa_ext_symbol_address_callback_t,error_message_callback::hsa_ext_error_message_callback_t,debug_information::Cint,finalization::Ptr{hsa_ext_finalization_handle_t})
    ccall((:hsa_ext_deserialize_finalization,libhsa),hsa_status_t,(hsa_runtime_caller_t,Ptr{Void},hsa_agent_t,Uint32,Uint32,hsa_ext_symbol_address_callback_t,hsa_ext_error_message_callback_t,Cint,Ptr{hsa_ext_finalization_handle_t}),caller,serialized_object,agent,program_agent_id,program_agent_count,symbol_address_callback,error_message_callback,debug_information,finalization)
end

function hsa_ext_program_create(agents::Ptr{hsa_agent_t},agent_count::Uint32,machine_model::hsa_ext_brig_machine_model8_t,profile::hsa_ext_brig_profile8_t,program::Ptr{hsa_ext_program_handle_t})
    ccall((:hsa_ext_program_create,libhsa),hsa_status_t,(Ptr{hsa_agent_t},Uint32,hsa_ext_brig_machine_model8_t,hsa_ext_brig_profile8_t,Ptr{hsa_ext_program_handle_t}),agents,agent_count,machine_model,profile,program)
end

function hsa_ext_program_destroy(program::hsa_ext_program_handle_t)
    ccall((:hsa_ext_program_destroy,libhsa),hsa_status_t,(hsa_ext_program_handle_t,),program)
end

function hsa_ext_add_module(program::hsa_ext_program_handle_t,brig_module::Ptr{hsa_ext_brig_module_t},_module::Ptr{hsa_ext_brig_module_handle_t})
    ccall((:hsa_ext_add_module,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Ptr{hsa_ext_brig_module_t},Ptr{hsa_ext_brig_module_handle_t}),program,brig_module,_module)
end

function hsa_ext_finalize_program(program::hsa_ext_program_handle_t,agent::hsa_agent_t,finalization_request_count::Cint,finalization_request_list::Ptr{hsa_ext_finalization_request_t},control_directives::Ptr{hsa_ext_control_directives_t},error_message_callback::hsa_ext_error_message_callback_t,optimization_level::Uint8,options::Ptr{Uint8},debug_information::Cint)
    ccall((:hsa_ext_finalize_program,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,Cint,Ptr{hsa_ext_finalization_request_t},Ptr{hsa_ext_control_directives_t},hsa_ext_error_message_callback_t,Uint8,Ptr{Uint8},Cint),program,agent,finalization_request_count,finalization_request_list,control_directives,error_message_callback,optimization_level,options,debug_information)
end

function hsa_ext_query_program_agent_id(program::hsa_ext_program_handle_t,agent::hsa_agent_t,program_agent_id::Ptr{hsa_ext_program_agent_id_t})
    ccall((:hsa_ext_query_program_agent_id,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,Ptr{hsa_ext_program_agent_id_t}),program,agent,program_agent_id)
end

function hsa_ext_query_program_agent_count(program::hsa_ext_program_handle_t,program_agent_count::Ptr{Uint32})
    ccall((:hsa_ext_query_program_agent_count,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Ptr{Uint32}),program,program_agent_count)
end

function hsa_ext_query_program_agents(program::hsa_ext_program_handle_t,program_agent_count::Uint32,agents::Ptr{hsa_agent_t})
    ccall((:hsa_ext_query_program_agents,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Uint32,Ptr{hsa_agent_t}),program,program_agent_count,agents)
end

function hsa_ext_query_program_module_count(program::hsa_ext_program_handle_t,program_module_count::Ptr{Uint32})
    ccall((:hsa_ext_query_program_module_count,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Ptr{Uint32}),program,program_module_count)
end

function hsa_ext_query_program_modules(program::hsa_ext_program_handle_t,program_module_count::Uint32,modules::Ptr{hsa_ext_brig_module_handle_t})
    ccall((:hsa_ext_query_program_modules,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Uint32,Ptr{hsa_ext_brig_module_handle_t}),program,program_module_count,modules)
end

function hsa_ext_query_program_brig_module(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,brig_module::Ptr{Ptr{hsa_ext_brig_module_t}})
    ccall((:hsa_ext_query_program_brig_module,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,Ptr{Ptr{hsa_ext_brig_module_t}}),program,_module,brig_module)
end

function hsa_ext_query_call_convention(program::hsa_ext_program_handle_t,agent::hsa_agent_t,first_call_convention_id::Ptr{hsa_ext_program_call_convention_id32_t},call_convention_count::Ptr{Uint32})
    ccall((:hsa_ext_query_call_convention,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,Ptr{hsa_ext_program_call_convention_id32_t},Ptr{Uint32}),program,agent,first_call_convention_id,call_convention_count)
end

function hsa_ext_query_symbol_definition(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,definition_module::Ptr{hsa_ext_brig_module_handle_t},definition_module_brig::Ptr{Ptr{hsa_ext_brig_module_t}},definition_symbol::Ptr{hsa_ext_brig_code_section_offset32_t})
    ccall((:hsa_ext_query_symbol_definition,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{hsa_ext_brig_module_handle_t},Ptr{Ptr{hsa_ext_brig_module_t}},Ptr{hsa_ext_brig_code_section_offset32_t}),program,_module,symbol,definition_module,definition_module_brig,definition_symbol)
end

function hsa_ext_define_program_allocation_global_variable_address(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,error_message_callback::hsa_ext_error_message_callback_t,address::Ptr{Void})
    ccall((:hsa_ext_define_program_allocation_global_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,hsa_ext_error_message_callback_t,Ptr{Void}),program,_module,symbol,error_message_callback,address)
end

function hsa_ext_query_program_allocation_global_variable_address(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,address::Ptr{Ptr{Void}})
    ccall((:hsa_ext_query_program_allocation_global_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{Ptr{Void}}),program,_module,symbol,address)
end

function hsa_ext_define_agent_allocation_global_variable_address(program::hsa_ext_program_handle_t,agent::hsa_agent_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,error_message_callback::hsa_ext_error_message_callback_t,address::Ptr{Void})
    ccall((:hsa_ext_define_agent_allocation_global_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,hsa_ext_error_message_callback_t,Ptr{Void}),program,agent,_module,symbol,error_message_callback,address)
end

function hsa_ext_query_agent_global_variable_address(program::hsa_ext_program_handle_t,agent::hsa_agent_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,address::Ptr{Ptr{Void}})
    ccall((:hsa_ext_query_agent_global_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{Ptr{Void}}),program,agent,_module,symbol,address)
end

function hsa_ext_define_readonly_variable_address(program::hsa_ext_program_handle_t,agent::hsa_agent_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,error_message_callback::hsa_ext_error_message_callback_t,address::Ptr{Void})
    ccall((:hsa_ext_define_readonly_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,hsa_ext_error_message_callback_t,Ptr{Void}),program,agent,_module,symbol,error_message_callback,address)
end

function hsa_ext_query_readonly_variable_address(program::hsa_ext_program_handle_t,agent::hsa_agent_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,address::Ptr{Ptr{Void}})
    ccall((:hsa_ext_query_readonly_variable_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_agent_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{Ptr{Void}}),program,agent,_module,symbol,address)
end

function hsa_ext_query_kernel_descriptor_address(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,kernel_descriptor::Ptr{Ptr{hsa_ext_code_descriptor_t}})
    ccall((:hsa_ext_query_kernel_descriptor_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{Ptr{hsa_ext_code_descriptor_t}}),program,_module,symbol,kernel_descriptor)
end

function hsa_ext_query_indirect_function_descriptor_address(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,symbol::hsa_ext_brig_code_section_offset32_t,indirect_function_descriptor::Ptr{Ptr{hsa_ext_code_descriptor_t}})
    ccall((:hsa_ext_query_indirect_function_descriptor_address,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_brig_code_section_offset32_t,Ptr{Ptr{hsa_ext_code_descriptor_t}}),program,_module,symbol,indirect_function_descriptor)
end

function hsa_ext_validate_program(program::hsa_ext_program_handle_t,error_message_callback::hsa_ext_error_message_callback_t)
    ccall((:hsa_ext_validate_program,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_error_message_callback_t),program,error_message_callback)
end

function hsa_ext_validate_program_module(program::hsa_ext_program_handle_t,_module::hsa_ext_brig_module_handle_t,error_message_callback::hsa_ext_error_message_callback_t)
    ccall((:hsa_ext_validate_program_module,libhsa),hsa_status_t,(hsa_ext_program_handle_t,hsa_ext_brig_module_handle_t,hsa_ext_error_message_callback_t),program,_module,error_message_callback)
end

function hsa_ext_serialize_program(caller::hsa_runtime_caller_t,program::hsa_ext_program_handle_t,alloc_serialize_data_callback::hsa_runtime_alloc_data_callback_t,error_message_callback::hsa_ext_error_message_callback_t,debug_information::Cint,serialized_object::Ptr{Void})
    ccall((:hsa_ext_serialize_program,libhsa),hsa_status_t,(hsa_runtime_caller_t,hsa_ext_program_handle_t,hsa_runtime_alloc_data_callback_t,hsa_ext_error_message_callback_t,Cint,Ptr{Void}),caller,program,alloc_serialize_data_callback,error_message_callback,debug_information,serialized_object)
end

function hsa_ext_deserialize_program(caller::hsa_runtime_caller_t,serialized_object::Ptr{Void},program_allocation_symbol_address::hsa_ext_program_allocation_symbol_address_t,agent_allocation_symbol_address::hsa_ext_agent_allocation_symbol_address_t,error_message_callback::hsa_ext_error_message_callback_t,debug_information::Cint,program::Ptr{Ptr{hsa_ext_program_handle_t}})
    ccall((:hsa_ext_deserialize_program,libhsa),hsa_status_t,(hsa_runtime_caller_t,Ptr{Void},hsa_ext_program_allocation_symbol_address_t,hsa_ext_agent_allocation_symbol_address_t,hsa_ext_error_message_callback_t,Cint,Ptr{Ptr{hsa_ext_program_handle_t}}),caller,serialized_object,program_allocation_symbol_address,agent_allocation_symbol_address,error_message_callback,debug_information,program)
end

function hsa_ext_get_image_info_max_dim(component::hsa_agent_t,attribute::hsa_agent_info_t,value::Ptr{Void})
    ccall((:hsa_ext_get_image_info_max_dim,libhsa),hsa_status_t,(hsa_agent_t,hsa_agent_info_t,Ptr{Void}),component,attribute,value)
end

function hsa_ext_image_get_format_capability(agent::hsa_agent_t,image_format::Ptr{hsa_ext_image_format_t},image_geometry::hsa_ext_image_geometry_t,capability_mask::Ptr{Uint32})
    ccall((:hsa_ext_image_get_format_capability,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_format_t},hsa_ext_image_geometry_t,Ptr{Uint32}),agent,image_format,image_geometry,capability_mask)
end

function hsa_ext_image_get_info(agent::hsa_agent_t,image_descriptor::Ptr{hsa_ext_image_descriptor_t},access_permission::hsa_ext_image_access_permission_t,image_info::Ptr{hsa_ext_image_info_t})
    ccall((:hsa_ext_image_get_info,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},hsa_ext_image_access_permission_t,Ptr{hsa_ext_image_info_t}),agent,image_descriptor,access_permission,image_info)
end

function hsa_ext_image_create_handle(agent::hsa_agent_t,image_descriptor::Ptr{hsa_ext_image_descriptor_t},image_data::Ptr{Void},access_permission::hsa_ext_image_access_permission_t,image_handle::Ptr{hsa_ext_image_handle_t})
    ccall((:hsa_ext_image_create_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_descriptor_t},Ptr{Void},hsa_ext_image_access_permission_t,Ptr{hsa_ext_image_handle_t}),agent,image_descriptor,image_data,access_permission,image_handle)
end

function hsa_ext_image_import(agent::hsa_agent_t,src_memory::Ptr{Void},src_row_pitch::Cint,src_slice_pitch::Cint,dst_image_handle::hsa_ext_image_handle_t,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_import,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Void},Cint,Cint,hsa_ext_image_handle_t,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_memory,src_row_pitch,src_slice_pitch,dst_image_handle,image_region,completion_signal)
end

function hsa_ext_image_export(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_memory::Ptr{Void},dst_row_pitch::Cint,dst_slice_pitch::Cint,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_export,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Ptr{Void},Cint,Cint,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_image_handle,dst_memory,dst_row_pitch,dst_slice_pitch,image_region,completion_signal)
end

function hsa_ext_image_copy(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_image_handle::hsa_ext_image_handle_t,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_copy,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,hsa_ext_image_handle_t,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,src_image_handle,dst_image_handle,image_region,completion_signal)
end

function hsa_ext_image_clear(agent::hsa_agent_t,image_handle::hsa_ext_image_handle_t,data::Array_4_Cfloat,image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_clear,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Array_4_Cfloat,Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,image_handle,data,image_region,completion_signal)
end

function hsa_ext_image_copy_split_offset(agent::hsa_agent_t,src_image_handle::hsa_ext_image_handle_t,dst_image_handle::hsa_ext_image_handle_t,src_origin::hsa_dim3_t,dst_origin::hsa_dim3_t,size::hsa_ext_image_range_t,completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_copy_split_offset,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,hsa_ext_image_handle_t,hsa_dim3_t,hsa_dim3_t,hsa_ext_image_range_t,Ptr{hsa_signal_t}),agent,src_image_handle,dst_image_handle,src_origin,dst_origin,size,completion_signal)
end

function hsa_ext_image_clear_generic_data(agent::hsa_agent_t,image_handle::hsa_ext_image_handle_t,data::Ptr{Void},image_region::Ptr{hsa_ext_image_region_t},completion_signal::Ptr{hsa_signal_t})
    ccall((:hsa_ext_image_clear_generic_data,libhsa),hsa_status_t,(hsa_agent_t,hsa_ext_image_handle_t,Ptr{Void},Ptr{hsa_ext_image_region_t},Ptr{hsa_signal_t}),agent,image_handle,data,image_region,completion_signal)
end

function hsa_ext_image_destroy_handle(agent::hsa_agent_t,image_handle::Ptr{hsa_ext_image_handle_t})
    ccall((:hsa_ext_image_destroy_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_image_handle_t}),agent,image_handle)
end

function hsa_ext_sampler_create_handle(agent::hsa_agent_t,sampler_descriptor::Ptr{hsa_ext_sampler_descriptor_t},sampler_handle::Ptr{hsa_ext_sampler_handle_t})
    ccall((:hsa_ext_sampler_create_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_sampler_descriptor_t},Ptr{hsa_ext_sampler_handle_t}),agent,sampler_descriptor,sampler_handle)
end

function hsa_ext_sampler_destroy_handle(agent::hsa_agent_t,sampler_handle::Ptr{hsa_ext_sampler_handle_t})
    ccall((:hsa_ext_sampler_destroy_handle,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_ext_sampler_handle_t}),agent,sampler_handle)
end

function hsa_ext_get_memory_type(agent::hsa_agent_t,_type::Ptr{hsa_amd_memory_type_t})
    ccall((:hsa_ext_get_memory_type,libhsa),hsa_status_t,(hsa_agent_t,Ptr{hsa_amd_memory_type_t}),agent,_type)
end

function hsa_ext_set_memory_type(agent::hsa_agent_t,_type::hsa_amd_memory_type_t)
    ccall((:hsa_ext_set_memory_type,libhsa),hsa_status_t,(hsa_agent_t,hsa_amd_memory_type_t),agent,_type)
end

function hsa_ext_set_profiling(queue::Ptr{hsa_queue_t},enable::Cint)
    ccall((:hsa_ext_set_profiling,libhsa),hsa_status_t,(Ptr{hsa_queue_t},Cint),queue,enable)
end

function hsa_ext_get_dispatch_times(agent::hsa_agent_t,signal::hsa_signal_t,time::Ptr{hsa_amd_dispatch_time_t})
    ccall((:hsa_ext_get_dispatch_times,libhsa),hsa_status_t,(hsa_agent_t,hsa_signal_t,Ptr{hsa_amd_dispatch_time_t}),agent,signal,time)
end

function hsa_ext_extra_query_call_convention_count(agent::hsa_agent_t,call_convention_count::Ptr{Uint32})
    ccall((:hsa_ext_extra_query_call_convention_count,libhsa),hsa_status_t,(hsa_agent_t,Ptr{Uint32}),agent,call_convention_count)
end

function hsa_ext_extra_query_symbol_definition(program::hsa_ext_program_handle_t,symbol_name::Ptr{Uint8},definition_module::Ptr{hsa_ext_brig_module_handle_t},definition_module_brig::Ptr{Ptr{hsa_ext_brig_module_t}},definition_symbol::Ptr{hsa_ext_brig_code_section_offset32_t})
    ccall((:hsa_ext_extra_query_symbol_definition,libhsa),hsa_status_t,(hsa_ext_program_handle_t,Ptr{Uint8},Ptr{hsa_ext_brig_module_handle_t},Ptr{Ptr{hsa_ext_brig_module_t}},Ptr{hsa_ext_brig_code_section_offset32_t}),program,symbol_name,definition_module,definition_module_brig,definition_symbol)
end

function hsa_ext_extra_query_program(code::hsa_ext_code_handle_t,program::Ptr{hsa_ext_program_handle_t})
    ccall((:hsa_ext_extra_query_program,libhsa),hsa_status_t,(hsa_ext_code_handle_t,Ptr{hsa_ext_program_handle_t}),code,program)
end

function hsa_ext_code_unit_load(caller::hsa_runtime_caller_t,agent::Ptr{hsa_agent_t},agent_count::Cint,serialized_code_unit::Ptr{Void},serialized_code_unit_size::Cint,options::Ptr{Uint8},symbol_value::hsa_ext_symbol_value_callback_t,code_unit::Ptr{hsa_amd_code_unit_t})
    ccall((:hsa_ext_code_unit_load,libhsa),hsa_status_t,(hsa_runtime_caller_t,Ptr{hsa_agent_t},Cint,Ptr{Void},Cint,Ptr{Uint8},hsa_ext_symbol_value_callback_t,Ptr{hsa_amd_code_unit_t}),caller,agent,agent_count,serialized_code_unit,serialized_code_unit_size,options,symbol_value,code_unit)
end

function hsa_ext_code_unit_destroy(code_unit::hsa_amd_code_unit_t)
    ccall((:hsa_ext_code_unit_destroy,libhsa),hsa_status_t,(hsa_amd_code_unit_t,),code_unit)
end

function hsa_ext_code_unit_get_info(code_unit::hsa_amd_code_unit_t,attribute::hsa_amd_code_unit_info_t,index::Uint32,value::Ptr{Void})
    ccall((:hsa_ext_code_unit_get_info,libhsa),hsa_status_t,(hsa_amd_code_unit_t,hsa_amd_code_unit_info_t,Uint32,Ptr{Void}),code_unit,attribute,index,value)
end

function hsa_ext_code_unit_iterator(caller::hsa_runtime_caller_t,code_unit_iterator::hsa_ext_code_unit_iterator_callback_t)
    ccall((:hsa_ext_code_unit_iterator,libhsa),hsa_status_t,(hsa_runtime_caller_t,hsa_ext_code_unit_iterator_callback_t),caller,code_unit_iterator)
end
