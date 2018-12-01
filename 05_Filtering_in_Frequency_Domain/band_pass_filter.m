% Author : Supakit Kriangkhajorn
% Follow me : skconan

function band_pass_filter()
% Declare variable
    path = strcat(pwd,'\images\');
    img_name = 'image.jpg';
    img_name = 'MHcHVmX.jpg';
    img_path = char(strcat(path,img_name));
    gray = imread(img_path);
%     gray = rgb2gray(i);
    gray = im2double(gray);
    
    center = size(gray,1)/2;    
    filter = zeros(size(gray));
    cutoff_minimum = 10;
    cutoff_maximum = 50;
    
    for i=center-cutoff_maximum:center+cutoff_maximum
        for j = center-cutoff_maximum:center+cutoff_maximum
            if ((i-center)^2 + (j-center)^2 >= cutoff_minimum^2 ...
                    && (i-center)^2 + (j-center)^2 <= cutoff_maximum^2)
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
    
    bpf_logz = logz.*filter;
    bpf_result = ifftshift(fft.*filter);
    bpf_result = real(ifft2(bpf_result));
    subplot(2,3,1); imshow(gray(:,:));
    subplot(2,3,2); imshow(logz,[]);
    subplot(2,3,5); imshow(bpf_logz,[]);
    subplot(2,3,3); mesh(filter);
    ubplot(2,3,4); imshow(bpf_result);s

end