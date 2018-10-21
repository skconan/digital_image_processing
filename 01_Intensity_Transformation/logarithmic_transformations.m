% Author : Supakit Kriangkhajorn
% Github : skconan

function logarithmic_transformation(image_name)
    path = strcat(pwd,'\images\');
    img_path = char(strcat(path,image_name));
    img = imread(img_path);
    img = imresize(img,0.5);
    gray = rgb2gray(img);
    gray = im2double(gray);
    mapping = zeros(1,256);
    
    for i = 1:256
        mapping(1,i) = (i-1)/255;
    end
    
    
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',1000,'Value',1,...
        'Position', [850 500 200 30],...
        'Callback', @trackbar_constant); 
    
    function trackbar_constant(source,event)
        c = source.Value/10;
        txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[900 550 120 40],...
            'String',string(c));
         
        output = c.*log(1+gray);     
        map_out = (c.*log(1+mapping));
        max_output = max(output(:,:));
        max_map_out = max(map_out(:,:));
        
        subplot(2,2,1); subimage(gray(:,:));
        subplot(2,2,2); subimage(output(:,:));
        subplot(2,2,3); imhist(output(:,:));
        subplot(2,2,4); plot(mapping,map_out);
    end
end