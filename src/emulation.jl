using .Intrinsics

export @hsa_kernel, run_cpu

type EmulationContext
	global_id

	function EmulationContext()
		new(
		    [0,0,0]
	    )
	end
end

# Emulated version of intrinsic functions
# mainly for testing and execution on the CPU
import .Intrinsics.get_global_id
function get_global_id(ctx::EmulationContext, dim::Int32)
	return ctx.global_id[dim + 1]
end

# Helpers for adding an emulation overload for a kernel
const CTX = gensym("ctx")

function visit_ast(f :: Function, ast)
	f(ast)

	if isa(ast, Expr)
		for a in ast.args
			visit_ast(f, a)
		end
	end
end

function add_intrinsics_ctx_arg(ex)
	if isa(ex, Expr) && ex.head == :call
		fname = ex.args[1]

		if in(fname, INTRINSICS)
			# add context as first argument (after the function name)
			insert!(ex.args, 2, CTX)
		end
	end
end

function add_emulation(fun::Expr)
   sig = fun.args[1]
   # insert ctx as first argument (after the function name)
   insert!(sig.args, 2, :($CTX :: HSA.EmulationContext))

   visit_ast(add_intrinsics_ctx_arg, fun)
end

macro hsa_kernel(fun::Expr)
	if(fun.head != :function)
		error("@hsail must be applied to a function definition")
	end

    emu_fun	= copy(fun)
	add_emulation(emu_fun)

	return quote
		@target $(esc(:hsail)) $(esc(fun))

		$(esc(emu_fun))
	end
end

function run_cpu(rng::Tuple{Int,Int,Int}, kernel::Function, args...)
	ctx = EmulationContext()
	for x = 0:rng[1]-1
		for y = 0:rng[2]-1
			for z = 0:rng[3]-1
				ctx.global_id[1:3] = [x,y,z]
				kernel(ctx, args...)
			end
		end
	end
end

