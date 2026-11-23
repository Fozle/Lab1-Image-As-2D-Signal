
close all;
clear;
clc;

%% 0) Load and inspect an image

if exist('peppers.png','file')
    I_rgb = imread('peppers.png');
else
    I_rgb = repmat(imread('cameraman.tif'),1,1,3);
end

figure;
imshow(I_rgb);
title('Original RGB');

% Convert to grayscale
if size(I_rgb,3) == 3
    I = rgb2gray(I_rgb);
else
    I = I_rgb;
end

figure;
imshow(I);
title('Grayscale');

% Basic image information
fprintf('Class: %s | Range: [%g, %g] | Size: %d x %d\n', ...
    class(I), double(min(I(:))), double(max(I(:))), ...
    size(I,1), size(I,2));

%% 1) Quantization and dynamic range

I8 = I;
I6 = uint8(floor(double(I)/4)*4);
I4 = uint8(floor(double(I)/16)*16);

figure;
montage({I8,I6,I4},'Size',[1 3]);
title('Quantization: 8-bit vs approximately 6-bit vs 4-bit');

%% 2) Histogram and contrast stretching

figure;

subplot(1,2,1);
imhist(I);
title('Original Histogram');

I_norm = mat2gray(I);
I_stretch = imadjust(I,[0.2 0.8],[0 1]);

subplot(1,2,2);
imhist(I_stretch);
title('Contrast-Stretched Histogram');

figure;
montage({I, im2uint8(I_norm), im2uint8(I_stretch)}, ...
    'Size',[1 3]);
title('Original | Normalized | Contrast-Stretched');

%% 3) Gamma correction

I_gamma_low = imadjust(I,[],[],0.6);
I_gamma_high = imadjust(I,[],[],1.6);

figure;
montage({I,I_gamma_low,I_gamma_high},'Size',[1 3]);
title('Gamma: Original | Gamma 0.6 | Gamma 1.6');

%% 4) Sampling and aliasing

scale = 0.1;

I_small = imresize(I,scale,'nearest');
I_back = imresize(I_small,size(I),'nearest');

figure;
montage({I,I_small,I_back},'Size',[1 3]);
title('Original | Downsampled | Upscaled');

%% 5) Save figures

figures = findall(0,'Type','figure');

for k = 1:length(figures)
    figure(figures(k));
    filename = sprintf('Lab01_figure_%02d.png',k);
    saveas(figures(k),filename);
end

fprintf('\nAll figures saved successfully.\n');
