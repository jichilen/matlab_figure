close all;
im=im_modle;
SE=strel('disk',20,0);
im = imclose(im, SE);%БедЫЫу
SE=strel('disk',20,0);
im = imclose(im, SE);%БедЫЫу
SE=strel('line',2,90);
im1 = imerode(im, SE);%БедЫЫу
im=im-im1;
figure()
imshow(im)
[m,n]=size(im);
lent=zeros(n,1);
for i=1:n
   a=find(im(:,i)==1);
   if (~isempty(a))
   lent2(i)=a(2);
   lent1(i)=a(1);
   end
end
img=imread('1.jpg');
img=rgb2gray(img);
img1=img;
img1(im_modle==0)=0;
img2=img1;
figure();
imshow(img1);
for i=1:length(lent1)
    for j=1:max(lent2-lent1)
        img1(lent2(1)+1-j,i)=img1(lent2(i)-j+1,i);
    end
end

figure();
imshow(img1);

