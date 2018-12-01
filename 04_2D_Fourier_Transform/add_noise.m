% Author : Supakit Kriangkhajorn
% Follow me : skconan

function add_noise()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'dark_bright.jpg';
    img_path = char(strcat(path,img_name));
    mean = 0;
    variance = 0;
    density = 0;
    
    i = imread(img_path);
    i = imresize(i,0.2);
    gray = rgb2gray(i);
    
    txt_mean = uicontrol('Style','Text',...
            'FontSize', 14,...
            'Position',[20,520, 150, 22],...
            'String','Mean:0');
    
    txt_variance = uicontrol('Style','Text',...
            'FontSize', 14,...  
            'Position',[20,470, 150, 22],...
            'String','Variance:0');
        
    txt_density = uicontrol('Style','Text',...
            'FontSize', 14,...
            'Position',[20,420, 150, 22],...
            'String','Noise Density:0');
    
    btn_plus_mean = uicontrol('Style', 'pushbutton',...
                              'String', '+',...
                              'Position', [200,520, 100, 22],...
                              'Callback', @plus_mean);    
    btn_minus_mean = uicontrol('Style', 'pushbutton',...
                              'String', '-',...
                              'Position', [200,500, 100, 22],...
                              'Callback', @minus_mean);
    btn_plus_variance = uicontrol('Style', 'pushbutton',...
                              'String', '+',...
                              'Position', [200,470, 100, 22],...
                              'Callback', @plus_variance);
    btn_minus_variance = uicontrol('Style', 'pushbutton',...
                              'String', '-',...
                              'Position', [200,450, 100, 22],...
                              'Callback', @minus_variance);
    btn_plus_density = uicontrol('Style', 'pushbutton',...
                              'String', '+',...
                              'Position', [200,420, 100, 22],...
                              'Callback', @plus_density);
    btn_minus_density = uicontrol('Style', 'pushbutton',...
                              'String', '-',...
                              'Position', [200,400, 100, 22],...
                              'Callback', @minus_density);
    function plus_mean(source,event)
        mean = mean+1;
        txt_mean.String = strcat('Mean:',string(mean/100));
        gaussian = imnoise(gray, 'gaussian',mean/100,variance/100);
        subplot(2,2,2); subimage(gaussian(:,:));
    end
    function minus_mean(source,event)
        mean = mean-1;
        txt_mean.String = strcat('Mean:',string(mean/100));
        gaussian = imnoise(gray, 'gaussian',mean/100,variance/100);
        subplot(2,2,2); subimage(gaussian(:,:));
    end
    function plus_variance(source,event)
        variance = variance+1;
        txt_variance.String = strcat('Variance:',string(variance/100));
        gaussian = imnoise(gray, 'gaussian',mean/100,variance/100);
        subplot(2,2,2); subimage(gaussian(:,:));
    end
    function minus_variance(source,event)
        variance = variance-1;
        txt_variance.String = strcat('Variance:',string(variance/100));
        gaussian = imnoise(gray, 'gaussian',mean/100,variance/100);
        subplot(2,2,2); subimage(gaussian(:,:));
    end
    function plus_density(source,event)
        density = density+1;
        txt_density.String = strcat('density:',string(density/100));
        salt_paper = imnoise(gray, 'salt & pepper',density/100);
        subplot(2,2,4); subimage(salt_paper(:,:));
    end
    function minus_density(source,event)
        density = density-1;
        txt_density.String = strcat('density:',string(density/100));
        salt_paper = imnoise(gray, 'salt & pepper',density/100);
        subplot(2,2,4); subimage(salt_paper(:,:));
    end
    salt_paper = imnoise(gray, 'salt & pepper',density/100);
    gaussian = imnoise(gray, 'gaussian',mean/100,variance/100);
    subplot(2,2,4); subimage(salt_paper(:,:));
    subplot(2,2,2); subimage(gaussian(:,:));
    subplot(2,2,1); subimage(gray(:,:));
   
end