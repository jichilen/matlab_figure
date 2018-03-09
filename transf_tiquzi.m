
function img5=transf_tiquzi(im_modle)
img=imread('1.jpg');
img=rgb2gray(img);
img2=img;
img2(im_modle==0)=0;

img2=im2double(img2);
c_dst = img2(im_modle==1);
level = graythresh(c_dst); %获取阈值
img2(img2>level)=255;
img2(img2==0)=255;
img2(img2<=level)=0;
img1=img2;
SE=strel('disk',2,0);
SE1=strel('disk',2,0);
SE2=strel('line',40,90);
SE3=strel('line',2,0);
% img2 = imclose(img2, SE1);%闭运算
% img2 = imopen(img2, SE);%闭运算
% img2 = imopen(img2, SE);%闭运算
img2 = imerode(img2, SE2);

img2 = imdilate(img2, SE2);
img2 = imerode(img2, SE3);


% 
% figure();
% imshow(img1);
% figure();
% imshow(img2);


[m,n]=size(img2);
a = bwconncomp(img2,8); %返回连通域结构
ba1 = bwlabel (~img2,8);%标志二值图中连通域
for k=1:max(max(ba1))
    c_dst=ba1(ba1==k);
    if(length(c_dst)<5)
        ba1(ba1==k)=0;
    end
end
ba1 = logical(ba1);


ba1 = bwlabel (ba1,8);
ba_m=ba1;
img3=img2;
img4=img1;
img5=255*ones(m,n);
for k=2:max(max(ba1))-1
    [x0,y0]=(find(ba1==1));    
    [x1,y1]=(find(ba1==k-1));
    [x2,y2]=(find(ba1==k));
    [x3,y3]=(find(ba1==k+1));
    xielv1=(max(x2)-max(x1))/(min(y2)-min(y1));
    xielv2=(max(x2)-max(x3))/(min(y2)-min(y3));
    if(abs(xielv2-xielv1)>0.3)
        xielv=min(xielv2,xielv1);
    else
        xielv=(xielv2+xielv1)/2;
    end
%     if((max(y2)-min(y2)>30)||(max(y3)-min(y3)>30)||(max(y1)-min(y1)>30))
%         xielv=0;
%     else 
%         xielv=(xielv1+xielv2)/2;
%     end
    dis=max(x0)-max(x2);
    dis1=max(x0)-max(x1);
    dis2=max(x0)-max(x3);
    if(dis<0)
        if((dis<dis1&&dis<dis2))
            dis=(dis1+dis2)/2;
        end
    elseif(dis>0)
        if((dis>dis1&&dis>dis2))
            dis=(dis1+dis2)/2;
        end
    end
    for i=1:(max(y2)-min(y2))
        for j=1:(max(x2)-min(x2))
            img5(max(x2)-j+1+round(dis),min(y2)+i-1)=img4(max(x2)-j+1+round(xielv*(i-1)),min(y2)+i-1);
        end
    end
end
img5=255-img5;
% figure()
% imshow(img5);
