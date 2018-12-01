%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%  im: input image
 %%  FT: Fourier transform of original image
 %%  mask : mask used for band reject filtering
 %%  FT2 : Band pass filtered spectrum
 %%  output : Denoised image
 %%
 %%  Author: Krishna Kumar
 %%  Date: 25 Mar 2014
 %%
 %%One of the applications of band reject filtering is for noise removal 
 %%in applications where the general location of the noise component in 
 %%the frequency domain is approximately known.
 %%
 %% This program denoise an image corrupted by periodic noise that can be
 %% approximated as two-dimensional sinusoidal functions using a band
 %% reject filters.
 %%You can adjust the radius of the filter mask to apply for a different
 %%image.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all;
im = imread('E:\Workspace\digital_image_processing\05_Filtering_in_Frequency_Domain\images\MHcHVmX.jpg');
figure,imshow(im);
FT = fft2(double(im));
FT1 = fftshift(FT);%finding spectrum
imtool(abs(FT1),[]);
m = size(im,1);
n = size(im,2);

t = 0:pi/20:2*pi;
xc=700; % point around which we filter image
yc=900;
r=100;   %Radium of circular region of interest(for BRF)
r1 = 0;
xcc = r*cos(t)+xc;
ycc =  r*sin(t)+yc;

xcc1 = r1*cos(t)+xc;
ycc1 =  r1*sin(t)+yc;

mask = poly2mask(double(xcc),double(ycc), m,n);
mask1 = poly2mask(double(xcc1),double(ycc1), m,n);%generating mask for filtering

mask(mask1)=0;

FT2=FT1;
FT2(mask)=0;%cropping area or bandreject filtering

imtool(abs(FT2),[]);
output = ifft2(ifftshift(FT2));
imtool(output,[]);