img=imread('coins.png');
img=im2double(img);
img1=img;
level = graythresh(img); %获取阈值
imgbw = im2bw(img,level);%根据阈值二值化图像
subplot(1,2,1);
imshow(imgbw)
title('graythresh')


img=imread('coins.png');
img=double(img);
img=img+1;
[M,N]=size(img);
p=zeros(1,256);
d=zeros(1,256);
w0=zeros(1,256);
u0=zeros(1,256);
for i=1:M
    for j=1:N
        p(img(i,j))=p(img(i,j))+1;
    end
end

p=p/(sum(p));
w0(1)=p(1);
u0(1)=1*p(1);
for i=2:256
        w0(i)=w0(i-1)+p(i);
        u0(i)=u0(i-1)+i*p(i);
end
for i=1:255
    if(u0(i)~=0)
    d(i)=w0(i)*(1-w0(i))*(u0(i)/w0(i)-(u0(256)-u0(i))/(1-w0(i)))^2;
    end
end

[a,d1]=max(d);
% for i=1:M
%     for j=1:N
%         if(img(i,j)<(d1-1));
%             img(i,j)=0;
%         else
%             img(i,j)=255;
%         end
%         
%     end
% end
img(img<(d1-1))=0;
img(img>=(d1-1))=255;
subplot(1,2,2)
img=imfill(img,'holes');
figure()
imshow(uint8(img));
img=im2double(uint8(img));
img1=img1.*img;
figure()
imshow(img1);
title('my work')