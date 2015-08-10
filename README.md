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

[![Build Status](https://travis-ci.org/rollingthunder/HSA.jl.svg?branch=master)](https://travis-ci.org/rollingthunder/HSA.jl)
