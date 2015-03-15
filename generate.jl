#
# This script uses Clang.jl to generate a C binding from the HSA header files
#
using Clang.cindex
using Clang.wrap_c

HSA_RUNTIME_PATH="../runtime"

inc_path = joinpath(HSA_RUNTIME_PATH, "inc")

hsa_hdrs = map(x->joinpath(inc_path, x), [
    "hsa.h",
    #"hsa_api_trace.h",
    "hsa_ext_amd.h",
    "hsa_ext_finalize.h",
    "hsa_ext_image.h"
])

clang_includes = [
    joinpath(HSA_RUNTIME_PATH, "inc")
]

excluded_symbols = Set([
   "HSA_API",
   "HSA_IMPORT",
   # Custom wrappers for
   "hsa_system_get_info",
   "hsa_iterate_agents",
])

const wc = wrap_c.init(
    common_file = "hsa_common.jl",
    output_file = "hsa_h.jl",
    output_dir = "src/binding"
)

wc.clang_includes = clang_includes

wc.header_library = x-> "libhsa"

wc.header_wrapped = (x,y)-> begin
    contains(y,"hsa")
end

wc.cursor_wrapped = (name, cursor)-> begin
    if in(name, excluded_symbols)
        println("excluded type: ", name)
        return false
    elseif endswith(name, "_s") || endswith(name, "_u")
        println("excluded typedef'd struct/union type: ", name)
        return false
    elseif cindex.name(cursor) == ""
        return false
    else
        return true
    end
end

wc.headers = hsa_hdrs

include("src/def.jl") # pull in type mappings

wc.rewriter = function(obuf)
    for exu in obuf
        if isa(exu, Expr) && exu.head == :function
            sig = exu.args[1]
            args = sig.args[2:end]

            for a in args
                 a_type = a.args[2]

                if haskey(argtype_map, a_type)
                    a.args[2] = argtype_map[a_type]
                end
            end
        end
    end

    return obuf
end

#wc.options = wrap_c.InternalOptions(true, false, true)

if !isinteractive()
    run(wc)
end
