%通过调整过的bwcontour_modified函数来取得散点坐标，通过taubin方法拟合椭圆并用ezplot绘图
clear 
clc
% dots=[0.6,1;1,2;1,-0.5;4,1;3,2;3,0.1;0.2,0.3;3.3,1.2;3.5,0.1]
% x=dots(:,1)
% y=dots(:,2)
origImg=imread(['C:\Users\lenovo\Desktop\近期\图片\1.png']);
grayImg=rgb2gray(origImg);
level=graythresh(grayImg)
bwImg=imbinarize(grayImg,level);
[ctImg,x,y]=bwcontour_modified(bwImg);
figure(2)
plot(x,y,'.c');hold on;
dots=[x;y]'
a = EllipseFitByTaubin(dots);
str1=['(',num2str(a(1)),')*x^2+(',num2str(a(2)),')*x*y+(',num2str(a(3)),')*y^2+(',num2str(a(4)),')*x+(',num2str(a(5)),')*y +(',num2str(a(6)),')=0']
handle=ezplot(str1,[-100 1000 -100 1000])
set(handle,'color','r','LineWidth',2)
% f = @(x,y) a(1)*x.^2 +a(2)*x*y+a(3)* y.^2+a(4)*x+a(5)*y +a(6);%这两行也可替代ezplot
% fimplicit(f,[-100 1000 -100 1000])


