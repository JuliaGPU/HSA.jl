using HSA
using FactCheck

facts("AQL Packets") do
    # Little Endian!
    dispatch_bytes = Uint8[
        HSA.PacketTypeKernelDispatch,
        (0x01 << 0) | # Barrier Bit
        (HSA.FenceScopeAgent << 1) | # Acquire Scope
        (HSA.FenceScopeSystem << 3), # Release Scope
        # Dispatch Packet
        0x03, 0x00, # setup (dimensions)
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
    dispatch_ptr = convert(Ptr{Void}, pointer(dispatch_bytes))

    dispatch_1d_bytes = copy(dispatch_bytes)
    dispatch_1d_bytes[3] = 0x01
    dispatch_1d_bytes[7] = 0x01
    dispatch_1d_bytes[9] = 0x01

    dispatch_1d_ptr = convert(Ptr{Void}, pointer(dispatch_1d_bytes))

    agent_bytes = Uint8[
        HSA.PacketTypeAgentDispatch,
        (0x00 << 0) | # Barrier Bit
        (HSA.FenceScopeNone << 1) | # Acquire Scope
        (HSA.FenceScopeNone << 3), # Release Scope
        # Agent Dispatch Packet
        0xFF, 0xFF, # type
        0x00, 0x00, 0x00, 0x00, # reserved
        0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # return_address
        0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # arg1
        0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # arg2
        0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # arg3
        0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # arg4
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # reserved
        0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # completion_signal
    ]
    agent_ptr = convert(Ptr{Void}, pointer(agent_bytes))

    barrier_bytes = Uint8[
        HSA.PacketTypeBarrierAnd,
        (0x00 << 0) | # Barrier Bit
        (HSA.FenceScopeNone << 1) | # Acquire Scope
        (HSA.FenceScopeNone << 3), # Release Scope
        # Barrier Packet
        0x00, 0x00, # Uint16 reserved
        0x00, 0x00, 0x00, 0x00, # Uint32 reserved
        0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # dep1
        0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # dep2
        0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # dep3
        0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # dep4
        0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # dep5
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # reserved
        0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, # completion_signal
    ]
    barrier_ptr = convert(Ptr{Void}, pointer(barrier_bytes))

    context("PacketHeader") do
        context("can be loaded") do
            header = HSA.unsafe_convert(HSA.PacketHeader, dispatch_ptr)
            @fact header.typ --> HSA.PacketTypeKernelDispatch
            @fact header.barrier --> true
            @fact header.acquire_fence_scope --> HSA.FenceScopeAgent
            @fact header.release_fence_scope --> HSA.FenceScopeSystem
        end

        context("can be stored") do
            hdr_bytes = Array(Uint8, 2)
            hdr_ptr = convert(Ptr{Void}, pointer(hdr_bytes))

            hdr = HSA.unsafe_convert(HSA.PacketHeader, dispatch_ptr)
            HSA.unsafe_store!(hdr_ptr, hdr)

            @fact hdr_bytes --> dispatch_bytes[1:2]
        end

        context("can be created in various ways") do
            ph1 = HSA.PacketHeader(
                1, # type
                barrier = true,
                acquire = HSA.FenceScopeSystem,
                release = HSA.FenceScopeNone
            )

            @fact ph1.typ --> 1
            @fact ph1.barrier --> true
            @fact ph1.acquire_fence_scope --> HSA.FenceScopeSystem
            @fact ph1.release_fence_scope --> HSA.FenceScopeNone

            ph2 = HSA.PacketHeader(
                HSA.PacketTypeInvalid
            )

            @fact ph2.typ --> HSA.PacketTypeInvalid
            @fact ph2.barrier --> false
            @fact ph2.acquire_fence_scope --> HSA.FenceScopeNone
            @fact ph2.release_fence_scope --> HSA.FenceScopeNone
        end

        context("Can be copied") do
            hdr1 = PacketHeader(HSA.PacketTypeInvalid)

            hdr2 = copy(hdr1)

            @fact hdr1 --> hdr2
            @fact object_id(hdr1) --> not(object_id(hdr2))
        end

        context("Can be compared for equality") do
            h1 = PacketHeader(HSA.PacketTypeKernelDispatch)
            h2 = PacketHeader(HSA.PacketTypeKernelDispatch)

            @fact isequal(h1, h2) --> true
        end
    end

    context("VendorPackets") do


    end

    context("InvalidPackets") do
        in_disp_bytes = copy(dispatch_bytes)
        in_disp_bytes[1] = HSA.PacketTypeInvalid
        in_disp_ptr = convert(Ptr{Void}, pointer(in_disp_bytes))

        context("Can be loaded") do
            p = HSA.unsafe_convert(HSA.AQLPacket, in_disp_ptr)

            @fact isa(p, InvalidPacket) --> true
            @fact p.bytes --> in_disp_bytes
        end

        context("Can be reinterpreted as a KernelDispatchPacket") do
            p = HSA.unsafe_convert(HSA.AQLPacket, in_disp_ptr)
            id = convert(KernelDispatchPacket, p)

            @fact id.header.typ --> HSA.PacketTypeInvalid
        end
    end

    context("KernelDispatchPackets") do
        context("can be loaded") do
            dp = HSA.unsafe_convert(HSA.AQLPacket, dispatch_ptr)

            @fact isa(dp, HSA.KernelDispatchPacket) --> true

            @fact dp.header.typ --> HSA.PacketTypeKernelDispatch
            @fact dp.header.barrier --> true
            @fact dp.header.acquire_fence_scope --> HSA.FenceScopeAgent
            @fact dp.header.release_fence_scope --> HSA.FenceScopeSystem

            @fact dp.dimensions --> 0x0003
            @fact dp.workgroup_size_x --> 0x000A
            @fact dp.workgroup_size_y --> 0x0009
            @fact dp.workgroup_size_z --> 0x0008
            @fact dp.grid_size_x --> 0x00000014
            @fact dp.grid_size_y --> 0x00000012
            @fact dp.grid_size_z --> 0x00000010
            @fact dp.private_segment_size --> 0x00000020
            @fact dp.group_segment_size --> 0x00000030
            @fact dp.kernel_object --> 0x0000000000000001
            @fact dp.kernarg_address --> 0x0000000000000002
            @fact dp.completion_signal.handle --> 0x0000000000000010

            dp1d = HSA.unsafe_convert(HSA.AQLPacket, dispatch_1d_ptr)
            @fact dp1d.dimensions --> 0x0001
        end

        context("can be stored") do
            pkt_bytes = Array(Uint8, 64)
            pkt_ptr = convert(Ptr{Void}, pointer(pkt_bytes))

            dp = HSA.unsafe_convert(HSA.AQLPacket, dispatch_ptr)
            HSA.unsafe_store!(pkt_ptr, dp)

            @fact pkt_bytes --> dispatch_bytes
        end

        context("can be created in various ways") do
            @fact_throws HSA.KernelDispatchPacket(0)
            @fact_throws HSA.KernelDispatchPacket(4, 1,2,3,4,5,6,7,8)

            dp1 = HSA.KernelDispatchPacket(1,2)
            @fact dp1.dimensions --> 1
            @fact dp1.workgroup_size_x --> 1
            @fact dp1.workgroup_size_y --> 1
            @fact dp1.workgroup_size_z --> 1
            @fact dp1.grid_size_x --> 2
            @fact dp1.grid_size_y --> 1
            @fact dp1.grid_size_z --> 1
            @fact dp1.private_segment_size --> 0
            @fact dp1.group_segment_size --> 0
            @fact dp1.kernel_object --> 0
            @fact dp1.kernarg_address --> 0
            @fact dp1.completion_signal.handle --> 0
        end
    end

    context("AgentDispatchPackets") do
        context("can be loaded") do
            ad = HSA.unsafe_convert(HSA.AQLPacket, agent_ptr)

            @fact isa(ad, HSA.AgentDispatchPacket) --> true

            @fact ad.header.typ --> HSA.PacketTypeAgentDispatch
            @fact ad.header.barrier --> false
            @fact ad.header.acquire_fence_scope --> HSA.FenceScopeNone
            @fact ad.header.release_fence_scope --> HSA.FenceScopeNone

            @fact ad.typ --> 0xFFFF
            @fact ad.return_address --> 0x0000000000000002
            @fact ad.arg[1] --> 0x0000000000000003
            @fact ad.arg[2] --> 0x0000000000000004
            @fact ad.arg[3] --> 0x0000000000000001
            @fact ad.arg[4] --> 0x0000000000000002
            @fact ad.completion_signal.handle --> 0x0000000000000100
        end

        context("can be stored") do
            pkt_bytes = Array(Uint8, 64)
            pkt_ptr = convert(Ptr{Void}, pointer(pkt_bytes))

            ad = HSA.unsafe_convert(HSA.AQLPacket, agent_ptr)
            HSA.unsafe_store!(pkt_ptr, ad)

            @fact pkt_bytes --> agent_bytes
        end
    end

    context("BarrierPacket") do
        context("can be loaded") do
            bp = HSA.unsafe_convert(HSA.AQLPacket, barrier_ptr)

            @fact isa(bp, HSA.BarrierPacket) --> true

            @fact bp.header.typ --> HSA.PacketTypeBarrierAnd

            @fact bp.dep_signal[1] --> 0x0000000000000001
            @fact bp.dep_signal[2] --> 0x0000000000000002
            @fact bp.dep_signal[3] --> 0x0000000000000003
            @fact bp.dep_signal[4] --> 0x0000000000000004
            @fact bp.dep_signal[5] --> 0x0000000000000005
            @fact bp.completion_signal.handle --> 0x0000000000000100
        end

        context("can be stored") do
            pkt_bytes = Array(Uint8, 64)
            pkt_ptr = convert(Ptr{Void}, pointer(pkt_bytes))

            b = HSA.unsafe_convert(HSA.AQLPacket, barrier_ptr)
            HSA.unsafe_store!(pkt_ptr, b)

            @fact pkt_bytes --> barrier_bytes
        end
    end

    context("Can be compared for equality") do
        p1 = HSA.unsafe_convert(HSA.AQLPacket, dispatch_ptr)
        p2 = HSA.unsafe_convert(HSA.AQLPacket, dispatch_ptr)

        @fact p1 == p2 --> true
    end

end
