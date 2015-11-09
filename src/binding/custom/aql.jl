export PacketHeader

type PacketHeader
    typ :: UInt8 # hsa_packet_type_t
    barrier :: Bool
    acquire_fence_scope :: UInt8 # hsa_fence_scope_t
    release_fence_scope :: UInt8 # hsa_fence_scope_t
end

function PacketHeader(typ;
    barrier::Bool = false,
    acquire = FenceScopeNone,
    release = FenceScopeNone
    )
    typ = convert(UInt8, typ)
    acquire = convert(UInt8, acquire)
    release = convert(UInt8, release)

    return PacketHeader(typ, barrier, acquire, release)
end

import Base.==

function ==(h1 :: PacketHeader, h2 :: PacketHeader)
    return h1.typ == h2.typ &&
        h1.barrier == h2.barrier &&
        h1.acquire_fence_scope == h2.acquire_fence_scope &&
        h1.release_fence_scope == h2.release_fence_scope
end

import Base.unsafe_convert

function unsafe_convert(::Type{PacketHeader}, ptr :: Ptr{Void})
    if ptr == C_NULL
        error("invalid packet pointer")
    end

    h_ptr = convert(Ptr{UInt8}, ptr)

    h_type = unsafe_load(h_ptr)
    byte2 = unsafe_load(h_ptr + 1)
    h_barrier = (byte2 & 0x01) != 0x00
    h_acq_fen = (byte2 >> 1) & 0x03
    h_rel_fen = (byte2 >> 3) & 0x03

    return PacketHeader(h_type, h_barrier, h_acq_fen, h_rel_fen)
end

import Base.unsafe_store!

function unsafe_store!(ptr :: Ptr{Void}, hdr :: PacketHeader)
    h_ptr = convert(Ptr{UInt8}, ptr)

    h_byte2 =
        ((hdr.barrier) ? 0x01 : 0x00) |
        hdr.acquire_fence_scope << 1 |
        hdr.release_fence_scope << 3
    unsafe_store!(h_ptr + 1, h_byte2)

    # set the type last, once the packet is complete
    unsafe_store!(h_ptr, hdr.typ)
end

import Base.copy

function copy(hdr :: PacketHeader)
    return PacketHeader(hdr.typ, hdr.barrier, hdr.acquire_fence_scope, hdr.release_fence_scope)
end

abstract AQLPacket

import Base.==

function ==(p1 :: AQLPacket, p2 :: AQLPacket)
    bytes1 = Array(UInt8, 64)
    bytes2 = Array(UInt8, 64)
    bytes1_ptr = convert(Ptr{Void}, pointer(bytes1))
    bytes2_ptr = convert(Ptr{Void}, pointer(bytes2))

    unsafe_store!(bytes1_ptr, p1)
    unsafe_store!(bytes2_ptr, p2)

    return bytes1 == bytes2
end

export KernelDispatchPacket

type KernelDispatchPacket <: AQLPacket
    header :: PacketHeader
    dimensions :: UInt16
    workgroup_size_x :: UInt16
    workgroup_size_y :: UInt16
    workgroup_size_z :: UInt16
    grid_size_x :: UInt32
    grid_size_y :: UInt32
    grid_size_z :: UInt32
    private_segment_size :: UInt32
    group_segment_size :: UInt32
    kernel_object :: UInt64
    kernarg_address :: Ptr{Void}
    completion_signal :: hsa_signal_t

    function KernelDispatchPacket(
        kernel_object,
        range;
        dimensions = 0,
        wg_size = nothing,
        kernarg_address = 0,
        header :: PacketHeader = PacketHeader(
                PacketTypeKernelDispatch,
                barrier = false,
                # acquire
                # release
            ),
        private_segment_size = 0,
        group_segment_size = 0,
        completion_signal = hsa_signal_t(0)
        )

        grid_size = [1,1,1]
        wg_size_3d = [1,1,1]

        if dimensions == 0
            if isa(range, Tuple)
                dimensions = length(range)
            else
                dimensions = 1
            end
        end

        if dimensions < 1 || dimensions > 3
            error("range dimensions out of range, expected 1-3, got $dimensions")
        end

        if isa(range, Tuple)
            if length(range) < dimensions
                error("too few workgroup dimensions specified")
            end

            for i = 1:dimensions
                grid_size[i] = range[i]
            end
        else
            grid_size[1] = range
        end

        if wg_size != nothing
            if isa(wg_size, Tuple)
                if length(wg_size) < dimensions
                    error("too few workgroup dimensions specified")
                end
                for i = 1:dimensions
                    wg_size_3d[i] = wg_size[i]
                end
            else
                if 1 < dimensions
                    error("too few workgroup dimensions specified")
                end
                wg_size_3d[1] = wg_size
            end
        end

        return new(
            header,
            dimensions, # dimensions
            wg_size_3d[1],
            wg_size_3d[2],
            wg_size_3d[3],
            grid_size[1],
            grid_size[2],
            grid_size[3],
            private_segment_size, # private_segment_size
            group_segment_size, # group_segment_size
            kernel_object, # kernel_object
            kernarg_address, # kernarg_address
            completion_signal, # completion_signal
        )
    end
