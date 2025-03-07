%% 1.2.2 e) two 1D vectors to 2D-FFT matrix
function sep_2d_fft = sep_fft2(v_x,v_y)
v_x_fft = fft(v_x);
v_y_fft = fft(v_y);
sep_2d_fft = v_y_fft * v_x_fft;
end