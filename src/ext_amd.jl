module ExtAMD

using HSA

# function code_unit_load(serialized_cu :: Array{Uint8, 1})
#     caller = HSA.hsa_runtime_caller_t(0)
# 	agent = C_NULL
# 	agent_count = 0
# 	serialized_code_unit_size = length(serialized_cu)
# 	options = C_NULL
# 	symbol_value = C_NULL
#
#     cu = Array(HSA.hsa_amd_code_unit_t, 1)
#
# 	err = ccall((:hsa_ext_code_unit_load,HSA.libhsa),HSA.hsa_status_t,(HSA.hsa_runtime_caller_t,Ptr{HSA.hsa_agent_t},Cint,Ptr{Void},Cint,Ptr{Uint8},HSA.hsa_ext_symbol_value_callback_t,Ptr{HSA.hsa_amd_code_unit_t}),
#    	            caller,agent,agent_count,serialized_cu, serialized_code_unit_size,options,symbol_value,cu)
#
#     HSA.test_status(err)
#
# 	return cu[1]
# end
#
# function code_unit_get_code(code_unit :: HSA.hsa_amd_code_unit_t, index :: Uint32 = 0x00000000)
#
# 	attribute = HSA.HSA_EXT_CODE_UNIT_INFO_CODE_ENTITY_CODE
#
# 	value = HSA.hsa_amd_code_t[0]
#
#     err = ccall((:hsa_ext_code_unit_get_info,HSA.libhsa),HSA.hsa_status_t,(HSA.hsa_amd_code_unit_t,HSA.hsa_amd_code_unit_info_t,Uint32,Ptr{Void}),
# 	            code_unit,attribute,index,value)
#
# 	HSA.test_status(err)
#
# 	return value[1]
# end
#
end
