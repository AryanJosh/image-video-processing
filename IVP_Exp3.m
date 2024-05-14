% IVP Experiment 3
% Date : 
% Author : Aryan Joshi 

clear;
close all;
clc;

%% Bit plane slicing %%
% Make changes in the program so that it produces 8 bit subplot
a=imread ('cameraman.tif');
a=double(a);
r=input('which bit image do you want to see 1=MSB 8=LSB\n');
[row, col] = size(a);

% preallocating w size 
w = zeros(row,col);

for x=1:1:row
    for y=1:1:col
        c=dec2bin(a(x,y),8); % converts decimal to binary
        d=c(r);
        w(x,y)=double(d);
% since w is a char and pannot be plotted
         if w(x,y)==49
% since double of d will be either 49 or 48
            w(x,y)=255;
         else
             w(x,y)=0;
         end
    end
end
figure(1)
imshow(uint8(a))
figure(2)
imshow(uint8(w))

%% MATLAB code to calculate negative %%
clc;
aa=imread ('cameraman.tif');
c=255; 
% for a 8-bit image 
c1=uint8(c);
b=c1-aa;
figure(3)
colormap(gray)
imagesc(aa)
figure(4)
colormap(gray)
imagesc(b)

%% Power transformation %%
clc;
f=imread('pout.tif');
f=double(f);
[row,col] = size(f);
gamma=input("Enter the correction factor: ");
nuimg = zeros(row, col);
nuimg1 = zeros(row, col);
for x=1:row
    for y=1:col
        nuimg(x,y)=f(x,y)^gamma;
    end
end
numax=max(max(nuimg));
numin=min(min(nuimg));
n=255/(numax-numin);
for i=1:row
  for j=1:col
      nuimg1(i,j)=n*(nuimg(i,j)-numin);
% Normalisation
  end
end
nuimg2=uint8(nuimg1);
subplot(2,1,1)
imshow(uint8(f))
title("Original image")
subplot(2,1,2)
imshow(nuimg2)
title("Image after power transformation")

%% Grey level slicing without background %%
clc;
f=imread ('cameraman.tif');
f=double (f);
[row,col] = size(f);
g = zeros(x,y);
for x=1:1:row
    for y=1:1:col
     if((f(x,y)>50))&&(f(x,y)<150)
        g(x,y)=255;
     else
         g(x,y)=0;
     end
   end
end
figure (5); %......original image.
imshow(uint8(f))
figure (6); %......gray level slicing without background
imshow(uint8(g))

%% Contrast stretching of an image %%
% Slopes taken are 0.5, 2 and 0.5%
clc;
f=imread ('pout.tif');
f=double(f);
[row ,col]=size(f);
LT=input("Enter the lower threshold value:");
UT=input("Enter the upper threshold value:");
for x=1:1:row
    for y=1:1:col
        if f(x,y)<=LT
        g(x,y)=0.5*f(x,y);
    else 
         if f(x,y)<=UT
            g(x,y)=2*(f(x,y)-LT)+0.5*LT;
    else 
        g(x,y)=0.5*(f(x,y)-UT) +0.5*LT+2*(UT-LT);
         end
        end
    end
end
subplot(2,2,1)
imshow(uint8(f))
title("Original Image");
subplot(2,2,2)
imhist(uint8(f))
subplot(2,2,3)
imshow(uint8(g))
title("Image after Contrast Stretching")
subplot(2,2,4)
imhist(uint8(g))

%% Dynamic range compression %%

clc;
f=imread('cameraman.tif');
f=double(f);
[row,col] = size(f);
for x=1:1:row
 for y=1:1:col
  g(x,y) = f(x,y)*((-1)^(x+y)); %% Needed to center the
 end
end
d=abs(fft2(g));
d_log=log(1+d);
% Plotting
figure(7)
colormap(gray)
imagesc(d)
figure(8)
colormap(gray)
imagesc(d_log)

%% Grey level slicing with backgound %%

clc;
f=imread ('cameraman.tif');
f=double(f);
[row, col]=size(f);
for x=1:1:row
  for y=1:1:col
    if (f(x,y)>50) && (f(x,y)<150)
       g(x,y)=255;
    else
       g(x,y)=f(x,y);
    end
  end
end
figure (9); % original image.
imshow(uint8(f))
figure (10);   % grey level slicing with background
imshow (uint8(g))

%% Thresholding %%%%%

clc;
f=imread ('cameraman.tif'); 
[row,col]=size(f);
T=input("Enter value of Threshold :");
for x=1:1:row
    for y=1:1:col
      if(f(x,y)<T)
          g(x,y)=0;
      else
          g(x,y)=255;
      end
    end
 end
figure(1);
imshow(f)
figure(2);
imshow(g)

I=imread('pout.tif');
J=histeq(I);



%% Histogram Streching%%
clc;
I = imread('pout.tif');

%img_mat = rgb2gray(I);
img_mat =I;
[m,n] = size(img_mat);
bitlevel =8; % bit size
bit_comb = (2^bitlevel); %number of combinations
hist_data= zeros(1,bit_comb);
streched_img = zeros(i, j);
% Histogram
for i=1:m
  for j=1:n
  val =img_mat(i,j)+1;
  count = hist_data(val)+1;
  hist_data(val) = count;
  end
end

% Streching
max_pix_vec = max(img_mat(1:m,1:n));
min_pix_vec = min(img_mat(1:m,1:n));

max_pix = max(max_pix_vec); % max value
min_pix = min(min_pix_vec); % min value

for i =1:m
  for j = 1:n
  streched_img(i,j)= (img_mat(i,j)-min_pix)*((bit_comb-1)/(max_pix-min_pix));
  end
end
hist_data_new=zeros(1,bit_comb);

for i= 1: m
  for j=1:n
   val =streched_img(i,j)+1;
   count = hist_data_new(val)+1;
   hist_data_new(val) = count;
  end
end

max_pix_vec_new = max(streched_img(1:m,1:n));
min_pix_vec_new = min(streched_img(1:m,1:n));

max_pix_new = max(max_pix_vec_new); % max value
min_pix_new = min(min_pix_vec_new); % min value
val_max_pix=max_pix;
val_min_pix=min_pix;
old_con = max_pix-min_pix;
val_max_pix_new=max_pix_new;
val_min_pix_new=min_pix_new;
new_con= max_pix_new-min_pix_new;

figure(1)

%-------------
subplot (421), imshow(I);
title ('original image');
subplot (422)
imhist (I);
title('histogram');
subplot (423), imshow(J);
title ('equalised image');
subplot (424), imhist(J);
title ('equalised histogram');
%---------


subplot(4,2,5)
imshow(img_mat)
title('old image')

subplot(4,2,6)
stem(0:bit_comb-1,hist_data)
title('Old Image Histogram')
% 
subplot(4,2,7)
imshow(streched_img)
title('New image')

subplot(4,2,8)
stem(0:bit_comb-1,hist_data_new)
title('New Image Histogram')
