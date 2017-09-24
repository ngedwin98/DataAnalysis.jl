module HDF5Util

export getindex, hdf5tree, attributes

using HDF5
import Base: getindex

getindex(obj::Union{HDF5File,HDF5Group}, ind::Int) = obj[names(obj)[ind]]

function hdf5tree(obj::Union{HDF5File,HDF5Group}, level::Int=0)
    for (j,n) in enumerate(names(obj))
        println(repeat("  ",level) * n * " [$(j)]")
        hdf5tree(obj[n],level+1)
    end
end
hdf5tree(obj::HDF5Dataset, level::Int) = return

function atttributes(obj::Union{HDF5File, HDF5Group, HDF5Dataset})
    return Dict(n => read(attrs(obj)[n]) for n in names(attrs(obj)))
end

end # module
