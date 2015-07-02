immutable DeviceArray{T} <: AbstractArray
    ptr::Ptr{T}
end

getindex{T}(a::DeviceArray{T}, i0::Real) =
    unsafe_load(a.ptr, Base.to_index(i0))::T
setindex!{T}(a::DeviceArray{T}, x::T, i0::Real) =
    unsafe_store!(a.ptr, x, Base.to_index(i0))
