using HSA

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

N =  1024*1024

a = Array(Float64, N)
rand!(a)
b = Array(Float64, N)
rand!(b)
c = Array(Float64, N)
rand!(c)

expected = a * b

@hsa (N) vector_add_kernel(a, b, c, ACOLS)

@assert expected == c
