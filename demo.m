clc;
close all;
clear all;
p1='C:\Users\y\Desktop\骨架程序\骨架图像\';
D1=dir([p1 '*.bmp']); %取子文件夹里的所有图片
lengthD1=length(D1);%图片个数       
pointsnum=zeros(lengthD1,1);%每幅图片端点个数
imagename=[];
for j= 1:lengthD1
        I = imread([ p1 D1(j).name]);
        imagename{j}=D1(j).name;%保存图片名字，知道是哪一幅图
        [k,g]=size(I);
        % T=I(120:240,330:400); %截取一部分图像
        T=im2bw(I); %转换成二值图像
        X=bwmorph(T,'bridge');%形态学闭运算
        X=Fill(X);
        X=T+X;
        X=bwmorph(X,'skel',Inf);%骨架提取
        A=bwperim(X,4);%提取图形的边缘，四邻域提取边界点
        B=bwmorph(A,'endpoints');%寻找端点，找骨架的结束点
        B1=bwmorph(A,'endpoints');
        B=bwmorph(B,'clean');
        B=B1-B;
        B=bwmorph(B,'fill');
        M=imfill(T,'holes');%图像填充，填充二值图像中的空洞区域
        C=M-T;%提取填充区域
        [m,n]=find(B>0);%提取端点坐标

        [M,N]=size(m);%端点个数
        pointsnum(j,1)=M;
        
        [x,y]=find(C>0);%提取填充区域坐标,xy是列向量，x(a)表示列向量的第a行的元素值
        [ymax,a]=max(y);%获取闭区域端点坐标,找到这个矩阵中每列的最大值和它在这列中的行数
        [ymin,b]=min(y);
        figure %绘图
          imshow(X);
        hold on
        plot(n,m,'r.','markersize',20);%n--j,m--i
end
save pointsnum.mat pointsnum;
save imagename.mat imagename;
a=sum(pointsnum)