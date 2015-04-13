import Base.zero

zero(::Type{(Uint16,Uint16,Uint16)}) = (zero(Uint16),zero(Uint16),zero(Uint16))
zero(::Type{(Uint32,Uint32,Uint32,Uint32)}) = (zero(Uint32),zero(Uint32),zero(Uint32),zero(Uint32))

zero(::Type{hsa_dim3_t}) = hsa_dim3_t(0,0,0)
