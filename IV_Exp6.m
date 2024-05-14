% IVP Experiemnt 3
% Date: 16-02-24
% Author : Aryan J.

%% Smoothing LPF %%
% Low pass filtering of an image using averaging technique
clear;
clc;
a=imread('pout.tif');
a1=a;
a=imnoise(a,'gaussian');
a=double(a);
[row,col] = size(a);
m=input('Enter the mask size:');
n=m^2;
for i=1:1:m
    for j=1:1:m
        w(i,j)=1/n;
    end
end
s=(m+1)/2;
for x=1:1:row
    for y=1:1:col
        b(x,y)=a(x,y);
    end
end
for x=s:1:row-s+1
    for y=s:1:col-s+1
        b(x,y)=0;
    end
end
for x=s:1:row-s+1
    for y=s:1:col-s+1
        for i=1:1:m
            for j=1:1:m
                b(x,y)=a(x-s+i,y-s+j)*w(i,j)+b(x,y);
            end
        end
    end
end
subplot (2,2,1)
imshow (uint8(a1))
title ('Original Image');
subplot (2,2,2)
imshow (uint8(a))
title ('Image with Gaussian Noise');
subplot (2,2,3)
imshow (uint8(b))
title ('Low Pass Filtered Image');
c=conv2(a,w);
subplot(2,2,4)
imshow(uint8(c))
title('Low Pass Smoothing Filter using MATLAB');

%% Median filter on image with salt and pepper noise %%
clear;
clc;
I=imread('pout.tif');
I1=I;
I=imnoise(I,'gaussian');
J=imnoise(I,'salt & pepper',0.02); % Adding noise
a=double(J);
b=a;
[row,col]=size(a);
for x=2:1:row-1
    for y=2:1:col-1
% To make a 3 x 3 mask into a 1 x 9 mask a(x,y)...
         al=[a(x-1,y-1) a(x-1,y) a(x-1,y+1) a(x,y-1) a(x,y+1) a(x+1,y-1) a(x+1,y) a(x+1,y+1)];
         a2=sort(al);
         med=a2(5); % the fifth value is the median
         b(x,y)=med;
    end
end
figure(1)
subplot(1,3,1)
imshow(uint8(I1))
title('Original Image');
subplot(1,3,2)
imshow(uint8(J))
title('Image with Salt & Pepper Noise');
subplot(1,3,3)
imshow(uint8(b))
title('Image After Median Filter');

%% High pass filtering %%
clear;
clc
aa=imread('xray2.tiff');
a=double (aa);
[row,col]=size(a);
w=[-1 -1 -1;-1 8 -1; -1 -1 -1];

for x=2:1:row-1

for y=2:1:col-1
al(x,y)= w(1)*a(x-1,y-1)+w(2)*a(x-1,y)+w(3)*a(x-1,y+1)+w(4) *a(x,y-1)+w(5) *a(x,y)+w(6)*a(x,y+1)+w(7)*a(x+1,y-1)+w(8) *a(x+1,y)+w(9)*a(x+1,y+1);

end
end

figure(1)
subplot(1,2,1)
imshow(uint8(a))
title('Original Image');
subplot(1,2,2)
imshow(uint8(al))
title('Image After Sharping Or High Pass Filter');

%% High pass filtering of an image %%
clear;
clc;
a=imread('xray2.tiff');
a=double(a);
[row,col] =size(a);
m=input('Enter the mask size:');
for i=1:1:m
    for j=1:1:m
        w(i,j)=-1;
    end
end
s=(m+1)/2;
w(s,s)=m^2-1;
for x=1:1:row
    for y=s:1:col
        b(x,y)=a(x,y);
    end
    
end

for x=s:1:row-s
    for y=s:1:col-s
        b(x,y)=0;
    end
end

for x=s:1:row-s
    for y=s:1:col-s
        for i=1:1:m
            for j=1:1:m
                b(x,y)=a(x-s+i,y-s+j)*w(i,j)+b(x,y);
            end
        end
        if b(x,y) <0
            b(x,y)=0;
        end
    end
end
n=0;

for x=s:1:row-s
    for y=s:1:col-s
        if b(x,y) > n
            n=b(x,y);
        end
    end
end
c=255/n;
for x=s:1:row-s
    for y=s:1:col-s
        b(x,y)=c*b(x,y);
    end
end

subplot(2,1,1)
imshow(uint8(a))
title('Original Image');

subplot(2,1,2)
imshow(uint8(b))
title('High Pass Filtered Image')
