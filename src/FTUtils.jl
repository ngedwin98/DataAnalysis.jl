
module FTUtils

export ftdiff, ftaxis, ft, ift, psd, ssb

function ftdiff(N::Int, dx::Real)
    return 1/(N*dx)
end

function ftaxis(N::Int, dx::Real, ssb::Bool=false)
    f = (collect(0:N-1)-fld(N,2)) * ftdiff(N,dx)
    if ssb
        f = f[Int(fld(N,2))+1:end]
    end
    return f
end

function ft(y::Vector{T}, dt::Real) where {T<:Number}
    return y*dt |> ifftshift |> fft |> fftshift
end

function ift(Y::Vector{T}, df::Real) where {T<:Number}
    return Y*df |> ifftshift |> bfft |> fftshift
end

function psd(y::Vector{T}, dt::Real, ssb=true) where {T<:Number}
    N = length(y)
    psd = abs2.(ft(y,dt)) * ftdiff(N-1,dt)
    if ssb
        dc = Int(fld(N,2)) + 1
        psd[dc+1:end] *= 2
        psd = psd[dc:end]
    end
    return psd
end

end # module
