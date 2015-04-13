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
