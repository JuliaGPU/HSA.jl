export Executable

typealias Executable hsa_executable_t

function Executable(;
	profile = HSA_PROFILE_FULL,
	executable_state = HSA_EXECUTABLE_STATE_UNFROZEN,
	options = C_NULL
	)

	res = Ref{hsa_executable_t}(hsa_executable_t(0))

	err = ccall((:hsa_executable_create, libhsa), hsa_status_t, (
	hsa_profile_t,
	hsa_executable_state_t,
	Ptr{Cchar},
	Ptr{hsa_executable_t}),
	profile, executable_state, options, res)

	test_status(err)

	return res.x
end

function executable_load_code_object(
	executable, agent, code_object;
	options = C_NULL)

	err = ccall((:hsa_executable_load_code_object, libhsa), hsa_status_t, (
	hsa_executable_t,
	hsa_agent_t,
	hsa_code_object_t,
	Ptr{Cchar}),
	executable, agent, code_object, options)

	test_status(err)
end

function executable_freeze(
	executable;
	options = C_NULL)

	err = ccall((:hsa_executable_freeze, libhsa), hsa_status_t, (
	hsa_executable_t,
	Ptr{Cchar}),
	executable,
	options)

	test_status(err)
end

function executable_get_symbol(
	executable,
	module_name,
	symbol_name,
	agent,
	call_convention)

	res = Ref{hsa_executable_symbol_t}(hsa_executable_symbol_t(0))

	err = ccall((:hsa_executable_get_symbol, libhsa), hsa_status_t, (
	hsa_executable_t,
	Ptr{Cchar},
	Ptr{Cchar},
	hsa_agent_t,
	Int32,
	Ptr{hsa_executable_symbol_t}),
	executable, module_name, symbol_name, agent, call_convention, res)

	test_status(err)

	return res.x
end
