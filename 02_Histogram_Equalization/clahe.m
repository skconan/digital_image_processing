% Author : Supakit Kriangkhajorn
% Follow me : skconan

function clahe(index)
% Declare variable
    path = strcat(pwd,'\images\');
    images_list = {'brightness.jpg' 'darkness.jpg' 'dark_bright.jpg'};
    ct = 1;
        
        img_name = char(strcat(path,images_list(index)));
        i = imread(img_name);
        i = imresize(i,0.125);
        gray = rgb2gray(i);
        
        sld = uicontrol('Style', 'slider',...
            'Min',0,'Max',1,'Value',0.01,...
            'Position', [800 500 200 30],...
            'Callback', @adjust_cliplimit); 
        subplot(2,2,1); subimage(gray(:,:));
        subplot(2,2,2); imhist(gray(:,:));
        function adjust_cliplimit(source,event)
            limit_value = source.Value;
            clahe = adapthisteq(gray,...
                    'NumTiles',[400,200],...
                    'ClipLimit',limit_value);
            txt = uicontrol('Style','text',...
                'FontSize', 24,...
                'Position',[850 550 120 40],...
                'String',string(limit_value));
            subplot(2,2,3); subimage(clahe(:,:));
            subplot(2,2,4); imhist(clahe(:,:));
        end
end