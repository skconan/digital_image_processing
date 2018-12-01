% Author : Supakit Kriangkhajorn
% Follow me : skconan

function remove_noise()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'dark_bright.jpg';
    img_path = char(strcat(path,img_name));
    i = imread(img_path);
    i = imresize(i,0.2);
    gray = rgb2gray(i);
    
    mean = 50;
    variance = 10;
    density = 30;
    
    salt_paper = imnoise(gray, 'salt & pepper',density/100);
    gaussian_1 = imnoise(gray, 'gaussian',mean/100,variance/100);
    
    mean = -20;
    variance = 3;
    
    gaussian_2 = imnoise(gray, 'gaussian',mean/100,variance/100);
    
    figure('Name','Original and Noise')
    subplot(2,2,1); subimage(gray(:,:));
    subplot(2,2,2); subimage(salt_paper(:,:));
    subplot(2,2,3); subimage(gaussian_1(:,:));
    subplot(2,2,4); subimage(gaussian_2(:,:));
   
    figure('Name','Average Filter')
    n = 7;
    filter = ones(n,n)./(n*n);
    salt_paper_avg_filter = imfilter(salt_paper,filter);
    n = 7;
    filter = ones(n,n)./(n*n);
    gaussian_1_avg_filter = imfilter(gaussian_1,filter);
    n = 5;
    filter = ones(n,n)./(n*n);
    gaussian_2_avg_filter = imfilter(gaussian_2,filter);
    
    subplot(2,2,2); subimage(salt_paper_avg_filter(:,:));
    subplot(2,2,3); subimage(gaussian_1_avg_filter(:,:));
    subplot(2,2,4); subimage(gaussian_2_avg_filter(:,:));
    
    
    
    figure('Name','Median Filter')
    n = 5;
    filter = ones(n,n)./(n*n);
    salt_paper_median_filter = ordfilt2(salt_paper,median(1:n*n),filter);
    n = 5;
    filter = ones(n,n)./(n*n);
    gaussian_1_median_filter = ordfilt2(gaussian_1,median(1:n*n),filter);
    n = 5;
    filter = ones(n,n)./(n*n);
    gaussian_2_median_filter = ordfilt2(gaussian_2,median(1:n*n),filter);
    subplot(2,2,2); subimage(salt_paper_median_filter(:,:));
    subplot(2,2,3); subimage(gaussian_1_median_filter(:,:));
    subplot(2,2,4); subimage(gaussian_2_median_filter(:,:));
end