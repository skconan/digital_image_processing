% Author : Supakit Kriangkhajorn
% Follow me : skconan

function histogram_equalization()
% Declare variable
    path = strcat(pwd,'\images\');
    images_list = {'brightness.jpg' 'darkness.jpg' 'dark_bright.jpg'};
    ct = 1;
    for index = 1:3     
        img_name = char(strcat(path,images_list(index)));
        i = imread(img_name);
        i = imresize(i,0.5);
        gray = rgb2gray(i);
        hist_equ = histeq(gray);
        
        subplot(3,3,ct); subimage(gray(:,:));
        ct = ct+1;
        subplot(3,3,ct); subimage(hist_equ(:,:));
        ct = ct+1;
        subplot(3,3,ct); imhist(hist_equ(:,:));
        ct = ct+1;
    end
end