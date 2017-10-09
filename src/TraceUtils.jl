
module TraceUtils

export dif, find, pkpk

import Base: find

function dif(v::Vector{T}) where {T<:Real}
    return v[2]-v[1]
end

function find(v::Vector{T}, x::Number) where {T<:Real}
    return searchsortedlast(v, x)
end

function pkpk(v::Vector{T}) where {T<:Real}
    return maximum(v) - minimum(v)
end

end
