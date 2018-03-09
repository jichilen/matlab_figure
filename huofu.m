im=imread('E:\学习资料\课设\UCSD_Anomaly_Dataset\UCSDped1\Test\Test003\Test003\003.tif');
% SE=strel('line',2,90);
% im1 = imerode(im, SE);
% im=im-im1;
% figure() 
% imshow(im)

f=im;  
    
[H, theta, rho]= hough(f,'RhoResolution',1);    
%imshow(theta,rho,H,[],'notruesize'),axis on,axis normal    
%xlabel('\theta'),ylabel('rho');    
    
peak=houghpeaks(H,5);    
hold on    
    
lines=houghlines(f,theta,rho,peak);    
figure,imshow(f,[]),title('Hough Transform Detect Result'),hold on    
for k=1:length(lines)    
    xy=[lines(k).point1;lines(k).point2];    
    plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[.6 .6 .6]);    
end    