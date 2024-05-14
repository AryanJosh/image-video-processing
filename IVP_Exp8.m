% IVP Experiemnt 5
% Date: 22-02-24
% Author : Aryan J.

% % Program for Closing %
% %% Closing means Dilate first and Erode later
% 
% clear;
% clc;
% a=imread('bot.png');
% a=double(a);
% p=size(a);
% w=[1 1 1;1 1 1;1 1 1]; %% Structuring element %%
% 
% for x=2:1:p(1)-1
% for y=2:1:p(2)-1
% al =[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1) w(4)*a(x,y-1) w(5)*a(x,y)  w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
% A1(x,y)=max(al); % Dilation %
% end
% subplot(221)
% imshow(a)
% title('Original Image')
% 
% subplot(222)
% imshow(A1)
% title('Image After Dilation')
% end
% q=size(A1);
% for x=2:1:q(1)-1
% for y=2:1:q(2)-1
% al1 =[w(1)*A1(x-1,y-1) w(2)*A1(x-1,y) w(3)*A1(x-1,y+1) w(4)*A1(x,y-1) w(5)*A1(x,y)  w(6)*A1(x,y+1) w(7)*A1(x+1,y-1) w(8)*A1(x+1,y) w(9)*A1(x+1,y+1)];
% A2(x,y)=min(al1); % Erosion %
% end
% end
% 
% subplot(223)
% imshow(A2)
% title('Image After Erosion')

clear;
clc;
a= input('Enter the matrix of image:');
%a =imread(x);
p=size(a);

% % Using the inbuilt MATLAB functions for Comparison 
% s=strel('square',3);
% d1=imdilate(a,s);
% d2=imerode(a,s);

% Writing our own program 
w=[1 1 1 1 1;1 1 1 1 1;1 1 1 1 1]; 

% Structuring element 
for x=2:1:p(1)-1
    for y=2:1:p(2)-1
al =[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1) w(4)*a(x,y-1) w(5)*a(x,y)  w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];

A1(x,y)=max(al); % Dilation 

A2(x,y)=min(al); % Erosion 
     end
end
subplot(131)
imshow(a)
title('Original Image')

% subplot(232)
% imshow(d1)
% title('Dilation using MATLAB')

% subplot(233)
% imshow(d2)
% title('Erosion using MATLAB')

subplot(132)
imshow(A1)
title('Dilation using program')

subplot(133)
imshow(A2)
title('Erosion using program')