% clear all clc  
% I=imread('1.jpg'); 
I=rgb2gray(I_enhanced_sub);
subplot(121),imshow(I); 
title('ԭͼ')  
I=double(I); 
[M,N]=size(I); 
rL=0.2;       
rH=2;   % �ɸ�����ҪЧ���������� 
c=3; d0=10;  
I1=log(I+1);%ȡ���� 
FI=fft2(I1);%����Ҷ�任 
n1=floor(M/2); 
n2=floor(N/2); 
for i=1:M 
    for j=1:N   
        D(i,j)=((i-n1).^2+(j-n2).^2);  
        H(i,j)=(rH-rL).*(exp(c*(-D(i,j)./(d0^2))))+rL; %��˹̬ͬ�˲� 
    end
end
I2=ifft2(H.*FI);%����Ҷ��任 
I3=(real(exp(I2)));  
I3=uint8((I3-min(min(I3)))/(max(max(I3))-min(min(I3)))*225);
subplot(122),imshow(I3,[]); 
title('̬ͬ�˲���ǿ��')
tt=1-exp(-c*D./(d0^2));
