% Author : Supakit Kriangkhajorn
% Github : skconan

function histogram_equalization()
    % Declare variable
    path = strcat(pwd,'\images\');
    images_list = {'brightness.jpg' 'darkness.jpg' 'dark_bright.jpg'};
    
    for index = 1:3     
        ct = 1;
        img_name = char(strcat(path,images_list(index)));
        i = imread(img_name);
        i = imresize(i,0.5);
        gray = rgb2gray(i);
        hist_equ = histeq(gray);
        
        figure;
        subplot(2,2,ct); subimage(gray(:,:));
        ct = ct+1;
        subplot(2,2,ct); subimage(gray(:,:));
        ct = ct+1;
        subplot(2,2,ct); imhist(gray(:,:));
        ct = ct+1;
        subplot(2,2,ct); imhist(hist_equ(:,:));
        ct = ct+1;
    end
end