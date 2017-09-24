module DualFT

export dualgrid, FT, iFT

function dualgrid(N::Int, dx::Real)
    return (collect(0:N-1)-fld(N,2)) / (N*dx)
end

function FT{T<:Number}(y::Vector{T}, dt::Real)
    return y*dt |> ifftshift |> fft |> fftshift
end

function iFT{T<:Number}(Y::Vector{T}, df::Real)
    return Y*df |> ifftshift |> bfft |> fftshift
end

end # module
