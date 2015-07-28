typealias DeviceArray Ptr

import Base.getindex
@inline getindex{T}(a::DeviceArray{T}, i0::Real) =
    Base.unsafe_load(a, Base.to_index(i0))::T
import Base.setindex!
@inline setindex!{T}(a::DeviceArray{T}, x::T, i0::Real) =
    Base.unsafe_store!(a, x, Base.to_index(i0))
