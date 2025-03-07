%% Image Processing Homework 3:

%% 1) 2D-Fourier Transform
%% 1.1) Writing Fucntions and using on beatles.png
clear variables
close all
clc
%% 1.1.3) Reading "beatles.png" and convert it to normalized grayscale image
close all
beatles = imread("beatles.png");
beatles = double(rgb2gray(beatles));  % convert to double and grayscale
beatles = (beatles-min(beatles,[],"all"))/...
    (max(beatles,[],"all")-min(beatles,[],"all"));
imshow(beatles); title("beatles.png grayscale normalized image",FontSize=16);

%% 1.1.4) 2D-FFT on the image and shift
close all
fft2_beatles = dip_fft2(beatles);
fft2_beatles_shift = dip_fftshift(fft2_beatles);
figure(1)
imagesc(log(abs(fft2_beatles_shift))); colorbar;
title("log Amplitude of the 2D-FFT of the image 'beatles.png'",FontSize=16);
figure(2)
imagesc(angle(fft2_beatles_shift)); colorbar;
title("Phase of the 2D-FFT of the image 'beatles.png'",FontSize=16);

%% 1.1.5) Reconstruction of the original image
close all
ifft2_beatles = dip_ifft2(fft2_beatles);
subplot(1,2,1);
imshow(real(ifft2_beatles));
title("Reconstructed Image",FontSize=16);
subplot(1,2,2);
imshow(beatles);
title("Original Image",FontSize=16);
difference = sum(abs(ifft2_beatles-beatles),"all");
fprintf("The absolute difference between the images is:%g\n",difference);

%% 1.2) Transformation Properties
%% 1.2.1) Linearity (Free Willy)
clear variables
close all
clc
%% a) Load willy and show the image
close all
load("freewilly.mat");
imshow(freewilly);
title("Imprisoned Willy",FontSize=16);
%% b) Find the spatial frequency of the prison
close all
figure(1)
plot(freewilly(1,:));
title("First row of Imprisoned Willy",FontSize=16);
fft_willy = fft2(freewilly);
fft_willy_shift = fftshift(fft_willy);
figure(2)
imagesc(log(abs(fft_willy_shift))); colormap('jet'); colorbar;
title("log Amplitude of 2D-FFT of Imprisoned Willy",FontSize=16);

%% c) Display the prison bars
close all
fx = 10;
[M,N] = size(freewilly);
x = 0:N-1;
y = ones(M,N);
t = y.*x;
pb = 0.5*sin(2*pi*fx*t/N);
imshow(pb); colorbar;
title("Prison Bars",FontSize=16)

%% d) 2D-FFT of Prison Bars
close all
fft_pb = fft2(pb);
fft_pb_shift = fftshift(fft_pb);
imagesc(log(abs(fft_pb_shift))); colormap('jet'); colorbar
title("log Amplitude of 2D-FFT of Prison Bars",FontSize=16);

%% e) Free Willy
close all
willy = Free_Willy(freewilly,fx);

%% 1.2.2) Scaling, translation and seperability
clear variables
close all
clc
%% a) First Rectangle
close all
clc
mat_a = zeros(128);
mat1 = ones(40);
mat_a(44:83,44:83) = mat1;
subplot(1,3,1);
imshow(mat_a);
title("Rectangle",FontSize=16);
fft_mat_a = fft2(mat_a);
fft_mat_a_shift = fftshift(fft_mat_a);
subplot(1,3,2);
imagesc(log(abs(fft_mat_a_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of the Rectangle",FontSize=16); 
subplot(1,3,3);
imagesc(angle(fft_mat_a_shift)); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("Phase of 2D-FFT of the Rectangle",FontSize=16); 

%% b) Second Rectangle
close all
clc
mat_b = zeros(128);
mat1 = ones(40);
mat_b(64:103,64:103) = mat1;
subplot(1,3,1);
imshow(mat_b);
title("Rectangle",FontSize=16);
fft_mat_b = fft2(mat_b);
fft_mat_b_shift = fftshift(fft_mat_b);
subplot(1,3,2);
imagesc(log(abs(fft_mat_b_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of the Rectangle",FontSize=16); 
subplot(1,3,3);
imagesc(angle(fft_mat_b_shift)); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("Phase of 2D-FFT of the Rectangle",FontSize=16);

%%
close all
clc
subplot(1,2,1);
imagesc(log(abs(fft_mat_a_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of section a rectangle",FontSize=16); 
subplot(1,2,2);
imagesc(log(abs(fft_mat_b_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of section b rectangle",FontSize=16); 

%% c) Third Rectangle
close all
clc
mat_c = zeros(128);
mat2 = ones(80,20);
mat_c(24:103,54:73) = mat2;
subplot(1,3,1);
imshow(mat_c);
title("Rectangle",FontSize=16);
fft_mat_c = fft2(mat_c);
fft_mat_c_shift = fftshift(fft_mat_c);
subplot(1,3,2);
imagesc(log(abs(fft_mat_c_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of the Rectangle",FontSize=16); 
subplot(1,3,3);
imagesc(angle(fft_mat_c_shift)); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("Phase of 2D-FFT of the Rectangle",FontSize=16);

%% e) FFT Seperation
close all
clc
v_x = zeros(1,128);
v_x(:,54:73) = 1;
v_y = zeros(128,1);
v_y(24:103,:) = 1;
mat_e = v_y*v_x;
imshow(mat_e);
title("Rectangle as a Multiplication of two 1D vectors",FontSize=16);
%%
fft_mat_e = sep_fft2(v_x,v_y);
fft_mat_e_shift = fftshift(fft_mat_e);
subplot(1,2,1);
imagesc(log(abs(fft_mat_e_shift))); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("log Amplitude of 2D-FFT of the Rectangle with sep fft2",FontSize=16); 
subplot(1,2,2);
imagesc(angle(fft_mat_e_shift)); axis equal; colorbar;
xlim([0 128]); ylim([0 128]);
title("Phase of 2D-FFT of the sep Rectangle with sep fft2",FontSize=16); 
