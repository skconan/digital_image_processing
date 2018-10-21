% Author : Supakit Kriangkhajorn
% Github : skconan

function stretching_transformation(image_name)
    path = strcat(pwd,'\images\');
    img_path = char(strcat(path,image_name));
    img = imread(img_path);
    img = imresize(img,0.5);
    gray = rgb2gray(img);
    gray = im2double(gray);
    mapping = zeros(1,256);
    E = 1;
    m = 0.24;
    output = gray;
    for i = 1:256
        mapping(1,i) = (i-1)/255;
    end
    map_out = mapping;
  
    sld_slope = uicontrol('Style', 'slider',...
        'Min',1,'Max',10,'Value',1,...
        'Position', [800 500 255 30],...
        'Callback', @trackbar_slope);
    
    sld_midline = uicontrol('Style', 'slider',...
        'Min',1,'Max',10,'Value',2.4,...
        'Position', [800 400 255 30],...
        'Callback', @trackbar_midline);
    
    plot_result();
    function plot_result()
        output = 1./(1 + (m./(gray+eps)).^E);
        map_out = 1./(1 + (m./(mapping+eps)).^E);
        txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[850 550 120 40],...
            'String',strcat('E: ',string(E)));
       txt = uicontrol('Style','text',...
            'FontSize', 24,...
            'Position',[850 450 120 40],...
            'String',strcat('m: ',string(m)));
        subplot(2,2,1); subimage(gray(:,:));
        subplot(2,2,2); subimage(output(:,:));
        subplot(2,2,3); imhist(output(:,:));
        subplot(2,2,4); plot(mapping,map_out);
    end

    function trackbar_slope(source,event)
        E = source.Value;
        
        plot_result() 
    end
    function trackbar_midline(source,event)
        m = source.Value/10;
        plot_result() 
    end
end