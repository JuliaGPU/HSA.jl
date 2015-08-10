import ..HSA: BrigModuleHeader

function brig(f::Function, types::ANY)
    t = to_tuple_type(types)
	brig_ptr = ccall(:jl_get_brigf, Ptr{BrigModuleHeader}, (Any, Any), f, t)

	return brig_ptr
end

import ..ExtFinalization: Program, program_finalize, program_add_module

function finalize_brig(brig_ptr::Ptr{BrigModuleHeader}, isa)
	program = Program()

	program_add_module(program, brig_ptr)

	code_object = program_finalize(program, isa, 0)

	finalize(program)

	return code_object
end
