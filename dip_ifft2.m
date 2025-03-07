%% 1.1.1) IFFT2 function
function ifft2_image = dip_ifft2(FFT)
[M,N] = size(FFT);
m = 0:M-1;  n = 0:N-1;
W_m = exp(2*pi*1i*(m'*m/M));                    % MXM size IDFT matrix for rows
W_n = exp(2*pi*1i*(n'*n/N));                    % NXN size IDFT matrix for columns
ifft2_image = 1/(N*M) * W_m * FFT * W_n;        % calculating inverse fourier transorm for the image
end