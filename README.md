
# DataAnalysis.jl
Julia utils for reading, processing, and analyzing data, with an emphasis on time series/traces and spectral analysis.

Functionality is decomposed into modules, listed below.  To use module `A`, call

```julia
using DataAnalysis.A
```

## FTUtils.jl
Fourier transforms and spectral analysis methods for discretized signals, with proper scaling for dual grids.

In the limit of smooth functions and infinite samples, results should approach the [conventional Fourier transform relations](https://en.wikipedia.org/wiki/Fourier_transform#Definition).  Examples of dual grids that obey these relationships are time/frequency (*not* angular frequency) and length/spatial frequency.  This module assumes uniformly sampled 1-dimensional data and zero-centered grids; if a non-zero-centered grid is needed, [the shift theorem](https://en.wikipedia.org/wiki/Fourier_transform#Functional_relationships) can be applied.

* `ftdiff(N::Int, dx::Real)` computes the dual grid spacing, given `N` points with spacing `dx`.
* `ftaxis(N::Int, dx::Real)` computes the dual grid, given `N` points with spacing `dx`.
* `ft(y::Vector{<:Number}, dt::Real)` computes a discrete approximation to the Fourier transform of the smooth signal discretely approximated by `y`, given `y` and bin spacing (e.g., inverse of sampling time) `dt`; units of output are units of `y*dt` (e.g., V/Hz for `y` in V and `dt` in s).
* `ift(y::Vector{<:Number}, dt::Real)` computes a discrete approximation to the inverse Fourier transform of the smooth spectrum discretely approximated by `Y`, given `Y` and bin spacing (e.g., resolution bandwidth) `df`; units of output are units of `Y*df` (e.g., V for `Y` in V/Hz and `df` in Hz).
* `psd(y::Vector{<:Number}, dt::Real)` computes a discrete approximation to the power spectral density of the smooth signal discretely approximated by `y`, given `y` and bin spacing `dt`; units of output are units of `y^2*dt` (e.g., V^2/Hz for `y` in V and `dt` in s).

## HDF5Utils.jl
Convenience functions for working with the [HDF5 package](https://github.com/JuliaIO/HDF5.jl).
