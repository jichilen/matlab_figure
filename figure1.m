img=imread('02.jpg');   %图像读取
[filename,pathname]=uigetfile('*.*','choose a picture');
path = [pathname filename];
% path='D:\data\fangyi-20171015\data1\training\anheshang01\001\000002.jpg'
img = imread(path);


h=zeros(1,256);         %初始化
hc=zeros(1,256);
img1=img;
% img1=img(:,:,2);
img1=rgb2gray(img);
[w,l]=size(img1);       %读取数据大小

subplot(2,3,1)
imshow(img1);           %原图直方图
title('origin')
subplot(2,3,2)
imshow(histeq(img1,256));%系统自带histep直方图
title('histeq')

for i=1:w                %统计亮度
    for j=1:l
%         for k=0:255
%             if img1(i,j)==k;
%                 h(k)=h(k)+1;
%             end
%         end
        h(img1(i,j)+1) = h(img1(i,j)+1) + 1;
    end
end
hc(1)=h(1);              %累计亮度
for i=2:256
    hc(i)=hc(i-1)+h(i);
end
t=round(hc.*255./w./l);  %映射
img2=img1;
for i=1:w
    for j=1:l       
       img2(i,j)=t(img1(i,j)+1);
    end
end

subplot(2,3,3)
imshow(img1);
subplot(2,3,4)
imhist(img1);
title('my work')
subplot(2,3,5)
imhist(img2)
subplot(2,3,6)
bar(h)
% axis([1 255 0 3000])