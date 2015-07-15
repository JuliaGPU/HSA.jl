const INTRINSICS = [:get_global_id]

module Intrinsics

using Core.Intrinsics.llvmcall

export get_global_id

@inline get_global_id(dim::Int32) =
	llvmcall(
	("declare spir_func i64 @_Z13get_global_idj(i32) readnone nounwind",
	  """%2 = tail call spir_func i64 @_Z13get_global_idj(i32 %0)
	  ret i64 %2"""),
	  Int64, Tuple{Int32}, dim)


end
