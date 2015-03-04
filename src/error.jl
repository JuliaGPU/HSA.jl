export HSAError

type HSAError <: Exception
    status::hsa_status_t
end

function show(io::IO, e::HSAError)
	local message
	try
	    message = status_string(e.status)
	catch ex
		message = sprint(show, ex)
	end

	print(io, typeof(e), "(", e.status, ") ", message)
end

function test_status(status::hsa_status_t)
	if status & HSA_STATUS_ERROR == HSA_STATUS_ERROR
        throw(HSAError(status))
    end
end
