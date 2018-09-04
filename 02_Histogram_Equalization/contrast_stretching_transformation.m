% Author : Supakit Kriangkhajorn
% Follow me : skconan

function contrast_stretching_transformation(index)
% Declare variable
    path = strcat(pwd,'\images\');
    images_list = {'brightness.jpg' 'darkness.jpg' 'dark_bright.jpg'};
    gray_list = [];
    gamma_value = 0;
    
    img_name = char(strcat(path,images_list(index)));
    i = imread(img_name);
    i = imresize(i,0.5);
    gray_list = [gray_list; rgb2gray(i);];

    subplot(2,2,1); subimage(gray_list(:,:));
    subplot(2,2,3); imhist(gray_list(:,:));
    
    sld = uicontrol('Style', 'slider',...
        'Min',1,'Max',10,'Value',1,...
        'Position', [800 500 255 30],...
        'Callback', @trackbar_gamma); 
    
    function trackbar_gamma(source,event)
        E = source.Value;
        txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[850 550 120 40],...
            'String',string(E));
        gray = im2double(gray_list);
        m = 0.6;
        g = 1./(1 + (m./(gray+eps)).^E);
        subplot(2,2,2);subimage(g(:,:));
        subplot(2,2,4); imhist(g(:,:));
    end
end