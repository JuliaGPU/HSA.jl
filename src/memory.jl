export Region

typealias Region hsa_region_t

import Base.convert

convert(::Type{Uint64}, r::Region) = r.handle
convert(::Type{Region}, r::Uint64) = Region(r)

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

function memory_register(
	ptr,
	size)

	err = ccall((:hsa_memory_register, libhsa), hsa_status_t, (Ptr{Void}, Csize_t),
	ptr, size)

	test_status(err)
end

function memory_allocate(
	region,
	size)

	res = Ref{Ptr{Void}}(0)

	err = ccall((:hsa_memory_allocate, libhsa), hsa_status_t, (
	hsa_region_t,
	Csize_t,
	Ptr{Ptr{Void}}),
	region, size, res)

	test_status(err)

	return res.x
end
