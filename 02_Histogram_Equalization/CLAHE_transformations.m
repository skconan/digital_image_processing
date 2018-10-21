% Author : Supakit Kriangkhajorn
% Follow me : skconan

% adapthisteq(img)  enhances the contrast of the grayscaleby transforming 
%                   the values using CLAHE
% 'ClipLimit'       is a contrast factor that prevents oversaturation of  
%                   the image specifically in homogeneous areas. 0 to 1 
% 'NumTiles',[8 16] divides the image into 8 rows and 16 columns of tiles.

function CLAHE_transformations(image_name)
    path = strcat(pwd,'\images\');
    img_path = char(strcat(path,image_name));
    img = imread(img_path);
    img = imresize(img,0.5);
    gray = rgb2gray(img);
    clahe = gray;
    clip_limit = 0.01;
    no_row_col = 100;
    mapping = zeros(1,256);
    y = 1;
    for i = 1:256
        mapping(1,i) = (i-1)/255;
    end
   
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',100,'Value',10,...
        'Position', [800 500 200 30],...
        'Callback', @trackbar_cliplimit); 
    
    sld1 = uicontrol('Style', 'slider',...
        'Min',0,'Max',500,'Value',100,...
        'Position', [800 400 200 30],...
        'Callback', @trackbar_no_row_col); 
     
    plot_result();
    
    function plot_result()
       txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[600 500 200 40],...
            'String',strcat('clip_limit: ',string(clip_limit)));
       txt1 = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[600 400 200 40],...
            'String',strcat('no_rc: ',string(no_row_col)));
        clahe = adapthisteq(gray,...
                    'NumTiles',[no_row_col,no_row_col],...
                    'ClipLimit',clip_limit,...
                    'Distribution','rayleigh');
        subplot(2,2,1); subimage(gray(:,:));
        subplot(2,2,2); subimage(clahe(:,:));
        subplot(2,2,3); imhist(gray(:,:));
        subplot(2,2,4); imhist(clahe(:,:));
    end
        
    function trackbar_cliplimit(source,event)
       clip_limit = source.Value/1000;
       plot_result();
    end
    function trackbar_no_row_col(source,event)
       no_row_col = source.Value;
       plot_result();
    end
end