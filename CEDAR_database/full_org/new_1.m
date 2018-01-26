clc;clear all;close all;
I = imread('original_24_22.png');
figure(1);imshow(I);
bwimage = thresholding_me(I);
% remove noise or small components(isolated pixels)
% temp1 = regionprops(bwimage, 'PixelList');



figure;imshow(bwimage)
rotnormimage = rotation_norm(bwimage);
figure; imshow(rotnormimage);
