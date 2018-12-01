% Author : Supakit Kriangkhajorn
% Follow me : skconan

function fourier_transform_log_scale()
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
    magnitude = abs(fft);
    const = 1;
    [m,n]=size(magnitude);
    for r = 1:m
        for c = 1:n
            mag = double(magnitude(r, c));
            logz(r, c) = const.*log10(1 + mag);
        end
    end
    subplot(1,2,1); imshow(magnitude,[]);
    subplot(1,2,2); imshow(logz,[]);
end