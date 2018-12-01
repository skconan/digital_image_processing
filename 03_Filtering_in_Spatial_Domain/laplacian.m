% Author : Supakit Kriangkhajorn
% Follow me : skconan

function laplacian()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'lena.bmp';
    img_path = char(strcat(path,img_name));
    gray = imread(img_path);
%     gray = imresize(i,0.2);
%     gray = rgb2gray(i);
    alpha = 0   ;
    h = fspecial('laplacian',alpha)
    filtered = imfilter(gray,h);
    enhance = gray - filtered;
    subplot(2,2,1); subimage(gray(:,:));
    subplot(2,2,2); subimage(filtered(:,:));
    subplot(2,2,3); subimage(enhance(:,:));
end