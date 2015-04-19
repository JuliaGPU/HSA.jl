import Base.zero

zero(::Type{(Uint16,Uint16,Uint16)}) = (zero(Uint16),zero(Uint16),zero(Uint16))
zero(::Type{(Uint32,Uint32,Uint32,Uint32)}) = (zero(Uint32),zero(Uint32),zero(Uint32),zero(Uint32))

zero(::Type{hsa_dim3_t}) = hsa_dim3_t(0,0,0)
zero(::Type{hsa_isa_t}) = hsa_isa_t(0)
zero(::Type{hsa_ext_control_directives_t}) =
hsa_ext_control_directives_t(
0,0,0,0,0,0,0,
zero(Array_3_Uint64),
zero(hsa_dim3_t), 0,
zero(Array_75_Uint8)
)
