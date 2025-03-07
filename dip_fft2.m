%% 1.1.1) FFT2 function
function fft2_image = dip_fft2(I)
[M,N] = size(I);
m = 0:M-1;  n = 0:N-1;
W_m = exp(-2*pi*1i*(m'*m/M));       % MXM size DFT matrix for rows
W_n = exp(-2*pi*1i*(n'*n/N));       % NXN size DFT matrix for columns
fft2_image =  W_m * I * W_n;        % calculating fourier transorm for the image
end