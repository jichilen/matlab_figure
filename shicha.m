clear
% img1=imread('shrimp_right.jpg');%物体在左边 相机在右
% img2=imread('shrimp_left.jpg');
% 
% img1=(rgb2gray(img1));
% img2=(rgb2gray(img2));
% 
% I=imsubtract(img2,img1);
% I(I>50)=255;
% I(I<50)=0;


a=zeros(20,20);
b=zeros(20,20);
a(3:16,2)=10;
a(3:13,5)=2;
b(3:16,17)=10;
b(3:13,19)=2;
img1=a;
img2=b;
subplot(2,2,1)
imshow(img1,[])
title('右眼视图')
subplot(2,2,2)
imshow(img2,[])
title('左眼视图')


% img1=255-img1;
% img2=255-img2;

 

img1=(double(img1));
img2=(double(img2));

del=100;
b=ones(3,3);
% b=conv2(b,b,'same');
% b=b/max(max(b));
[m,n]=size(img1);


c=99999*ones(m,n);
for k=1:del
    img3=img2(:,k:n);
    img4=img1(:,1:n-k+1);
    img5=conv2(abs(img3-img4),b,'same');
%     img6=conv2((img3-img4),b,'same');
%     img5=abs(img6);
    [p,q]=size(img5);
    for i=1:q
        for j=1:p
            if((img5(j,i))<c(j,i))
                c(j,i)=img5(j,i);
                d(j,i)=k;
            end
        end
    end
    
end
d=uint8(d);
dd=d;
% dd(~I)=0;
subplot(2,2,3)
imshow(d,[])
title('视差视图')
% figure()
% imshow(c,[])


