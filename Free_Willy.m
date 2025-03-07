%% 1.2 e) Free Willy Function
function freed_willy = Free_Willy(willy,fx)
[M,N] = size(willy);
x = 0:N-1;
y = ones(M,N);
t = y.*x;
pb = 0.5*sin(2*pi*fx*t/N);
fft_pb = fft2(pb);
fft_willy = fft2(willy);
fft_freed_willy = fft_willy - fft_pb;
freed_willy = ifft2(fft_freed_willy);
imshow(freed_willy); title("Freed Willy",FontSize=16);
end