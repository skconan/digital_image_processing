% Author : Supakit Kriangkhajorn
% Follow me : skconan

function intensity_transformation(index)
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
        'Min',0,'Max',1000,'Value',100,...
        'Position', [800 500 200 30],...
        'Callback', @trackbar_gamma); 
    
    function trackbar_gamma(source,event)
        gamma_value = source.Value;
        gamma_value = gamma_value/100.0
        disp(gamma_value);
        txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[850 550 120 40],...
            'String',string(gamma_value));
            g = imadjust(gray_list,[0,1],[0,1],gamma_value);
        subplot(2,2,2);subimage(g(:,:));
        subplot(2,2,4); imhist(g(:,:));
    end
end