% Author : Supakit Kriangkhajorn
% Follow me : skconan

function periodic_noise()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_name = 'MHcHVmX.jpg';
    img_name = 'noise.jpg';
    img_path = char(strcat(path,img_name));
    i= imread(img_path);
    gray = rgb2gray(i);
    gray = im2double(gray);
    
    w = 20;
    
    filter = ones(size(gray));
    for i=520-w:520+w
        for j=205-w:205+w
            filter(i,j) = 0;
        end
    end
    for i=520-w:520+w
        for j=820-w:820+w
            filter(i,j) = 0;
        end
    end
    for i=190-w:190+w
        for j=510-w:510+w
            filter(i,j) = 0;
        end
    end
    for i=810-w:810+w
        for j=510-w:510+w
            filter(i,j) = 0;
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
    result_logz = logz.*filter;
    result = ifftshift(fft.*filter);
    result = real(ifft2(result));

    subplot(2,2,1); imshow(gray);
    subplot(2,2,2); imshow(logz,[]);
    subplot(2,2,3); imshow(result);
    subplot(2,2,4); imshow(result_logz,[]);

end