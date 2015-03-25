export SegmentGlobal, SegmentPrivate, SegmentGroup, SegmentKernArg,
       SegmentReadOnly, SegmentSpill, SegmentArg

const SegmentGlobal = HSA_SEGMENT_GLOBAL
const SegmentPrivate = HSA_SEGMENT_PRIVATE
const SegmentGroup = HSA_SEGMENT_GROUP
const SegmentKernArg = HSA_SEGMENT_KERNARG
const SegmentReadOnly = HSA_SEGMENT_READONLY
const SegmentSpill = HSA_SEGMENT_SPILL
const SegmentArg = HSA_SEGMENT_ARG

export Region

type Region
	handle :: Uint64
end

import Base.convert

convert(::Type{Uint64}, r::Region) = r.handle

const iterate_regions_cb_ptr = cfunction(iterate_cb, hsa_status_t, (hsa_region_t, Ptr{Void}))

function iterate_regions(a :: Agent, callback :: Function)
	state = IterState(
	    function(x)
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



getter(:hsa_region_get_info,
    (:region, :attribute, :value),
    (hsa_region_t, hsa_region_info_t, Ptr{Void}),
    Dict(
    :HSA_REGION_INFO_BASE => Ptr{Void},
    :HSA_REGION_INFO_SIZE => Csize_t,
    :HSA_REGION_INFO_AGENT => hsa_agent_t,
    :HSA_REGION_INFO_FLAGS => Uint32,
    :HSA_REGION_INFO_SEGMENT => hsa_segment_t,
    :HSA_REGION_INFO_ALLOC_MAX_SIZE => Csize_t,
    :HSA_REGION_INFO_ALLOC_GRANULE => Csize_t,
    :HSA_REGION_INFO_ALLOC_ALIGNMENT => Csize_t,
    :HSA_REGION_INFO_BANDWIDTH => Uint32,
    :HSA_REGION_INFO_NODE => Uint32,
    )
)

