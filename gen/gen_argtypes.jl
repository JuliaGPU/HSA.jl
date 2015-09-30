"Maps some argument types from hsa_*_t to special wrapper types in the julia API"
function map_argtypes(obuf)
    for exu in obuf
        if isa(exu, Expr) && exu.head == :function
            # Go through all generated functions and extract

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
