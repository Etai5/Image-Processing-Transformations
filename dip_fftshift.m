%% 1.1.2) FFTSHIFT function
function fft_shift = dip_fftshift(FFT)
[M,N] = size(FFT);
fft_shift = circshift(FFT,[floor(M/2) floor(N/2)]);
end