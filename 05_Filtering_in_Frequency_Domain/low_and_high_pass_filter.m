% Author : Supakit Kriangkhajorn
% Follow me : skconan

function low_and_high_pass_filter()
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
    l_filter = double(filter);
    h_filter = 1-double(filter);

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
    
    lpf_logz = logz.*l_filter;
    hpf_logz = logz.*h_filter;
    
    lpf_result = ifftshift(fft.*l_filter);
    lpf_result = real(ifft2(lpf_result));
    
    hpf_result = ifftshift(fft.*h_filter);
    hpf_result = real(ifft2(hpf_result));
    
    l_h_pf_result = lpf_result+hpf_result;
     
    subplot(2,3,1); imshow(gray(:,:));
    subplot(2,3,2); mesh(l_filter);
    subplot(2,3,3); mesh(h_filter);
    subplot(2,3,4); imshow(lpf_result);
    subplot(2,3,5); imshow(hpf_result);
    subplot(2,3,6); imshow(l_h_pf_result);
end