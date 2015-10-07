using HSA.Intrinsics

@hsa_kernel function vcopy(a,b)
    idx = get_global_id(Int32(0)) + 1

    b[idx] = a[idx]
    return nothing
end

@hsa_kernel function vadd(a,b,c)
    i = get_global_id(Int32(0)) + 1
    c[i] = a[i] + b[i]
    return nothing
end

function plus(a,b)
    return a + b
end

@hsa_kernel function vadd_fun(a,b,c)
    i = get_global_id(Int32(0)) + 1
    c[i] = plus(a[i], b[i])
    return nothing
end

@hsa_kernel function mmul(a,b,c,acols)
    # one kernel invocation per column of the result matrix
    arows = get_global_size(Int32(0))
    # i = col
    i = get_global_id(Int32(0))
    # j = row
    for j = 1:arows
        c_ij = 0.0
        for k = 1:acols
            a_idx = (k-1) * arows + j
            b_idx = i * acols + k
            c_ij += a[a_idx] * b[b_idx]
        end

        c_idx = i * arows + j
        c[c_idx] = c_ij
    end
    return nothing
end

@hsa_kernel function mmul2d(a,b,c,acols)
    # one kernel invocation per cell of the result matrix
    arows = get_global_size(Int32(0))
    # i = col
    i = get_global_id(Int32(1))
    # j = row
    j = get_global_id(Int32(0)) + 1

    c_ij = 0.0
    for k = 1:acols
        a_idx = (k-1) * arows + j
        b_idx = i * acols + k
        c_ij += a[a_idx] * b[b_idx]
    end

    c_idx = i * arows + j
    c[c_idx] = c_ij

    return nothing
end

@hsa_kernel function mmul_array(a,b,c)
    # one kernel invocation per cell of the result matrix
    # i = col
    i = get_global_id(Int32(0)) + 1
    # j = row
    j = get_global_id(Int32(1)) + 1

    c_ij = 0.0
    for k = 1:size(a)[1]
        c_ij += a[k,j] * b[k,i]
    end

    c[j,i] = c_ij

    return nothing
end
