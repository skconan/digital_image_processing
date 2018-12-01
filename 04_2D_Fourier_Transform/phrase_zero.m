% Author : Supakit Kriangkhajorn
% Follow me : skconan

function phrase_zero()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_path = char(strcat(path,img_name));
    
    i = imread(img_path);
    i = imresize(i,0.2);
    gray = rgb2gray(i);
    gray = im2double(gray);
    
    fft = fft2(gray);
    fft = fftshift(fft);
    phrase = angle(zeros(size((fft))));
    magnitude = abs(fft);
    
    img_r = magnitude.*cos(phrase);
    img_l = magnitude.*sin(phrase);
    img = complex(img_r,img_l);
    img_inv = ifft2(ifftshift(img));
   
    subplot(1,2,1); imshow(gray);
    subplot(1,2,2); imshow(img_inv);
end
