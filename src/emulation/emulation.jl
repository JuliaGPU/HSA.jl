if !has_hsa_codegen()
    include("intrinsics.jl")
end

module Emulation

export run_cpu

const EMULATED_INTRINSICS = [
    :get_global_id,
    :get_global_size
]


type EmulationContext
    global_id
    global_size

    function EmulationContext()
        new(
            [0,0,0],
            [0,0,0]
        )
    end
end

# Emulated version of intrinsic functions
# mainly for testing and execution on the CPU
function get_global_id(ctx::EmulationContext, dim::Int32)
    return ctx.global_id[dim + 1]
end

function get_global_size(ctx::EmulationContext, dim::Int32)
    return ctx.global_size[dim + 1]
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

        if in(fname, EMULATED_INTRINSICS)
            # add context as first argument (after the function name)
            insert!(ex.args, 2, CTX)
            # qualify the call to the Emulation module
            ex.args[1] = :(Emulation.$fname)
        end
    end
end

function add_emulation(fun::Expr)
   sig = fun.args[1]
   # insert ctx as first argument (after the function name)
   insert!(sig.args, 2, :($CTX :: HSA.Emulation.EmulationContext))

   visit_ast(add_intrinsics_ctx_arg, fun)
end


function run_cpu(rng::Tuple{Int,Int,Int}, kernel::Function, args...)
    ctx = Emulation.EmulationContext()
    ctx.global_size = [rng...]
    for x = 0:rng[1]-1
        for y = 0:rng[2]-1
            for z = 0:rng[3]-1
                ctx.global_id[1:3] = [x,y,z]
                kernel(ctx, args...)
            end
        end
    end
end

end # module Emulation

export @hsa_kernel
macro hsa_kernel(fun::Expr)
    if(fun.head != :function)
        error("@hsa_kernel must be applied to a function definition")
    end

    emu_fun = copy(fun)
    Emulation.add_emulation(emu_fun)

    if has_hsa_codegen()
        device_fun = quote
            @target $(esc(:hsail)) $(esc(fun))
        end
    else
        device_fun = nothing
    end

    return quote

        $(esc(emu_fun))
    end
end

# if codegen is not available, we need to emulate @hsa
if !has_hsa_codegen()
export @hsa_cpu
macro hsa_cpu(range, call)
    if call.head != :call
        error("the second argument of @hsa must be a function call")
    end

    :(run_cpu($range, $(call...)))
end
end
