clc;
close all;
clear all;
p1='C:\Users\y\Desktop\�Ǽܳ���\�Ǽ�ͼ��\';
D1=dir([p1 '*.bmp']); %ȡ���ļ����������ͼƬ
lengthD1=length(D1);%ͼƬ����       
pointsnum=zeros(lengthD1,1);%ÿ��ͼƬ�˵����
imagename=[];
for j= 1:lengthD1
        I = imread([ p1 D1(j).name]);
        imagename{j}=D1(j).name;%����ͼƬ���֣�֪������һ��ͼ
        [k,g]=size(I);
        % T=I(120:240,330:400); %��ȡһ����ͼ��
        T=im2bw(I); %ת���ɶ�ֵͼ��
        X=bwmorph(T,'bridge');%��̬ѧ������
        X=Fill(X);
        X=T+X;
        X=bwmorph(X,'skel',Inf);%�Ǽ���ȡ
        A=bwperim(X,4);%��ȡͼ�εı�Ե����������ȡ�߽��
        B=bwmorph(A,'endpoints');%Ѱ�Ҷ˵㣬�ҹǼܵĽ�����
        B1=bwmorph(A,'endpoints');
        B=bwmorph(B,'clean');
        B=B1-B;
        B=bwmorph(B,'fill');
        M=imfill(T,'holes');%ͼ����䣬����ֵͼ���еĿն�����
        C=M-T;%��ȡ�������
        [m,n]=find(B>0);%��ȡ�˵�����

        [M,N]=size(m);%�˵����
        pointsnum(j,1)=M;
        
        [x,y]=find(C>0);%��ȡ�����������,xy����������x(a)��ʾ�������ĵ�a�е�Ԫ��ֵ
        [ymax,a]=max(y);%��ȡ������˵�����,�ҵ����������ÿ�е����ֵ�����������е�����
        [ymin,b]=min(y);
        figure %��ͼ
          imshow(X);
        hold on
        plot(n,m,'r.','markersize',20);%n--j,m--i
end
save pointsnum.mat pointsnum;
save imagename.mat imagename;
a=sum(pointsnum)