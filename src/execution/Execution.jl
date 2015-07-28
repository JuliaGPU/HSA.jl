module Execution

export @hsa

using ..HSA

type Defaults
	agent
	kernel_cache
end

function init_execution_context()
	if !isnull(CTX)
		return
	end

	# perform initialization
	CTX
end

macro hsa(range, call)
	# support plain integer for 1D ranges
	if isa(range, Integer)
		range = :(($range,))
	end

	if range.head != :tuple
		error("The first argument must be the range for the kernel as an integer (1D) or tuple")
	end

	if call.head != :call
		error("The second argument must be a simple call to a kernel function")
	end

	return quote
		error("not implemented")
	end
end

end
