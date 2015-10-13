# HSA

Module overview
*   HSA
    Container Module for all HSA functionality.
    Directly contains wrappers for functions and constants defined by the HSA runtime.
    +   Intrinsics
        Functions that compile down to device instructions for use in Kernels
        As well as functionality to emulate them on a non-HSA CPU
    +   ExtFinalization
        Wrappers for the finalization extension to the HSA Runtime
    +   Compilation
        Functionality for defining kernels as julia functions and compiling them to BRIG
    +   Execution
        Convenience macros and functions that abstract away most of the boilerplate for running an HSA Kernel

Known Issues
*   HSA.executable\_get\_symbol does not find symbols
    +   Maybe the name string for the symbol is not being passed correctly?
*   Cannot compile Kernels not declared in top level scope (or something like that)
    +   argument type jl\_value\_type\* not found
        Maybe because of hidden environment arguments that are passed to the nested function?
    +   HSA intrinsics not declared...

ToDo
*   Improve emulation
    -   any ideas for implementing barriers?
*   Implement a barrier/workgroup example (prefix_sum)
    -   leads to boxing -> failure
*   Implement multidimensional Array access from kernel
    -   Idea: Directly access the information (size etc.) stored in the julia
        jl\_array\_t so as to avoid having to pass that seperately
        -> bound to be inefficient ?
    -   or: Rewrite the kernel in the macro to convert n-d indexing to linear
    -   or: Fix issues preventing use of standard accessors
*   Allow function calls
    -   Inlined calls work
    -   Manual inlining fails because the Function referenced in the call
        instruction is only a declaration without pointer to the definition
    -   Maybe (ab)use the ctx.to_inline mechanism to force inlining ?
*   kernel pointer arguments are generated as kernarg\_u32 despite large machine model
    because they are in address space 0 but we cant just mark the arguments types 
    as address space 1, because they confuse the code generator...
    Solution: Implement AddAddrSpacePass LLVM Pass that inserts and propagates
    address space after the function is generated
    Issues:
    -   Does not remove obsolete instructions
    -   Still breaks many assumptions about types in julia: 
        jl_is_datatype, ....
        -> copy over julia type metadata when creating new values
*   work around optimization that converts a loop to a memset
    and leads to a call to the llvm.memset intrinsic which shows up as @0 
    and breaks everything
    -   Maybe we can lower it back to a loop?

*   allow boxing of arguments/temporaries
    -   Using plain alloca instead of gc frame allocation
    -   By translating locals to internal module globals as described in SPIR
        1.2 Spec

*   generate a functional jlcall\_wrapper to allow calling kernels directly from julia
    -   How do we pass range information? (additional arguments, some kind of context...)

*   Julia Arrays are Column first!

*   Maybe force kernel return type to void instead of failing when it doesnt?

*   @llvm.trap intrinsic is not supported by HSAIL Target and is therefore
    lowered to a call to abort() which is also unsupported... *sigh*
    -   try to lower it to debugtrap HSAIL instruction
        no luck so far...

[![Build Status](https://travis-ci.org/rollingthunder/HSA.jl.svg?branch=master)](https://travis-ci.org/rollingthunder/HSA.jl)
