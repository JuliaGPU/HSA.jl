if haskey(ENV, "HSA_RUNTIME_PATH")
	const hsa_runtime_path = ENV["HSA_RUNTIME_PATH"]
else
	warn("environment variable HSA_RUNTIME_PATH is not set, using default path")
	const hsa_runtime_path = "/opt/hsa"
end

function dlopen_or_warn_if_not_found(libraryname, path, optional = false)
	if path == ""
		msg = "HSA library '$libraryname' not found, set environment variable HSA_RUNTIME_PATH"

		if optional
			info(msg)
		else
			warn(msg)
		end
	end
end

const hsa_paths = [joinpath(hsa_runtime_path, "lib")]

const libhsa = Libdl.find_library(["libhsa-runtime64"], hsa_paths)
const libhsa_dl = dlopen_or_warn_if_not_found("libhsa-runtime64", libhsa)

const libhsaext = Libdl.find_library(["libhsa-runtime-ext64"], hsa_paths)
const libhsaext_dl = dlopen_or_warn_if_not_found("libhsa-runtime-ext64", libhsaext, true)

const libhsakmt = Libdl.find_library(["libhsakmt"], hsa_paths)
const libhsakmt_dl = dlopen_or_warn_if_not_found("libhsakmt", libhsakmt)

const hsa_include_path = joinpath(dirname(libhsa), "../include")
