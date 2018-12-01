% Author : Supakit Kriangkhajorn
% Follow me : skconan

function degradation()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_path = char(strcat(path,img_name));
    
    i = imread(img_path);
    gray = rgb2gray(i);
    gray = im2double(gray);
    
    len = 51;
    theta = 180;
    point_spread_f = fspecial('motion',len,theta);
    blur = imfilter(gray,point_spread_f,'circular','conv');

    subplot(1,2,1); imshow(gray);
    subplot(1,2,2); imshow(blur);
    
%   blur = point_spread_f * gray(original) + noise(not interest noise)
%   blur = point_spread_f * gray 
    h = fspecial('motion',len,theta);
    h_fft = fft2(h,size(gray,1),size(gray,2));
    deblur = real(ifft2(fft2(blur)./h_fft));
    
    figure;
    subplot(1,2,1); imshow(blur);
    subplot(1,2,2); imshow(deblur);
end