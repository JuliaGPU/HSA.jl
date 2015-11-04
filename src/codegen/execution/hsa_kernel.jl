function hsa_kernel(fun::Expr)
    device_fun = copy(fun)

    HSA.Emulation.visit_ast(scope_builtins, device_fun)

    return quote
        @target hsail $(device_fun)
    end
end

function scope_builtins(ex)
    if isa(ex, Expr) && ex.head == :call
        fname = ex.args[1]

        if HSA.Builtins.is_builtin(fname)
            # qualify the call to the Builtins module
            ex.args[1] = :(HSA.Builtins.$fname)
        end
    end
end
