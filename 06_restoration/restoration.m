% Author : Supakit Kriangkhajorn
% Follow me : skconan

function restoration()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'Blurred_12_5810500145.png';
    img_path = char(strcat(path,img_name));
    set_len = 40;
    set_theta = 175;
    len = 40;
    theta = 175;
    
    gray = imread(img_path);
%     gray = rgb2gray(i);
    gray = im2double(gray);

    noise_var = 0.00001;
    signal_var = var(gray(:));
    sld1 = uicontrol('Style', 'slider',...
        'Min',30,'Max',60,'Value',set_len,...
        'Position', [800 500 200 30],...
        'Callback', @trackbar_len); 
    
    sld2 = uicontrol('Style', 'slider',...
        'Min',0,'Max',175,'Value',set_theta,...
        'Position', [800 700 200 30],...
        'Callback', @trackbar_theta); 
    
    function show()
     h = fspecial('motion',len,theta);
   
     deblur = deconvwnr(gray,h, noise_var / signal_var);

     subplot(2,2,1); imshow(gray);
     subplot(2,2,2); imshow(deblur,[]);
    end
    function trackbar_len(source,event)
        len = source.Value;
        disp('len')
        disp(len)
        show()
    end
    function trackbar_theta(source,event)
        theta = source.Value;
        disp('theta')
        disp(theta)
        show()
    end
    
    
     
    
end