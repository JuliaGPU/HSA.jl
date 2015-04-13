export Region

type Region
	handle :: hsa_region_t
end

import Base.convert

convert(::Type{hsa_region_t}, r::Region) = r.handle

import Base.==

(==)(a::Region, b::Region) = a.handle == b.handle

import Base.hash

hash(r::Region) = r.handle

const iterate_regions_cb_ptr = cfunction(iterate_cb, hsa_status_t, (hsa_region_t, Ptr{Void}))

function iterate_regions(a :: Agent, callback :: Function)
	state = IterState(
	    function(x::hsa_region_t)
			r = Region(x)
			callback(r)
		end)

	state_ptr = pointer_from_objref(state)

	err = ccall((:hsa_agent_iterate_regions, libhsa), hsa_status_t, (hsa_agent_t, Ptr{Void}, Ptr{Void}),
	            a, iterate_regions_cb_ptr, state_ptr)

	if !isnull(state.err)
		rethrow(state.err.value)
	end

	test_status(err)
end

function regions(a :: Agent)
	reg = Array(Region, 0)

	iterate_regions(a,
	    function(r)
			push!(reg, r)
		end)

	return reg
end
