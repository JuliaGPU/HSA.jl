export @use
# improvised using statement for julia
macro use(init :: Expr, block)
    if init.head != :(=)
        error("first argument must be an assignment")
    end

    var = init.args[1] :: Symbol

    return quote
        local $(esc(var))
        try
            $(esc(init))
            $(esc(block))
        finally
            Base.finalize($(esc(var)))
            $(esc(var)) = nothing
        end
    end
end

export @dbgmacro

macro dbgmacro(block)
    expanded = macroexpand(block)
    println(expanded)
    return esc(expanded)
end
