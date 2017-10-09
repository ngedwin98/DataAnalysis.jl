
module FilterUtils

export lowpass_butterworth

using DSP

function lowpass_butterworth(f0, dt, n::Int=4)
    filter = digitalfilter(Lowpass(f0;fs=1/dt), Butterworth(n))
    return data -> filtfilt(filter, data)
end

end # module
