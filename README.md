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
*   HSA.add\_write\_index(queue, idx) does not seem to work
*   Cannot compile Kernels declared in more than one nested function (or something like that)
    + argument type jl\_value\_type\* not found
	  Maybe because of hidden environment arguments that are passed to the nested function?
	+ HSA intrinsics not declared...

ToDo
*   kernel pointer arguments are generated as kernarg\_u32 despite large machine model
    -> because they are in address space 0
	but we can't just mark the arguments types as address space 1, because they confuse the code generator...
*   generate a functional jlcall\_wrapper to allow calling kernels directly from julia
    - How do we pass range information? (additional arguments, some kind of context...)


[![Build Status](https://travis-ci.org/rollingthunder/HSA.jl.svg?branch=master)](https://travis-ci.org/rollingthunder/HSA.jl)
