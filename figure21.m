clc;clear;
img=imread('lena.bmp');
img1=imnoise(img,'gaussian');   
img2=imnoise(img,'salt & pepper');
img3=img+uint8(randn(size(img)).*50);
subplot(1,3,1)
imshow(img1);
title('gaussian')
subplot(1,3,2)
imshow(img2);
title('salt & pepper')
subplot(1,3,3)
imshow(img3);
title('random')
sigma = 1.6;
gausFilter = fspecial('gaussian',[5 5],sigma);
im1=imfilter(img2,gausFilter,'replicate');
figure()
subplot(1,2,1)
imshow(im1);
title('gaussian fliter')
im2=medfilt2(img2);
subplot(1,2,2)
imshow(im2);
title('median filter')