module FTUtils

export ftdiff, ftaxis, ft, ift, psd

function ftdiff(N::Int, dx::Real)
    return 1/(N*dx)
end

function ftaxis(N::Int, dx::Real)
    return (collect(0:N-1)-fld(N,2)) / (N*dx)
end

function ft{T<:Number}(y::Vector{T}, dt::Real)
    return y*dt |> ifftshift |> fft |> fftshift
end

function ift{T<:Number}(Y::Vector{T}, df::Real)
    return Y*df |> ifftshift |> bfft |> fftshift
end

function psd(y::Vector{T}, dt::Real)
    return abs2.(dualFT(y,dt)) / (dt*length(y))
end

end # module
