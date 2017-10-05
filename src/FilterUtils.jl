
module FilterUtils

using DSP

function lowpass(dt, f0)
    filter = digitalfilter(Lowpass(f0;fs=1/dt), Butterworth(4))
    return data -> filtfilt(filter, data)
end

end # module
