function has_ext_finalization()
    @use rt = Runtime() begin
        supported = Ref{Cint}(0)

        # query runtime for support for the extension
        err = ccall(
            (:hsa_system_extension_supported,libhsa),
            hsa_status_t,
            (UInt16,UInt16,UInt16,Ptr{Cint}),
            ExtensionFinalizer,
            UInt16(1),
            UInt16(0),
            supported)

        if test_status(err, warn_only = true) && supported.x != 0
            return true
        else
            return false
        end
    end
end
