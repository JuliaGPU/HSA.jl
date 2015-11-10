# Library Path Discovery
if haskey(ENV, "HSA_RUNTIME_PATH")
    const hsa_runtime_path = ENV["HSA_RUNTIME_PATH"]
else
    #warn("environment variable HSA_RUNTIME_PATH is not set, using default path")
    const hsa_runtime_path = "/opt/hsa"
end

function dlopen_or_warn_if_not_found(libraryname, path, optional = false)
    if path == ""
        msg = "HSA library '$libraryname' not found, add its location to LD_LIBRARY_PATH"

        if optional
            info(msg)
        else
            warn(msg)
        end
    end
end
const hsa_libpath = joinpath(hsa_runtime_path, "lib")
const hsa_paths = [hsa_libpath]

const libhsa = Libdl.find_library(["libhsa-runtime64"], hsa_paths)
const libhsa_dl = dlopen_or_warn_if_not_found("libhsa-runtime64", libhsa)

const hsa_include_path = joinpath(dirname(libhsa), "../include")

# Capability Checks

function has_libhsa()
    return libhsa != ""
end

function has_hsa_codegen()
    try
        return ccall(:jl_has_device_target, Bool, (Any,), :hsail)
    catch err
        # Something went wrong, probably the method was not found
        # meaning we are running on a version of julia without device target support
        return false
    end
end
