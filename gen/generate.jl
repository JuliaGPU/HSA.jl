#
# This script uses Clang.jl to generate a C binding from the HSA header files
#
using Clang.cindex
using Clang.wrap_c

script_path = dirname(Base.source_path())

include("$script_path/../src/binding/def.jl") # pull in include path

hsa_hdrs = map(x->joinpath(hsa_include_path, x), [
    "hsa.h",
    "hsa_ext_finalize.h",
    "hsa_ext_image.h"
])

clang_includes = [
    hsa_include_path
]

if haskey(ENV, "INCLUDE_PATH")
	unshift!(clang_includes, ENV["INCLUDE_PATH"])
else
	warn("environment variable INCLUDE_PATH is not set, generator may not be able to find all headers included by hsa.h")
end

excluded_symbols = Set([
   # ignore noise
   "HSA_API",
   "HSA_IMPORT",
   # Custom wrappers for
   "hsa_system_get_info",
   "hsa_iterate_agents",
   "hsa_executable_iterate_symbols"
])

const wc = wrap_c.init(
    common_file = "hsa_common.jl",
    output_file = "hsa_h.jl",
    output_dir = "$script_path/../src/binding"
)

wc.clang_includes = clang_includes

wc.header_library = x-> "libhsa"

wc.header_wrapped = (x,y)-> begin
    contains(y,"hsa")
end

wc.cursor_wrapped = (name, cursor)-> begin
    if in(name, excluded_symbols)
        return false
    elseif endswith(name, "_s") || endswith(name, "_u")
        return false
    elseif cindex.name(cursor) == ""
        return false
    else
        return true
    end
end

wc.headers = hsa_hdrs

include("$script_path/../src/runtime/def.jl") # pull in type mappings

include("gen_argtypes.jl")
include("gen_atomics.jl")
include("gen_constants.jl")
include("gen_getters.jl")
include("gen_fieldgetters.jl")


wc.rewriter = function(obuf)
    map_argtypes(obuf)
    map_memspec_funcs(obuf)
	map_constants(obuf)
	gen_fieldgetters(obuf)
	gen_getters(obuf)

    return obuf
end

if !isinteractive()
    run(wc)
end
