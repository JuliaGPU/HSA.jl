function map_constants(obuf)
	function getCustomType(camelName)
		const custom_type = [
			( r"PacketType*", :Uint8 )
		]

		match_idx = findfirst(x -> ismatch(x[1], camelName), custom_type)

		if match_idx > 0
			return custom_type[match_idx][2]
		else
			return nothing
		end
	end

    function toCamel(str)
		stream = IOBuffer()

        bumps = [string(bump) for bump in split(str, '_')]

		for bump in bumps
			print(stream, bump[1])
			print(stream, lowercase(bump[2:end]))
		end

		return takebuf_string(stream)
	end

	push!(obuf,	"
# Convenience Constants
# with HSA_ prefix removed and
# in CamelCase
	")

	for exu in obuf
		if isa(exu, Expr) && exu.head == :const && length(exu.args) >= 1
			assign = exu.args[1]

			if isa(assign, Expr) && assign.head == :(=)
				name_sym = assign.args[1]
                name = string(name_sym)

				# is a HSA_* constant? -> add a camelcase version without prefix
				if startswith(name, "HSA_") && isupper(replace(name, '_', ""))
					shortName = replace(name, "HSA_", "")
                    camelName = toCamel(shortName)
					camelName_sym = symbol(camelName)

					customType = getCustomType(camelName)
					if customType == nothing
						push!(obuf, :(const $camelName_sym = $name_sym))
					else
						push!(obuf, :(const $camelName_sym = $customType($name_sym)))
					end
				end
			end
		end
	end
end
