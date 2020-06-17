    clear
    clc
   figure(1)
 for i=0:20
    origImg=imread(['C:\Users\lenovo\Desktop\近期\图片\图片\QQMail_',num2str(i),'.png']);
    grayImg=rgb2gray(origImg);
    level=graythresh(grayImg)
    bwImg=imbinarize(grayImg,level);
    ctImg=bwcontour(bwImg);
    saveas(1,['D:\op\2\QQMail_',num2str(i),'(binarized_level_',num2str(level),').jpg']);%导出
 end