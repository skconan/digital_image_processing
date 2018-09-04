% Author : Supakit Kriangkhajorn
% Follow me : skconan

function plot_histogram()
% Declare variable
    path = strcat(pwd,'\images\');
    images_list = {'brightness.jpg' 'darkness.jpg' 'dark_bright.jpg'};
    ct = 1;
    for index = 1:3     
        img_name = char(strcat(path,images_list(index)));
        i = imread(img_name);
        i = imresize(i,0.5);
        gray = rgb2gray(i);
        
        subplot(3,2,ct); subimage(gray(:,:));
        ct = ct+1;
        subplot(3,2,ct); imhist(gray(:,:));
        ct = ct+1;
    end
end