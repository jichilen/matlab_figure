clc; clear all; close all;
I1 = imread('shrimp_left.jpg');
I2 = imread('shrimp_right.jpg');
% I(:, :, 1) = imsubtract(I1(:, :, 1), I2(:, :, 1));
% I(:, :, 2) = imsubtract(I1(:, :, 2), I2(:, :, 2));
% I(:, :, 3) = imsubtract(I1(:, :, 3), I2(:, :, 3));
% Ir = rgb2gray(I);
% I1=rgb2gray(I1);
% I2=rgb2gray(I2);
I=imsubtract(I1,I2);
level = graythresh(I); %��ȡ��ֵ
I = im2bw(I,level);%������ֵ��ֵ��ͼ��

figure;
subplot(2, 2, 1); imshow(I1);
title('������ͼ');
subplot(2, 2, 2); imshow(I2);
title('������ͼ');
subplot(2, 2, 3); imshow(I);
title('�Ӳ���ͼ');

title('�Ӳ���ͼ');