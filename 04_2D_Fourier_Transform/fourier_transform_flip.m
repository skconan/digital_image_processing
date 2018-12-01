% Author : Supakit Kriangkhajorn
% Follow me : skconan

function fourier_transform_flip()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_path = char(strcat(path,img_name));
    
    i = imread(img_path);
    i = imresize(i,0.2);
    gray = rgb2gray(i);
    gray_rotate = imrotate(gray,180);
    gray_rotate = im2double(gray_rotate);
    gray = im2double(gray);
    
    fft = fft2(gray);
    fft = fftshift(fft);
    phrase = angle(fft);
    magnitude = abs(fft);
    
    fft_rotate  = fft2(gray_rotate);
    fft_rotate  = fftshift(fft_rotate);
    phrase_rotate  = angle(fft_rotate);
    magnitude_rotate  = abs(fft_rotate);
    
    subplot(1,2,1); imshow(gray);
    subplot(1,2,2); imshow(fft);
    
%     TEST MAGNITUDE & PHRASE
    img_r = magnitude_rotate.*cos(phrase);
    img_l = magnitude_rotate.*sin(phrase);
    img = complex(img_r,img_l);
    img_inv = ifft2(ifftshift(img));
    figure; imshow(img_inv);
    
    img_r = magnitude.*cos(phrase_rotate);
    img_l = magnitude.*sin(phrase_rotate);
    img = complex(img_r,img_l);
    img_inv = ifft2(ifftshift(img));
    figure; imshow(img_inv);
end