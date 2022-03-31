rx = adi.AD7768.Rx;
rx.uri = 'ip:analog-2.local';
rx.SamplesPerFrame = 1024;
rx.SampleRate = '256000';
sa = dsp.SpectrumAnalyzer;
sa.PlotAsTwoSidedSpectrum = false;
for k = 1:30
    sa(rx()) 
end