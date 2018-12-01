% Author : Supakit Kriangkhajorn
% Follow me : skconan

function color_range()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'Grundlesdeptstore.png';
    img_path = char(strcat(path,img_name));
    i = imread(img_path);
 
    gray = rgb2gray(i);
  
    
    hsv = rgb2hsv(i);
    hmin = 80/180;
    hmax = 110/180;
    h = hsv(:,:,1) >= hmin & hsv(:,:,1) <= hmax;
    h = im2uint8(h);
   
    figure;
    subplot(1,2,2); imhist(hsv(:,:,1));
     subplot(1,2,1);imshow(i);
    
    figure;
    imshow(gray, 'InitialMag', 'fit')
    hold on
    a = imshow(i, 'InitialMag', 'fit');
    hold off
    set(a, 'AlphaData',h)
    
    hmin = 0/180;
    hmax = 20/180;
    h = hsv(:,:,1) >= hmin & hsv(:,:,1) <= hmax;
    h = im2uint8(h);
    
    figure;
    imshow(gray, 'InitialMag', 'fit')
    hold on
    a = imshow(i, 'InitialMag', 'fit');
    hold off
    set(a, 'AlphaData',h)

end