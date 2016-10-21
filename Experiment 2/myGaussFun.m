function Y = myGaussFun(X,u,sigma)
%生成高斯函数
Y = exp(-((X-u).^2)/(2*sigma^2));
% Y = Y/sum(Y); %归一化





