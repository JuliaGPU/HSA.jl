module Builtins

# Raw pointer accesses
typealias DeviceArray Ptr

import Base.getindex
@inline getindex{T}(a::DeviceArray{T}, i0::Real) =
    Base.unsafe_load(a, Base.to_index(i0))::T
import Base.setindex!
@inline setindex!{T}(a::DeviceArray{T}, x::T, i0::Real) =
    Base.unsafe_store!(a, x, Base.to_index(i0))

# intrinsic functions
using Core.Intrinsics.llvmcall

const BUILTINS = Symbol[]

is_builtin(b::Symbol) = in(b, BUILTINS)
is_builtin(b) = false

const int_intrinsics = [
    ("@_Z13get_global_idj", Int64),
    ("@_Z12get_local_idj", Int64),
    ("@_Z17get_global_offsetj", Int64),
    ("@_Z12get_group_idj", Int64),
    ("@_Z15get_global_sizej", Int64),
    ("@_Z14get_local_sizej", Int64),
    ("@_Z14get_num_groupsj", Int64),
    ("@_Z12get_work_dimv", Int64),
    ("@_Z23get_enqueued_local_sizej", Int64),
    ("@_Z20get_global_linear_idv", Int64),
    ("@_Z19get_local_linear_idv", Int64),
    ]

type IntrinsicDef
    name
    ret_type
    arg_types

    function IntrinsicDef()
        new("", Void, Tuple{})
    end
end

const typeMap = Dict(
    "j" => Int32,
    "v" => Void
    )

const llvmTypeMap = Dict(
    Int32 => "i32",
    Int64 => "i64"
    )

function parse_mangled_name(name)
    def = IntrinsicDef()

    len_str = match(r"([0-9]+)(.+)", name)

    assert(len_str != nothing)

    len = parse(Int, len_str.captures[1])

    name_tail = len_str.captures[2];

    def.name = name_tail[1:len]

    arg_typecodes = name_tail[len+1:end]

    arg_types = filter(
    (x) -> x != Void,
        [ typeMap[string(x)] for x in arg_typecodes ]
    )

    def.arg_types = arg_types

    return def
end

function intrinsic_impl()
    for intr in int_intrinsics
        mangled_name = intr[1]

        def = parse_mangled_name(mangled_name)
        def.ret_type = intr[2]

        llvm_argtypes = map(
            (x) -> llvmTypeMap[x],
            def.arg_types
        )

        arg_names = Array(Symbol, length(def.arg_types))
        arg_exprs = Array(Expr, length(def.arg_types))

        arg = 'a'
        for i = 1:length(arg_names)
            arg_name = symbol(arg)
            arg_type = def.arg_types[i]

            arg_exprs[i] = :($arg_name :: $arg_type)

            arg_names[i] = arg_name
            arg += 1
        end

        intr_name = symbol(def.name)

        call_expr = Expr(
            :call,
            intr_name,
            arg_exprs...)

        llvm_argtype_string = join(llvm_argtypes, ",")
        llvm_argcall_string = join([ "$(llvm_argtypes[i]) %$(i-1)" for i = 1:length(llvm_argtypes)], ",")

        tuple_expr = Expr(
            :tuple,
            "declare spir_func i64 $mangled_name($llvm_argtype_string) readnone nounwind",
            """%res = tail call spir_func i64 $mangled_name($llvm_argcall_string)
               ret i64 %res""")
        argtype_expr = Expr(
            :curly,
            :Tuple,
            def.arg_types...
            )

        llvmcall_expr = Expr(
            :call,
            :llvmcall,
            tuple_expr,
            def.ret_type,
            argtype_expr,
            arg_names...
            )

        impl_expr = Expr(
            :(=),
            call_expr,
            llvmcall_expr
        )

        final_expr = quote
            $impl_expr
        end

        # Add final code to the module
        eval(final_expr)

        push!(BUILTINS, intr_name)
    end
end

intrinsic_impl()
end # module Builtins
