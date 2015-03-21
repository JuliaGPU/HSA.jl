using HSA
using FactCheck

facts("AQL Packets") do
    # Little Endian!
    dispatch_bytes = Uint8[
        HSA.PacketTypeDispatch,
        (0x01 << 7) | # Barrier Bit
        (HSA.FenceScopeComponent << 5) | # Acquire Scope
        (HSA.FenceScopeSystem << 3), # Release Scope
        # Dispatch Packet
        0x00, (0x03 << 6), # Dimensions - Reserved
        0x0A, 0x00, # wg_s_x
        0x09, 0x00, # wg_s_y
        0x08, 0x00, # wg_s_z
        0x00, 0x00, # reserved
        0x14, 0x00, 0x00, 0x00, # gr_s_x
        0x12, 0x00, 0x00, 0x00, # gr_s_y
        0x10, 0x00, 0x00, 0x00, # gr_s_z
        0x20, 0x00, 0x00, 0x00, # pr_seg_size
        0x30, 0x00, 0x00, 0x00, # gr_seg_size
        0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # kern_obj_addr
        0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # kern_arg_addr
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # reserved
        0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # completion_signal
    ]
    dispatch_ptr = convert(Ptr{Void}, dispatch_bytes)

    context("PacketHeader") do
        context("can be loaded") do
            header = HSA.load(HSA.PacketHeader, dispatch_ptr)
            @fact header.typ => HSA.PacketTypeDispatch
            @fact header.barrier => true
            @fact header.acquire_fence_scope => HSA.FenceScopeComponent
            @fact header.release_fence_scope => HSA.FenceScopeSystem
        end

        context("can be stored") do
            hdr_bytes = Array(Uint8, 2)
            hdr_ptr = convert(Ptr{Void}, hdr_bytes)

            hdr = HSA.load(HSA.PacketHeader, dispatch_ptr)
            HSA.store!(hdr_ptr, hdr)

            @fact hdr_bytes => dispatch_bytes[1:2]
        end
    end

    context("DispatchPackets") do
        context("can be loaded") do
            dp = HSA.load(HSA.AQLPacket, dispatch_ptr)

            @fact isa(dp, HSA.DispatchPacket) => true

            @fact dp.header.typ => HSA.PacketTypeDispatch
            @fact dp.header.barrier => true
            @fact dp.header.acquire_fence_scope => HSA.FenceScopeComponent
            @fact dp.header.release_fence_scope => HSA.FenceScopeSystem

            @fact dp.dimensions => 0x0003
            @fact dp.workgroup_size => (0x000A, 0x0009, 0x0008)
            @fact dp.grid_size => (0x00000014, 0x00000012, 0x00000010)
            @fact dp.private_segment_size => 0x00000020
            @fact dp.group_segment_size => 0x00000030
            @fact dp.kernel_object_address => 0x0000000000000001
            @fact dp.kernarg_address => 0x0000000000000002
            @fact dp.completion_signal => 0x0000000000000010
        end

        context("can be stored") do
            pkt_bytes = Array(Uint8, 64)
            pkt_ptr = convert(Ptr{Void}, pkt_bytes)

            dp = HSA.load(HSA.AQLPacket, dispatch_ptr)
            HSA.store!(pkt_ptr, dp)

            @fact pkt_bytes => dispatch_bytes
        end
    end

end
