function [Kontur,x,y]=bwcontour_modified(I)

% figure;
%----------------------
K=contour (I, [1,1]);%返回一个二行矩阵，矩阵组成见官网
%----------------------
% contour cordinates
x=[];
y=[];
%first part
idx=1; % showing the number of points
Konturlaenge=K(2,idx);%第二行的idx位置，即该等高线包含的顶点个数，用于绘图


sum_Konturlaenge=Konturlaenge+0;
while (sum_Konturlaenge) < size(K,2)

        x=[x K(1,idx+1:idx+Konturlaenge)];
        y=[y K(2,idx+1:idx+Konturlaenge)];%确认绘图坐标
        idx=idx+Konturlaenge+1;%寻找二行矩阵K中的下一个表示顶点个数的位置

    if idx< size(K,2)
        Konturlaenge=K(2,idx);
    end
    sum_Konturlaenge=Konturlaenge+sum_Konturlaenge+1;
end

Kontur=zeros(size(I,1),size(I,2));
for i=1:size(x,2)
    Kontur(y(i),x(i))=1;
end
% figure;imshow(Kontur)
