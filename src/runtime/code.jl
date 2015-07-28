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
	symbol_name;
	module_name = "",
	agent = hsa_agent_t(0),
	call_convention = 0)

	if module_name == "" || module_name == nothing
		module_name = C_NULL
	end

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

const executable_iterate_symbols_cb_ptr = cfunction(iterate_cb, hsa_status_t, (hsa_executable_t, hsa_executable_symbol_t, Ptr{Void}))

function executable_iterate_symbols(executable, cb::Function)
	convert_cb = function(ex, sym)
		name = HSA.executable_symbol_info_name(sym)
		cb(ex, sym, name)
	end
	state = IterState(convert_cb)

	state_ptr = pointer_from_objref(state)

	err = ccall((:hsa_executable_iterate_symbols, libhsa), hsa_status_t, (hsa_executable_t, Ptr{Void}, Ptr{Void}),
	            executable, executable_iterate_symbols_cb_ptr, state_ptr)

	if !isnull(state.err)
		rethrow(state.err.value)
	end

	test_status(err)
end

function symbols(executable::Executable)
	res = []

	executable_iterate_symbols(executable, (ex, sym, name) -> push!(res, (sym, name)))

	return res
end
