using HSA
using FactCheck

facts("The Intrinsics generation logic") do
    context("can parse a mangled name") do
        defi32 = HSA.Builtins.parse_mangled_name("@_Z13get_global_idj")

        @fact defi32.name --> "get_global_id"
        @fact defi32.arg_types --> [Int32]

        defv = HSA.Builtins.parse_mangled_name("@_Z20get_global_linear_idv")

        @fact defv.name --> "get_global_linear_id"
        @fact defv.arg_types --> []
    end
end

