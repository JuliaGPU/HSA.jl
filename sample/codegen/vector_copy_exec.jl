using HSA

function check(message)
    println("✓ $message")
end

# Use the HSAIL Code Generator to compile a
# kernel function to BRIG

@hsa_kernel function vector_copy_kernel(a::Ptr{Int64},b::Ptr{Int64})
    idx = get_global_id(UInt32(0)) + 1

    x = Base.unsafe_load(b, idx)
    Base.unsafe_store!(a, x, idx)
    return nothing
end
check("defining the kernel")

N =  1024*1024

a_in = Array(Int, N)
rand!(a_in)

b_out = Array(Int, N)
rand!(b_out)

@hsa (N) vector_copy_kernel(a_in, b_out)
check("dispatching the kernel call via @hsa")

failed = 0
for (i in 1:N)
    if (b_out[i]!=a_in[i])
        failed = failed + 1

        if failed > 10
            println("...")
            break
        end

        println("Bad index: $i\n$(a_in[i]) --> $(b_out[i])")
    end
end

if(failed == 0)
    println("Passed validation.")
else
    println("VALIDATION FAILED!\n")
end