end

function load(::Type{AQLPacket}, ::Type{Val{PacketTypeKernelDispatch}}, ptr :: Ptr{Void}, p_hdr :: PacketHeader)
    if ptr == C_NULL
        error("invalid packet pointer")
    end

    p_dims = unsafe_load(convert(Ptr{UInt16}, ptr + 2)) & 0x03
    p_wg_x = unsafe_load(convert(Ptr{UInt16}, ptr + 4))
    p_wg_y = unsafe_load(convert(Ptr{UInt16}, ptr + 6))
    p_wg_z = unsafe_load(convert(Ptr{UInt16}, ptr + 8))
    # UInt16 reserved
    p_gr_x = unsafe_load(convert(Ptr{UInt32}, ptr + 12))
    p_gr_y = unsafe_load(convert(Ptr{UInt32}, ptr + 16))
    p_gr_z = unsafe_load(convert(Ptr{UInt32}, ptr + 20))

    p_pseg_size = unsafe_load(convert(Ptr{UInt32}, ptr + 24))
    p_gseg_size = unsafe_load(convert(Ptr{UInt32}, ptr + 28))
    p_kobj_addr = unsafe_load(convert(Ptr{UInt64}, ptr + 32))
    p_karg_addr = unsafe_load(convert(Ptr{UInt64}, ptr + 40))
    # UInt64 reserved
    p_comp_sign = unsafe_load(convert(Ptr{hsa_signal_t}, ptr + 56))

    res = KernelDispatchPacket(
        p_kobj_addr,
        (p_gr_x, p_gr_y, p_gr_z),
        wg_size = (p_wg_x, p_wg_y, p_wg_z),
        dimensions = p_dims,
        header = p_hdr,
        private_segment_size = p_pseg_size,
        group_segment_size = p_gseg_size,
        completion_signal = p_comp_sign
        )
    res.kernarg_address = p_karg_addr

    return res
end

function unsafe_store!(ptr :: Ptr{Void}, dp :: KernelDispatchPacket)
    if dp.header.typ != PacketTypeKernelDispatch
        error("not a dispatch packet")
    end

    unsafe_store!(convert(Ptr{UInt16}, ptr + 2), convert(UInt16, dp.dimensions)) # setup
    unsafe_store!(convert(Ptr{UInt16}, ptr + 4), dp.workgroup_size_x)
    unsafe_store!(convert(Ptr{UInt16}, ptr + 6), dp.workgroup_size_y)
    unsafe_store!(convert(Ptr{UInt16}, ptr + 8), dp.workgroup_size_z)
    unsafe_store!(convert(Ptr{UInt16}, ptr + 10), 0x0000)    # UInt16 reserved
    unsafe_store!(convert(Ptr{UInt32}, ptr + 12), dp.grid_size_x)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 16), dp.grid_size_y)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 20), dp.grid_size_z)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 24), dp.private_segment_size)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 28), dp.group_segment_size)
    unsafe_store!(convert(Ptr{UInt64}, ptr + 32), dp.kernel_object)
    unsafe_store!(convert(Ptr{UInt64}, ptr + 40), dp.kernarg_address)
    unsafe_store!(convert(Ptr{UInt64}, ptr + 48), 0x00)    # UInt64 reserved
    unsafe_store!(convert(Ptr{UInt64}, ptr + 56), dp.completion_signal.handle)

    unsafe_store!(ptr, dp.header)
end

export AgentDispatchPacket

type AgentDispatchPacket <: AQLPacket
    header :: PacketHeader
    typ :: UInt16
    return_address :: UInt64
    arg :: Array{UInt64, 1}
    completion_signal :: hsa_signal_t

    function AgentDispatchPacket(typ;
        return_address = 0,
        header :: PacketHeader = PacketHeader(PacketTypeAgentDispatch),
        args :: Array{UInt64,1} = Array(UInt64, 4),
        completion_signal = hsa_signal_t(0)
        )

        assert(header.typ == PacketTypeAgentDispatch)
        assert(length(args) == 4)

        new(
            header,
            typ,
            return_address,
            args,
            completion_signal
        )
    end
