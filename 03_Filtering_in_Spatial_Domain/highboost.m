% Author : Supakit Kriangkhajorn
% Follow me : skconan

function highboost()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'dice.jpg';
    img_path = char(strcat(path,img_name));
    i = imread(img_path);
    i = imresize(i,0.2);
    gray = rgb2gray(i);
    
    n = 3;
    filter = ones(n,n)./(n*n);
    avg_filter = imfilter(gray,filter);
    k = 3;
    
    diff_img = gray - avg_filter;
    highboost = gray + k*diff_img;
    
    subplot(2,2,1); subimage(gray(:,:));
    subplot(2,2,2); subimage(avg_filter(:,:));
    subplot(2,2,3); subimage(highboost(:,:));
end