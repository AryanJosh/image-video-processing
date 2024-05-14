%% Median filter on image with salt and pepper noise %%
% Change the code for taking input for size of the mask

clear;
clc;

% I = imread('pout.tif');
% I1 = I;
% I = imnoise(I, 'gaussian');
% J = imnoise(I, 'salt & pepper', 0.02); % Adding noise
% a = double(J);
% b = a;
a = [0,1,0,1,0,1,0;1,2,1,3,1,0,1;1,9,1,8,1,0,1;1,8,9,0,6,0,1;1,0,6,0,5,0,1;0,1,0,1,0,1,0;0,1,0,1,0,1,0];
[row, col] = size(a);

% Take user input for the mask size
maskSize = input('Enter the size of the mask (e.g., 3 for a 3x3 mask): ');

halfSize = floor(maskSize / 2);

for x = halfSize + 1:1:row - halfSize
    for y = halfSize + 1:1:col - halfSize
        % To make an n x n mask into a 1 x n^2 mask a(x, y)...
        neighborhood = a(x - halfSize:x + halfSize, y - halfSize:y + halfSize);
        al = reshape(neighborhood, 1, maskSize^2);
        a2 = sort(al);
        med = a2(floor(maskSize^2 / 2) + 1); % the middle value is the median
        b(x, y) = med;
    end
end

% [row col]=size(a);
% 
% for x=2:1:row-1;
% 
% for y=2:1:col-1;
% 
% %% To make a 3 x 3 mask into a 1 x 9 mask a(x,y)...
% 
% al=[a(x-1,y-1) a(x-1,y) a(x-1,y+1) a(x,y-1) a(x,y+1) a(x+1,y-1) a(x+1,y) a(x+1,y+1)];
% 
% a2=sort(al);
% 
% med=a2(5); % the fifth value is the median

figure(1)
subplot(1, 3, 1)
imshow(uint8(I1))
title('Original Image');
subplot(1, 3, 2)
imshow(uint8(J))
title('Image with Salt & Pepper Noise');
subplot(1, 3, 3)
imshow(uint8(b))
title('Image After Median Filter');