end

function load(::Type{AQLPacket}, ::Type{Val{PacketTypeAgentDispatch}}, ptr :: Ptr{Void}, p_hdr :: PacketHeader)
    p_type = unsafe_load(convert(Ptr{UInt16}, ptr + 2))
    # UInt32 reserved
    p_retu = unsafe_load(convert(Ptr{UInt64}, ptr + 8))
    p_arg1 = unsafe_load(convert(Ptr{UInt64}, ptr + 16))
    p_arg2 = unsafe_load(convert(Ptr{UInt64}, ptr + 24))
    p_arg3 = unsafe_load(convert(Ptr{UInt64}, ptr + 32))
    p_arg4 = unsafe_load(convert(Ptr{UInt64}, ptr + 40))
    # UInt64 reserved
    p_comp = unsafe_load(convert(Ptr{UInt64}, ptr + 56))

    return AgentDispatchPacket(p_type;
        header = p_hdr,
        return_address = p_retu,
        args = UInt64[p_arg1, p_arg2, p_arg3, p_arg4],
        completion_signal = hsa_signal_t(p_comp))
end

function unsafe_store!(ptr :: Ptr{Void}, ad :: AgentDispatchPacket)
    unsafe_store!(convert(Ptr{UInt16}, ptr + 2), ad.typ)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 4), 0x00000000) # UInt32 reserved
    unsafe_store!(convert(Ptr{UInt64}, ptr + 8), ad.return_address)
    unsafe_copy!(
        convert(Ptr{UInt64}, ptr + 16),
        convert(Ptr{UInt64}, pointer(ad.arg)),
        8 # Bytes
        )
    unsafe_store!(convert(Ptr{UInt64}, ptr + 48), 0x0000000000000000)    # UInt64 reserved
    unsafe_store!(convert(Ptr{UInt64}, ptr + 56), ad.completion_signal.handle)

    unsafe_store!(ptr, ad.header)
end

export BarrierPacket

type BarrierPacket <: AQLPacket
    header :: PacketHeader
    is_or :: Bool
    dep_signal :: Array{UInt64, 1}
    completion_signal :: hsa_signal_t
end

function load(::Type{AQLPacket}, ::Type{Val{PacketTypeBarrierAnd}}, ptr :: Ptr{Void}, p_hdr :: PacketHeader)
    p_dep = Array(UInt64, 5)
    p_dep_ptr = convert(Ptr{UInt64}, pointer(p_dep))

    unsafe_copy!(p_dep_ptr, convert(Ptr{UInt64}, ptr + 8), 5)
    p_comp = unsafe_load(convert(Ptr{UInt64}, ptr + 56))

    return BarrierPacket(p_hdr, false, p_dep, p_comp)
end

function unsafe_store!(ptr :: Ptr{Void}, bp :: BarrierPacket)
    p_dep_ptr = convert(Ptr{UInt64}, pointer(bp.dep_signal))

    unsafe_store!(convert(Ptr{UInt16}, ptr + 2), 0)
    unsafe_store!(convert(Ptr{UInt32}, ptr + 4), 0)
    unsafe_copy!(
        convert(Ptr{UInt64}, ptr + 8),
        p_dep_ptr,
        5
    )
    unsafe_store!(convert(Ptr{UInt64}, ptr + 48), 0)
    unsafe_store!(convert(Ptr{UInt64}, ptr + 56), bp.completion_signal)

    unsafe_store!(ptr, bp.header)
end

export InvalidPacket

type InvalidPacket
    header :: PacketHeader
    bytes :: Array{UInt8, 1}

    function InvalidPacket(hdr, bytes)
        @assert hdr.typ == HSA.PacketTypeInvalid
        @assert length(bytes) == 64

        return new(hdr, bytes)
    end
end

function load(::Type{AQLPacket}, ::Type{Val{PacketTypeInvalid}}, ptr :: Ptr{Void}, p_hdr :: PacketHeader)
    bytes = Array(UInt8, 64)

    unsafe_copy!(pointer(bytes), convert(Ptr{UInt8}, ptr), 64)

    return InvalidPacket(p_hdr, bytes)
end

function convert(::Type{KernelDispatchPacket}, p :: InvalidPacket)
    ptr = convert(Ptr{Void}, pointer(p.bytes))
    return load(AQLPacket, Val{PacketTypeKernelDispatch}, ptr, p.header)
end

function unsafe_convert(::Type{AQLPacket}, ptr :: Ptr{Void})
    hdr = unsafe_convert(PacketHeader, ptr)

    packet = load(AQLPacket, Val{hdr.typ}, ptr, hdr)

    return packet
end
