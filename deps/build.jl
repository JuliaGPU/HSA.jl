home = homedir()

code =
"# This file is auto-generated during package installation
#
# any changes you make will be lost, the next time
# the package is rebuilt

const libhsa = \"$home/lib64/libhsa-runtime64.so\"

const libhsakmt = \"$home/lib64/libhsakmt.so.1\"

const libhsakmt_handle = Libdl.dlopen(libhsakmt)
"

file = open("../src/binding/def.jl", "w")

write(file, code)

close(file)
