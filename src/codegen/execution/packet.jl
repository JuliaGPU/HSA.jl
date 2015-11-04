export build_dispatch
function build_dispatch(range, kernel_info, karg_memory, signal)
    debug_print("build_dispatch: Building $range KernelDispatchPacket for $(string(kernel_info.func))($(join(kernel_info.argtypes,',')))")
    dispatch_packet = KernelDispatchPacket(
        kernel_info.kernel_object,
        range)
    dispatch_packet.header.acquire_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
    dispatch_packet.header.release_fence_scope = HSA.HSA_FENCE_SCOPE_SYSTEM
    dispatch_packet.completion_signal = signal
    dispatch_packet.kernarg_address = karg_memory.ptr
    dispatch_packet.private_segment_size = kernel_info.private_size
    dispatch_packet.group_segment_size = kernel_info.group_size

    return dispatch_packet
end

