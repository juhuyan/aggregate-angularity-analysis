function [ NewMap ] = Fill( Mat )
%Fill Summary of this function goes here
%   �ͼƬ�еĶ���
NewMap=Mat;
[x,y]=size(Mat);
for m=2:x-1
    for n=2:y-1
%         if Mat(m-1,n-1)+Mat(m-1,n)+Mat(m-1,n+1)+Mat(m,n-1)+Mat(m,n+1)+Mat(m+1,n-1)+Mat(m+1,n)+Mat(m+1,n+1)==2
        if ((Mat(m-1,n-1)+Mat(m+1,n+1)==2) &&(Mat(m,n)==1)&&( Mat(m-1,n)+Mat(m-1,n+1)+Mat(m,n-1)+Mat(m,n+1)+Mat(m+1,n-1)+Mat(m+1,n)==0))||((Mat(m-1,n+1)+Mat(m+1,n-1)==2) &&(Mat(m,n)==1)&&( Mat(m-1,n-1)+Mat(m-1,n)+Mat(m,n-1)+Mat(m,n+1)+Mat(m+1,n)+Mat(m+1,n+1)==0))
            NewMap(m,n)=0;%ȥ��bridge�������һЩ���ŵ�
        end
        if (Mat(m,n)+Mat(m-1,n)==2) && (Mat(m+1,n)+Mat(m+2,n)==0) && (Mat(m+3,n)==1) && (Mat(m+4,n-1)==1) && (Mat(m+3,n-1)==0)%�ͼƬ�е�ĳЩ�������
            NewMap(m+1,n)=1;
            NewMap(m+2,n)=1;
        end
    end
end
end

