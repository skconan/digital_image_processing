% Author : Supakit Kriangkhajorn
% Github : skconan

function bit_plane(image_name)
    path = strcat(pwd,'\images\');
    img_path = char(strcat(path,image_name));
    img = imread(img_path);
    gray = rgb2gray(img);

    imshow(gray);
    
    figure;
    for i=1:8
        bit=bitget(gray,i);
        subplot(4,2,i);
        imshow(bit(:,:),[]);
        title(strcat('bitit plane: ',string(i)));
    end
end
