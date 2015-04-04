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

function map_argtypes(obuf)
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
end

function map_memspec_funcs(obuf)
	# The op dictionaries map an operation name
	# to a tuple of (is_mutator, default_memspec)
	const signal_prefix = "hsa_signal_"
	const signal_op = Dict(
	"load" => (false, :Acquire),
	"store" => (true, :Release),
	"exchange" => (true, :AcquRel),
	"cas" => (true, :AcquRel),
	"add" => (true, :AcquRel),
	"subtract" => (true, :AcquRel),
	"and" => (true, :AcquRel),
	"or" => (true, :AcquRel),
	"xor" => (true, :AcquRel),
	"wait" => (false, :Acquire)
	)

	const queue_prefix = "hsa_queue_"
	const queue_op = Dict(
	"load" => (false, :Acquire),
	"store" => (true, :Release),
	"cas" => ( true, :AcquRel),
	"add" => ( true, :AcquRel),
    )

	const prefix_ops = Dict(
	signal_prefix => signal_op,
	queue_prefix => queue_op
	)

	const memspec_suffixes = Dict(
	"acquire" => :Acquire,
	"acq_rel" => :AcquRel,
	"relaxed" => :Relaxed,
	"release" => :Release
	)

	# maps each prefix to the ops that have been
	# found for it so far
	const prefix_found_ops = Dict{String,Set{String}}()

	for exu in obuf
		if isa(exu, Expr) && exu.head == :function
			sig = exu.args[1]
			name = string(sig.args[1])

			for prefix in keys(prefix_ops)
				if startswith(name, prefix)
					ops = get(prefix_ops, prefix, [])
					found_methods = get!(prefix_found_ops, prefix, Set{String}())
					suffixes = filter((x) -> endswith(name, x), keys(memspec_suffixes))

					if isempty(suffixes) || isempty(ops)
						continue
					end

					suffix = first(suffixes)

					rest = replace(name, prefix, "")
					rest = replace(rest, suffix, "")

					op_erand = split(rest, "_", limit = 2)

					op = op_erand[1]
					operand = (length(op_erand) == 2) ? strip(op_erand[2],'_') : ""

					if haskey(ops, op)
						is_mutator, default_memspec = ops[op]

						method_name = op

						if operand != ""
							method_name *= "_" * operand
						end

						if is_mutator
							method_name *= "!"
						end

                        # println("$name -> $prefix / $op / $operand / $suffix -> $method_name") # debug

						# update method name
						sig.args[1] = symbol(method_name)

						if !in(method_name, found_methods)
							# upon encountering the first method of an op,
							# emit overload with default mem consistency
							union!(found_methods, [method_name])

							arg_specs = sig.args[2:end]

							default_impl = copy(exu)

							default_impl.args[2] =
							Expr(:block,
							Expr(:call, symbol(method_name), [a.args[1] for a in arg_specs]..., :(Val{$default_memspec}))
							)
							println(default_impl) #debug

							push!(obuf, default_impl)
						end

						# add memspec argument as the last one
						memspec_constant = memspec_suffixes[suffix]
						memspec_arg = :(::Type{Val{$memspec_constant}})

						push!(sig.args, memspec_arg)
					end
				end
			end
		end
	end
end

include("src/def.jl") # pull in type mappings

wc.rewriter = function(obuf)
    map_argtypes(obuf)
    map_memspec_funcs(obuf)

    return obuf
end

#wc.options = wrap_c.InternalOptions(true, false, true)

if !isinteractive()
    run(wc)
end
