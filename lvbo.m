% clear;
im=imread('grid.bmp');
im=I3;
s=(fftshift(fft2(im)));
s1=abs(s);
figure(1)
subplot(1,2,1)
imshow(im)
title('原图')
subplot(1,2,2)
imshow(s1,[]);
title('频谱图')
% s2=(s1-min(min(s1)))/(max(max(s1))-min(min(s1)))*225;
% subplot(1,3,3)
% imshow(uint8(s2));

figure(2)
subplot(1,2,1)
imshow(im);
subplot(1,2,2)
im1=uint8(ifft2(ifftshift(s)));
imshow(im1);
[M,N]=size(s);
n1=floor(M/2);
n2=floor(N/2);
d0=4;
d1=10;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if (d<=d0||d>=d1)
            h1=1;
        else
            h1=0;
        end
        if d>=d1
            h2=1;
        else
            h2=0;
        end     
        g1(i,j)=h1*s(i,j);
        g2(i,j)=h2*s(i,j);
    end
end
g3=s;
for i=1:10
    for j=1:10
        g3(n1+5+i,n2+5+j)=200;
    end
end

figure(3);
subplot(1,2,1);imshow(g1,[])
g1=ifftshift(g1);
g1=uint8(real(ifft2(g1)));                %理想低通滤波结果
subplot(1,2,2);imshow(g1);
title('滤去中频部分')
figure(4);
subplot(1,2,1);imshow(g2,[])
g2=ifftshift(g2);
g2=uint8(real(ifft2(g2)));                %显示理想高通滤波结果
subplot(1,2,2);imshow(g2);
title('理想高通滤波结果')

g3=s;
g3(n1+50,n2+50)=(max(max(g3))+min(min(g3)))/3*2;
g3(n1-50,n2-50)=(max(max(g3))+min(min(g3)))/3*2;
figure(5);
subplot(1,2,1);imshow(abs(g3),[])
g3=ifftshift(g3);
g3=uint8(real(ifft2(g3)));                %三角插值
subplot(1,2,2);imshow(g3);
title('sin')




