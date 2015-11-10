module ExtFinalization
using HSA

typealias fun_table HSA.hsa_ext_finalizer_1_00_pfn_t

function __init__()
    @use rt = HSA.Runtime() begin
        supported = Ref{Cint}(0)

        # query runtime for support for the extension
        err = ccall(
            (:hsa_system_extension_supported,HSA.libhsa),
            HSA.hsa_status_t,
            (UInt16,UInt16,UInt16,Ptr{Cint}),
            HSA.ExtensionFinalizer,
            UInt16(1),
            UInt16(0),
            supported)

        if HSA.test_status(err, warn_only = true) && supported.x != 0
            # success so far, try to get the function table

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

            if HSA.test_status(err, warn_only = true)
                # everything ok, store the function table for later use
                global const pfn_finalizer = fn_table.x
                return
            end
        end

        # something went wrong
        warn("HSA Finalization Extension is unsupported")
        global const pfn_finalizer = nothing
    end
end

function is_available()
    return pfn_finalizer != nothing
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

	err = ccall(pfn_finalizer.hsa_ext_program_create, HSA.hsa_status_t, (HSA.hsa_machine_model_t, HSA.hsa_profile_t, HSA.hsa_default_float_rounding_mode_t, Ptr{Cchar}, Ptr{HSA.hsa_ext_program_t}),
	      machine_model, profile, default_float_rounding_mode, options, res)

	HSA.test_status(err)

	return res.x
end

function program_destroy(program)
	err = ccall(pfn_finalizer.hsa_ext_program_destroy, HSA.hsa_status_t, (HSA.hsa_ext_program_t,),
	            program)

	if isa(program, Program)
	    program.handle = nothing
	end

    HSA.test_status(err, warn_only = true)
end

function program_add_module(program, mod)
	err = ccall(pfn_finalizer.hsa_ext_program_add_module, HSA.hsa_status_t, (HSA.hsa_ext_program_t, HSA.hsa_ext_module_t),
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

	err = ccall(pfn_finalizer.hsa_ext_program_finalize, HSA.hsa_status_t, (
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

for info in [
    (:machine_model, :ExtProgramInfoMachineModel, :hsa_machine_model_t),
    (:profile, :ExtProgramInfoProfile, :hsa_profile_t),
    (:default_float_rounding_mode, :ExtProgramInfoDefaultFloatRoundingMode,
    :hsa_default_float_rounding_mode_t)
    ]

    fname = symbol("program_", info[1])

    @eval begin
        export $fname
        function $fname(program)
            value = Ref{HSA.$(info[3])}(Base.zero(HSA.$(info[3])))
            err = ccall(pfn_finalizer.hsa_ext_program_get_info, HSA.hsa_status_t,
                (HSA.hsa_ext_program_t, HSA.hsa_ext_program_info_t, Ptr{Void}),
                program, HSA.$(info[2]), value)

            HSA.test_status(err)

            return value.x
        end
    end
end

end
