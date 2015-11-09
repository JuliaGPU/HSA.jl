module ExtFinalization
using HSA

typealias fun_table HSA.hsa_ext_finalizer_1_00_pfn_t

function __init__()
    @use rt = HSA.Runtime() begin
        supported = Ref{Cint}(0)
        err = ccall(
            (:hsa_system_extension_supported,HSA.libhsa),
            HSA.hsa_status_t,
            (UInt16,UInt16,UInt16,Ptr{Cint}),
            HSA.ExtensionFinalizer,
            UInt16(1),
            UInt16(0),
            supported)

        HSA.test_status(err)

        if supported.x == 0
            error("HSA Finalization Extension is unsupported")
        end

        null = Ptr{Void}(0)
        fn_table = Ref{fun_table}(fun_table(null, null, null, null, null, null))

        err = ccall(
            (:hsa_system_get_extension_table,HSA.libhsa),
            HSA.hsa_status_t,
            (UInt16,UInt16,UInt16,Ptr{Void}),
            HSA.ExtensionFinalizer,
            UInt16(1),
            UInt16(0),
            fn_table)

        HSA.test_status(err)

        global pfn_finalizer = fn_table.x
    end
end

export Program

type Program
    handle

	function Program(h :: HSA.hsa_ext_program_t)

		return new(h)
	end
end

function Program(;
	machine_model = (WORD_SIZE == 64) ? HSA.MachineModelLarge : HSA.MachineModelSmall,
	profile = HSA.ProfileFull,
	default_float_rounding_mode = HSA.DefaultFloatRoundingModeDefault,
	options = nothing)

	h = program_create(machine_model, profile, default_float_rounding_mode, options = options)

	p = Program(h)

	finalizer(p, program_destroy)

	return p
end

import Base.convert

convert(::Type{HSA.hsa_ext_program_t}, p :: Program) = p.handle

function program_create(machine_model, profile, default_float_rounding_mode;
	options = ""
	)

	if options == nothing || options == ""
        options = C_NULL
	else
		options = ascii(options)
	end

	res = Ref{HSA.hsa_ext_program_t}(HSA.hsa_ext_program_t(0))

	err = ccall((:hsa_ext_program_create, HSA.libhsa), HSA.hsa_status_t, (HSA.hsa_machine_model_t, HSA.hsa_profile_t, HSA.hsa_default_float_rounding_mode_t, Ptr{Cchar}, Ptr{HSA.hsa_ext_program_t}),
	      machine_model, profile, default_float_rounding_mode, options, res)

	HSA.test_status(err)

	return res.x
end

function program_destroy(program)
	err = ccall((:hsa_ext_program_destroy, HSA.libhsa), HSA.hsa_status_t, (HSA.hsa_ext_program_t,),
	            program)

	if isa(program, Program)
	    program.handle = nothing
	end

    HSA.test_status(err, warn_only = true)
end

function program_add_module(program, mod)
	err = ccall((:hsa_ext_program_add_module, HSA.libhsa), HSA.hsa_status_t, (HSA.hsa_ext_program_t, HSA.hsa_ext_module_t),
	            program, mod)

	HSA.test_status(err)
end

function program_finalize(program, isa, call_convention;
	control_directives = nothing,
	options = nothing,
	code_object_type = HSA.HSA_CODE_OBJECT_TYPE_PROGRAM)

	if control_directives == nothing
		control_directives = zero(HSA.hsa_ext_control_directives_t)
	end

	if options == nothing || options == ""
        options = C_NULL
	else
		options = ascii(options)
	end

	res = Ref{HSA.hsa_code_object_t}(HSA.hsa_code_object_t(0))

	err = ccall((:hsa_ext_program_finalize, HSA.libhsa), HSA.hsa_status_t, (
	HSA.hsa_ext_program_t,
	HSA.hsa_isa_t,
	Int32,
	HSA.hsa_ext_control_directives_t,
	Ptr{Cchar},
	HSA.hsa_code_object_type_t,
	Ptr{HSA.hsa_code_object_t}),
	program, isa, call_convention, control_directives, options, code_object_type, res)

	HSA.test_status(err)

	return res.x
end

end
