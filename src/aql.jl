const PacketTypeAlwaysReserved =  convert(Uint8, HSA_PACKET_TYPE_ALWAYS_RESERVED)
const PacketTypeInvalid = convert(Uint8, HSA_PACKET_TYPE_INVALID)
const PacketTypeDispatch = convert(Uint8, HSA_PACKET_TYPE_DISPATCH)
const PacketTypeBarrier = convert(Uint8, HSA_PACKET_TYPE_BARRIER)
const PacketTypeAgentDispatch = convert(Uint8, HSA_PACKET_TYPE_AGENT_DISPATCH)

const FenceScopeNone = convert(Uint8, HSA_FENCE_SCOPE_NONE)
const FenceScopeComponent = convert(Uint8, HSA_FENCE_SCOPE_COMPONENT)
const FenceScopeSystem = convert(Uint8, HSA_FENCE_SCOPE_SYSTEM)


type PacketHeader
    typ :: Uint8 # hsa_packet_type_t
    barrier :: Bool
    acquire_fence_scope :: Uint8 # hsa_fence_scope_t
    release_fence_scope :: Uint8 # hsa_fence_scope_t
end

function load(::Type{PacketHeader}, ptr :: Ptr{Void})
    if ptr == C_NULL
        error("invalid packet pointer")
    end

    h_ptr = convert(Ptr{Uint8}, ptr)

    h_type = unsafe_load(h_ptr)
    byte2 = unsafe_load(h_ptr + 1)
    h_barrier = (byte2 & 0x80) != 0x00
    h_acq_fen = (byte2 >> 5) & 0x03
    h_rel_fen = (byte2 >> 3) & 0x03

    return PacketHeader(h_type, h_barrier, h_acq_fen, h_rel_fen)
end

function store!(ptr :: Ptr{Void}, hdr :: PacketHeader)
    h_ptr = convert(Ptr{Uint8}, ptr)

    h_byte2 =
        ((hdr.barrier) ? 0x01 << 7 : 0x00) |
        hdr.acquire_fence_scope << 5 |
        hdr.release_fence_scope << 3
    unsafe_store!(h_ptr + 1, h_byte2)

    # set the type last, once the packet is complete
    unsafe_store!(h_ptr, hdr.typ)
end

abstract AQLPacket

type DispatchPacket <: AQLPacket
    header :: PacketHeader
    dimensions :: Uint16
    workgroup_size :: (Uint16, Uint16, Uint16)
    grid_size :: (Uint32, Uint32, Uint32)
    private_segment_size :: Uint32
    group_segment_size :: Uint32
    kernel_object_address :: Uint64
    kernarg_address :: Uint64
    completion_signal :: hsa_signal_t
end

function load(::Type{AQLPacket}, ptr :: Ptr{Void}, ::Type{Val{PacketTypeDispatch}}, p_hdr :: PacketHeader)
    if ptr == C_NULL
        error("invalid packet pointer")
    end

    p_dims = unsafe_load(convert(Ptr{Uint16}, ptr + 2)) >> 14
    p_wg_size = (
        unsafe_load(convert(Ptr{Uint16}, ptr + 4)),
        unsafe_load(convert(Ptr{Uint16}, ptr + 6)),
        unsafe_load(convert(Ptr{Uint16}, ptr + 8))
        )
    # Uint16 reserved
    p_gr_size = (
        unsafe_load(convert(Ptr{Uint32}, ptr + 12)),
        unsafe_load(convert(Ptr{Uint32}, ptr + 16)),
        unsafe_load(convert(Ptr{Uint32}, ptr + 20))
        )
    p_pseg_size = unsafe_load(convert(Ptr{Uint32}, ptr + 24))
    p_gseg_size = unsafe_load(convert(Ptr{Uint32}, ptr + 28))
    p_kobj_addr = unsafe_load(convert(Ptr{Uint64}, ptr + 32))
    p_karg_addr = unsafe_load(convert(Ptr{Uint64}, ptr + 40))
    # Uint64 reserved
    p_comp_sign = unsafe_load(convert(Ptr{hsa_signal_t}, ptr + 56))

    return DispatchPacket(p_hdr, p_dims, p_wg_size, p_gr_size, p_pseg_size, p_gseg_size,
        p_kobj_addr, p_karg_addr, p_comp_sign)
end

function store!(ptr :: Ptr{Void}, dp :: DispatchPacket)
    unsafe_store!(convert(Ptr{Uint16}, ptr + 2), convert(Uint16, dp.dimensions) << 14)
    unsafe_store!(convert(Ptr{Uint16}, ptr + 4), dp.workgroup_size[1])
    unsafe_store!(convert(Ptr{Uint16}, ptr + 6), dp.workgroup_size[2])
    unsafe_store!(convert(Ptr{Uint16}, ptr + 8), dp.workgroup_size[3])
    unsafe_store!(convert(Ptr{Uint16}, ptr + 10), 0x0000)    # Uint16 reserved
    unsafe_store!(convert(Ptr{Uint32}, ptr + 12), dp.grid_size[1])
    unsafe_store!(convert(Ptr{Uint32}, ptr + 16), dp.grid_size[2])
    unsafe_store!(convert(Ptr{Uint32}, ptr + 20), dp.grid_size[3])
    unsafe_store!(convert(Ptr{Uint32}, ptr + 24), dp.private_segment_size)
    unsafe_store!(convert(Ptr{Uint32}, ptr + 28), dp.group_segment_size)
    unsafe_store!(convert(Ptr{Uint64}, ptr + 32), dp.kernel_object_address)
    unsafe_store!(convert(Ptr{Uint64}, ptr + 40), dp.kernarg_address)
    unsafe_store!(convert(Ptr{Uint64}, ptr + 48), 0x00)    # Uint64 reserved
    unsafe_store!(convert(Ptr{Uint64}, ptr + 56), dp.completion_signal)

    store!(ptr, dp.header)
end

type AgentDispatchPacket <: AQLPacket
    header :: PacketHeader
    typ :: Uint16
    return_address :: Uint64
    arg :: Array{Uint64, 1}
    completion_signal :: Signal
end

type BarrierPacket <: AQLPacket
    header :: PacketHeader
    const dep_signal = Array(Signal, 5)
    completion_signal :: Signal
end

function load(::Type{AQLPacket}, ptr :: Ptr{Void})
    hdr = load(PacketHeader, ptr)

    packet = load(AQLPacket, ptr, Val{hdr.typ}, hdr)

    return packet
end
