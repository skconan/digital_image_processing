% Author : Supakit Kriangkhajorn
% Follow me : skconan

function low_pass_filter()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_path = char(strcat(path,img_name));
    
    i = imread(img_path);
    gray = rgb2gray(i);
    gray = im2double(gray);
    
    center = size(gray,1)/2;    
    filter = zeros(size(gray));
    sigma = 100;
    for i=center-sigma:center+sigma
        for j = center-sigma:center+sigma
            if (i-center)^2 + (j-center)^2 <= sigma^2
                filter(i,j) = 1;
            end
        end
    end
    filter = double(filter);
    
    fft = fft2(gray);
    fft = fftshift(fft);
   
    magnitude = abs(fft);
    const = 1;
    [m,n]=size(magnitude);
    for r = 1:m
        for c = 1:n
            mag = double(magnitude(r, c));
            logz(r, c) = const.*log10(1 + mag);
        end
    end
    
    lpf_logz = logz.*filter;
    lpf_result = ifftshift(fft.*filter);
    lpf_result = real(ifft2(lpf_result));

    subplot(2,3,1); imshow(gray(:,:));
    subplot(2,3,2); imshow(logz,[]);
    subplot(2,3,3); mesh(filter);
    subplot(2,3,4); imshow(lpf_logz,[]);
    subplot(2,3,5); imshow(lpf_result);
end