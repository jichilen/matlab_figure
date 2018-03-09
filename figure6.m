clear
close all
im=imread('cell1.bmp');
imshow(im);
img=rgb2gray(im);
img=im2double(img);
[m,n]=size(img);
% sigma = 1.6;%高斯滤波
% gausFilter = fspecial('gaussian',[5 5],sigma);
% img=imfilter(img,gausFilter,'replicate');
% img=medfilt2(img);
level = graythresh(img); %获取阈值
imgbw = im2bw(img,level);%根据阈值二值化图像
figure()
subplot(1,2,1);
imshow(imgbw)
title('graythresh')
SE=strel('disk',4,0);
imgbw = imclose(imgbw, SE);%闭运算
% imgbw=imclearborder(~imgbw,4);
subplot(1,2,2);
imshow(imgbw)
a = bwconncomp(imgbw); %返回连通域结构
im_flag = bwlabel (~imgbw,a.Connectivity);%标志二值图中连通域
tic;
im_fi=zeros(m,n);
for i=1:max(max(im_flag))
    im_modle=im_flag;
    im_modle(im_flag~=i) = 0;

    im_modle=logical(im_modle);
    im_show = img;
    im_show(im_modle==0) = 0;

    
    c_dst = img(im_modle);
    if(length(c_dst)<500)
        continue;
    end
    level = graythresh(c_dst); %获取阈值
    im_show(im_show>level)=128;
    im_show(im_show==0)=255;
    im_show(im_show<=level)=0;
    im_fi=im_fi+255-im_show;
    nucl=sum(sum(im_show==0));
    cytop=sum(sum(im_show==128));
    figure()
    imshow(im_show,[]);
    title(num2str(nucl/(cytop)));
end
figure()
imshow(255-im_fi,[])
toc;

im_fi(im_fi==127)=0;
for i=1:3
    im1=im(:,:,i);
    im1(bwperim(im_fi))=255;
    im1(bwperim(im_flag))=255;
    im(:,:,i)=im1;
end
figure
imshow(im);