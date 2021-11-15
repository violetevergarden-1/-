%使用PCA对Hopkins 155测试降维前后运行时间
close all;clear;clc;
load HopKins155
lambda=4;%子空间聚类算法参数
Time=zeros(length(data),1);
Time2=zeros(length(data),1);
Time4n=zeros(length(data),1);
%-----------------------------降维到2维运行时间
for i=1:156
    %初始化数据
    fea=data(i).X;%样本矩阵D*N
    gnd=data(i).ids;%真实标签N*1
    N=length(gnd);%样本数目
    n=max(gnd);%子空间类别
    r=2;%降维后的维数
    %PCA降维
    fea=fea';
    [coeff,score,latent]=pca(fea);
    fea=fea*coeff(:,1:r);
    fea=fea';
    tic;%tic
    [Err3]=Text(fea,gnd,lambda);
    Time2(i)=toc;
    disp(['降维到2第',num2str(i),'次循环运行时间：',num2str(Time2(i))]);
    
end
%-----------------------------未降维运行时间
for i=1:156
    %初始化数据
    fea=data(i).X;%样本矩阵D*N
    gnd=data(i).ids;%真实标签N*1
    N=length(gnd);%样本数目
    n=max(gnd);%子空间类别
    r=4*n;%降维后的维数
    %PCA降维
    fea=fea';
    [coeff,score,latent]=pca(fea);
    fea=fea*coeff(:,1:r);
    fea=fea';
    tic;%tic
    [Err3]=Text(fea,gnd,lambda);
    Time(i)=toc;
    disp(['未降维第',num2str(i),'次循环运行时间：',num2str(Time(i))]);
end
%-----------------------------降维到4n运行时间
for i=1:156
    %初始化数据
    fea=data(i).X;%样本矩阵D*N
    gnd=data(i).ids;%真实标签N*1
    N=length(gnd);%样本数目
    n=max(gnd);%子空间类别
    r=4*n;%降维后的维数
    %PCA降维
    fea=fea';
    [coeff,score,latent]=pca(fea);
    fea=fea*coeff(:,1:r);
    fea=fea';
    tic;%tic
    [Err3]=Text(fea,gnd,lambda);
    Time4n(i)=toc;
    disp(['降维到4n第',num2str(i),'次循环运行时间：',num2str(Time4n(i))]);
end