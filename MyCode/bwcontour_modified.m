function [Kontur,x,y]=bwcontour_modified(I)

% figure;
%----------------------
K=contour (I, [1,1]);%����һ�����о��󣬾�����ɼ�����
%----------------------
% contour cordinates
x=[];
y=[];
%first part
idx=1; % showing the number of points
Konturlaenge=K(2,idx);%�ڶ��е�idxλ�ã����õȸ��߰����Ķ�����������ڻ�ͼ


sum_Konturlaenge=Konturlaenge+0;
while (sum_Konturlaenge) < size(K,2)

        x=[x K(1,idx+1:idx+Konturlaenge)];
        y=[y K(2,idx+1:idx+Konturlaenge)];%ȷ�ϻ�ͼ����
        idx=idx+Konturlaenge+1;%Ѱ�Ҷ��о���K�е���һ����ʾ���������λ��

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
