%使用PCA对Hopkins 155降到2维可视化
function []=PCAtext(p)
%close all;clear;clc;
%-------------------------导入数据集
load HopKins155
%-------------------------
fea=data(p).X;
fea=fea';
gnd=data(p).ids;
%-------------------------进行PCA降维
[coeff,score,latent]=pca(fea);
%-------------------------输出前两维的方差
sum(latent(1:2)/sum(latent));
%-------------------------变换后
fea=fea*coeff(:,1:2);
%-------------------------根据gnd绘图
n=length(gnd);
Y=cell(n,1);
for i=1:n
    if(gnd(i)==1)
        Y(i)={'Label1'};
    end
        if(gnd(i)==2)
            Y(i)={'Label2'};
        end
            if(gnd(i)==3)
            Y(i)={'Label3'};
            end
   
end       
gscatter(fea(:,1),fea(:,2),Y,'br','xo*');