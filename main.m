%Christian Lascsak
%Matr. Nr. 01363742

pkg load signal;
close all;
clear all;

%Bsp1
edgeDetec1D(0.8);

%Bsp2
[Lo_D,Hi_D] = getHaar();
nlevels = 4;
img = imread('images/lena.png');
figure;
y2d = wt2d(img, Lo_D, Hi_D, nlevels);
figure,imshow(y2d, []), title('Decompostition of the Image');