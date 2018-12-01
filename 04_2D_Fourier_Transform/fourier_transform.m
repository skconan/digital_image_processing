% Author : Supakit Kriangkhajorn
% Follow me : skconan

function fourier_transform()
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
%     phrase = angle(fft);
    magnitude = abs(fft);

    ifft = ifftshift(fft);
    ifft = ifft2(ifft);
    
    subplot(1,2,1); imshow(gray(:,:));
    subplot(1,2,2); imshow(ifft,[]);
    figure,imshow(magnitude,[24 100000]);

end