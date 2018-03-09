% clear;
img=imread('yingcao.jpg');
% img1=im;
img1=rgb2gray(img);
lap=[0 -1 0;-1 4 -1;0 -1 0];  %laplacian
sob=[1 2 1;0 0 0 ;-1 -2 -1];  %sobel
pre=[1 1 1;0 0 0 ;-1 -1 -1];  %prewitt
rob=[1 0;0 -1];  %roberts
[w,l]=size(img1);
img2=zeros(w+1,l+1);
img11=zeros(w+1,l+1);
for i=1:w                                                           %图像的扩展
    for j=1:l
        img11(i+1,j+1)=img1(i,j);
    end
end
for i=2:w                                                           %手动卷积
    for j=2:l
        img2(i,j)=4*img11(i,j)-img11(i-1,j)-img11(i+1,j)-img11(i,j-1)-img11(i,j+1);
    end
end

% subplot(1,2,1);
% imshow(img1);
img1=double(img1);
lap=double(lap);
img3=conv2(img1,rot90(rob,2),'same');                               %卷积函数
img4=uint8(img3);                                                     %不同输出方法的测试
img5=((img3-min(min(img3)))/(max(max(img3))-min(min(img3)))*225);     %不同输出方法的测试
% subplot(1,2,2);
imshow(uint8(img4));
figure(3)
subplot(1,2,1)
imshow(img1,[]);
subplot(1,2,2)
(imshow(img3,[]));
title('roberts')

figure(2);                                                          %自带函数输出
My = fspecial('laplacian',0.5);
outim = imfilter(double(img1), My,'replicate'); 

imshow(outim);
colormap gray;
%%
% close all 
% clear
% clc
% img=imread('yingcao.jpg');
% [M,N,~]=size(img);
% % img1=img(:,:,2);
% % img1=(img(:,:,1)+img(:,:,2)+img(:,:,3))/3;
% img1=rgb2gray(img);
% 
% % img1=img;
% % sigma = 0.5;%高斯滤波
% % gausFilter = fspecial('gaussian',[5 5],sigma);
% % img1=imfilter(img1,gausFilter,'replicate');
% 
% level=graythresh(img1);     %确定灰度阈值
% % img1=im2bw(img1,level);
% ba=img1;
% % SE1=strel('square',2);
% % ba = imclose(ba, SE1);
% % ba = imopen(ba, SE1);
% 
% imshow(img1,[])
% figure
% imshow(img);
% outim = edge(ba,'sobel'); %边缘图
% figure
% imshow(~outim)
