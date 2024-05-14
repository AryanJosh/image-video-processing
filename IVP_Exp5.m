% IVP Experiemnt 4
% Date : 16-02-24
% Author : Aryan J

%% Ideal Low pass Filter %%

clear;
clc;
a= imread('cameraman.tif');
a=double(a);
c=size(a);
N=c(1);
D0= input('Enter the cut-off frequency:');
for u=1:1:c(1)
 for v = 1:1:c(2)
   D= ((u-(N/2))^2+(v-(N/2))^2)^0.5;
   if D < D0
       H(u,v) = 1;
   else
       H(u,v) = 0;
   end
 end
end
vv=fft2(a);
vc=fftshift(vv);
x= vc.*H;
X= abs(ifft2(x));
% Plotting 
figure(1)

subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D ILPF')

subplot(223)
mesh(H)
title('Ideal LPF Freq Resp')

subplot(224)
imshow(uint8(X))
title('ILP Filtered Image Cutoff=25')

%% Ideal High pass filter %%

clear;
clc;
a = imread('cameraman.tif');
a= double(a);
[row, col] = size(a);
set=input('Enter the value of the cut-off frequency:');
for u= 1:1:row
    for v = 1:1:col
        D= ((u- (row/2))^2 + (v-(col/2))^2)^0.5;
        if D<set
            H(u,v) = 0;
        else
            H(u,v) = 1;
        end
    end
end
vv = fft2(a);
vc=fftshift(vv);
x = (vc.*H);
X = abs(ifft2(x));
% Plotting %

figure(1)
subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D IHPF')

subplot(223)
mesh(H)
title('Ideal HPF Freq Resp')

subplot(224)
imshow(uint8(X))
title('IHP Filtered Image Cutoff=25')

%% Low pass Butterworth filter %%
clear; 
clc;
a= imread('cameraman.tif');
a = double(a);
c= size(a);
N = c(1);
n= input('Enter the order of the filter:');
DO= input('Enter the cut-off frequency:');
for u = 1:1:c(1)
    for v = 1:1:c(2)
        D = ((u-(N/2))^2+(v-(N/2))^2)^0.5;
        H(u,v) = 1/(1+((D/DO)^(2*n)));
    end
end
vv=fft2(a); % we could use our code %
vc=fftshift(vv);
x= vc.*H;
x=abs (ifft2(x));
%% Plotting
subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D BLPF')

subplot(223)
mesh(H)
title('BLPF Freq Resp')

subplot(224)
imshow(uint8(x))
title('BLP Filtered Image order=2 Cutoff=25')

%% Butterworth high pass filter %%
clear;
clc;
a = imread('cameraman.tif');
a = double(a);
c= size(a);
N = c(1);
n= input('Enter the order of the filter '); D0= input('Enter the cut-off frequency ');
for u=1:1: c(1)
    for v= 1:1:c(2)
        D = ((u-(N/2))^2+(v-(N/2))^2)^0.5; H(u,v) = 1/((1+(D0/D)^(2*n)));
    end
end
vv =fft2(a);
vc=fftshift(vv);
x = vc.*H;
x = abs(ifft2(x));
figure(1)
subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D BHPF')

subplot(223)
mesh(H)
title('BHPF Freq Resp')

subplot(224)
imshow(uint8(x))
title('BHP Filtered Image Cutoff= Order=')
%%Plotting
%figure (1), imshow(uint8(x))
%figure (2), mesh(H)
%figure (3), imshow(uint8(X))

%% Low pass Gaussian filter %%
clear;
clc
a = imread('cameraman.tif');
a= double(a);
c = size(a);
N = c(1);
DO= input ('Enter the cut-off frequency / standard deviation');
for u= 1:1:c(1)
    for v = 1:1:c(2)
        Dx = ((u-(N/2))^2+(v-(N/2))^2)^0.5;
        D= Dx*Dx;
% In the formula we need to take the square 
          H(u,v) = exp(-D/(2*DO*DO));
    end
end
vv=fft2(a);
vc=fftshift(vv);
x= vc.*H;
x=abs (ifft2(x));
% Plotting
subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D GLPF')

subplot(223)
mesh(H)
title('GLPF Freq Resp')

subplot(224)
imshow(uint8(x))
title('GLP Filtered Image')

% Plotting
%figure (1), imshow(uint8(a))
%figure (2), mesh(11)
%Figure (3), imshow(uint8(X))
%figure (4), images(1).colormap(gray)

%% Gaussian high pass filter %%
clear;
clc;
a = imread('cameraman.tif');
a=double(a);
c = size(a);
N = c(1);
D0= input('Enter the cut-off frequency/standard deviation:');
for u = 1:1:c(1)
    for v = 1:1:c(2)
        Dx = ((u- (N/2))^2+(v-(N/2))^2)^0.5;
        D = Dx*Dx;
% In the formula we need to take the square 
H(u,v) = 1-exp(-D/(2*D0*D0));
% Here DO is taken as the standard
% deviation sigma 
     end
end
vv = fft2(a);
ve = fftshift(vv);
x= ve.*H;
X = abs(ifft2(x));
% Plotting 
figure(1)
subplot(221)
imshow(uint8(a))
title('Original Image')

subplot(222)
imagesc(H), colormap(gray)
title('2-D GHPF')

subplot(223)
mesh(H)
title('GHPF Freq Resp')

subplot(224)
imshow(uint8(X))
title('GHP Filtered Image ')

%figure (1), imshow (uint8(a))
%figure (2), mesh(H)
%figure (3), imshow(uint8(X))
%figure (4), imagesc(H),colormap (gray)