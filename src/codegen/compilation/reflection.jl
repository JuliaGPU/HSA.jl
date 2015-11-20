export code_spir, code_hsa, src_hsail

function to_tuple_type(t::ANY)
    if isa(t,Tuple) || isa(t,AbstractArray) || isa(t,SimpleVector)
        t = Tuple{t...}
    end
    if isa(t,Type) && t<:Tuple
        if !all(p->(isa(p,Type)||isa(p,TypeVar)), t.parameters)
            error("argument tuple type must contain only types")
        end
    else
        error("expected tuple type")
    end
    t
end

# display ir of the generated spir function
function src_spir(f::Function, types::ANY)
    t = to_tuple_type(types)
    llvmf = ccall(:jl_get_spirf, Ptr{Void}, (Any, Any), f, t)

    if llvmf == C_NULL
        error("no method found for the specified argument types")
    end

    str = ccall(:jl_dump_function_ir, Any, (Ptr{Void},), llvmf)::ByteString

    return str
end

code_spir(io::IO, f::Function, types::ANY) = print(io, src_spir(f,types))

code_spir(f::ANY, t::ANY) = code_spir(STDOUT, f, t)

# display ir after linking to the hsa intrinsics
function src_hsa(f::Function, types::ANY)
    t = to_tuple_type(types)
    llvmf = ccall(:jl_get_hsailf, Ptr{Void}, (Any, Any, Bool), f, t, false)

    if llvmf == C_NULL
        error("no method found for the specified argument types")
    end

    str = ccall(:jl_dump_function_ir, Any, (Ptr{Void},), llvmf)::ByteString

    return str
end

code_hsa(io::IO, f::Function, types::ANY) = print(io, src_hsa(f,types))

code_hsa(f::ANY, t::ANY) = code_hsa(STDOUT, f, t)

# output final hsail code
function src_hsail(f::Function, types::ANY)
    t = to_tuple_type(types)
    llvmf = ccall(:jl_get_hsailf, Ptr{Void}, (Any, Any), f, t)

    if llvmf == C_NULL
        error("no method found for the specified argument types")
    end

    str = ccall(:jl_dump_function_hsail, Any, (Ptr{Void},), llvmf)::ByteString

    return str
end

function init_codegen()
    ccall(:jl_init_device_codegen, Bool, (Any,), :hsail)
end
