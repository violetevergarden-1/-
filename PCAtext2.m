%使用Hopkins数据集测试，使用PCA降维到4F前后子空间聚类效果
%--------------------------导入数据集
%close all;clear;clc;
function [Err3]=PCAtext2(p)
load Hopkins155
fea=data(p).X;
gnd=data(p).ids;
N=length(gnd);%样本个数
n=max(gnd);%子空间类别数
r=4*n;%降维后的维数
lambda=1;
%-------------------------初始子空间聚类
 %[Err]=Text(fea,gnd,lambda);
%------------------------主成分分析
fea=fea';
[coeff,score,latent]=pca(fea);
%-------------------------PCA降维到4n后子空间聚类
% fea4r=fea*coeff(:,1:r);
% fea4r=fea4r';
% [Err2]=Text(fea4r,gnd,lambda);
%-------------------------PCA降维到2后子空间聚类
fea2=fea*coeff(:,1:2);
fea2=fea2';
[Err3]=Text(fea2,gnd,lambda);

