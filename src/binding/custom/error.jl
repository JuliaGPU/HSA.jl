export HSAError

type HSAError <: Exception
    status::hsa_status_t
end

import Base.show

function show(io::IO, e::HSAError)
    local message
    try
        message = status_string(e.status)
    catch ex
        message = sprint(show, ex)
    end

    print(io, typeof(e), "(", e.status, ") ", message)
end

status_string(status) = status_string(convert(hsa_status_t, status))

function test_status(status; warn_only :: Bool = false)
    status = convert(hsa_status_t, status)
    return test_status(status, warn_only)
end
function test_status(status::hsa_status_t; warn_only :: Bool = false)
    error = status & HSA_STATUS_ERROR == HSA_STATUS_ERROR

    if error
        ex = HSAError(status)
        if warn_only
            warn(ex)
        else
            throw(ex)
        end
    end

    return !error
end
