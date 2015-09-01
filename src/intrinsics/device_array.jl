export DeviceArray, data, flags, nrows

type DeviceArray{T}
	data::Ptr{T}
	length::Uint
	flags::Cushort
	elsize::Uint16
	offset::Uint32
	nrows::Uint
	ncols::Uint
	nz::Uint
end

data{T}(arr::Ptr{DeviceArray{T}}) = Base.unsafe_load(convert(Ptr{Ptr{T}}, arr),1)

import Base.length
length{T}(arr::Ptr{DeviceArray{T}}) =
	Base.unsafe_load(convert(Ptr{Uint}, arr + sizeof(Ptr{T})), 1)

flags{T}(arr::Ptr{DeviceArray{T}}) =
	Base.unsafe_load(
	convert(
		Ptr{Cushort}, arr + sizeof(Ptr{T}) + sizeof(Uint)
	), 1)

function dims{T}(arr::Ptr{DeviceArray{T}})
	f = flags(arr)
	ndims = (f >> 2) & 0x03FF
	return ndims
end

nrows{T}(arr::Ptr{DeviceArray{T}}) =
	Base.unsafe_load(
	convert(
		Ptr{Uint}, arr + sizeof(Ptr{T}) + sizeof(Uint) + 8
	), 1)


import Base.getindex
function getindex{T}(a::Ptr{DeviceArray{T}}, i0::Real)
	ptr = data(a)
	return Base.unsafe_load(ptr, Base.to_index(i0))::T
end

function getindex{T}(a::Ptr{DeviceArray{T}}, i1::Real, i0::Real)
	ptr = data(a)
	rows = nrows(a)
	return Base.unsafe_load(ptr, Base.to_index(i0 + i1 * rows))::T
end

import Base.setindex!
function setindex!{T}(a::Ptr{DeviceArray{T}}, x::T, i0::Real)
	ptr = data(a)
	Base.unsafe_store!(ptr, x, Base.to_index(i0))
end

function setindex{T}(a::Ptr{DeviceArray{T}}, i1::Real, i0::Real)
	ptr = data(a)
	rows = nrows(a)
	return Base.unsafe_store!(ptr, Base.to_index(i0 + i1 * rows))::T
end
