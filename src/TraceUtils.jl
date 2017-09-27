
module TraceUtils

export dif, find

import Base: find

function dif(v::Vector{T}) where {T<:Number}
    return v[2]-v[1]
end

function find(v::Vector{T}, x::Number) where {T<:Number}
    return searchsortedlast(v, x)
end

end
