module Execution

using ..HSA

export @hsa
macro hsa(range, call)
    if call.head != :call
        error("the second argument of @hsa must be a function call")
    end

    :(run_cpu($range, $(call...)))
end

end
