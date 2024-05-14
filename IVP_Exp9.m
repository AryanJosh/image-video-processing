% IVP Experiment 6
% Date : 5-4-24
% Author : Aryan J
% Title : Textural analysis in terms of GLCM

% GLCM of diagonal strips 
a=[0 0 1 1 0;0 1 1 0 0;1 1 0 0 0;1 0 0 1 1;0 0 1 1 0];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy = stats.Energy;
Contrast = stats.Contrast;

% GLCM of Horizontal strips 
a=[1 1 1 1 1;1 1 1 1 1;0 0 0 0 0;0 0 0 0 0;1 1 1 1 1];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy1 = stats.Energy;
Contrast1 = stats.Contrast;

% GLCM of vertical strips 
a=[1 1 0 0 1;1 1 0 0 1;1 1 0 0 1;1 1 0 0 1;1 1 0 0 1];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy2 = stats.Energy;
Contrast2 = stats.Contrast;

% GLCM of White Image 
a=[1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy3 = stats.Energy;
Contrast3 = stats.Contrast;

% GLCM of Dark Image 
a=[0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy4 = stats.Energy;
Contrast4 = stats.Contrast;

% Anti diagonal Image 
a=[0 1 1 0 0;0 0 1 1 0;1 0 0 1 1;1 1 0 0 1;0 1 1 0 0];
imtool(a)
glcm=graycomatrix(a,'NumLevels',2,'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats=graycoprops(glcm,'Contrast Energy');
format short
Energy5 = stats.Energy;
Contrast5 = stats.Contrast;
