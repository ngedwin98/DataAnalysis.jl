
# DataAnalysis.jl
Julia utils for reading, processing, and analyzing data, with an emphasis on time series/traces and spectral analysis.

Functionality is decomposed into modules, listed below.  To use module `A`, call

```julia
using DataAnalysis.A
```

## FTUtils.jl
Fourier transforms and spectral analysis methods for discretized signals, with proper scaling for dual grids.

## HDF5Utils.jl
Convenience functions for working with the [HDF5 package](https://github.com/JuliaIO/HDF5.jl).
