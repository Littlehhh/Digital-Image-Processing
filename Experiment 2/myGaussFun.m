function Y = myGaussFun(X,u,sigma)
% clc
% clear all
% X = 1:50;
% u = 25;
% sigma = 0.1;
Y = exp(-((X-u).^2)/(2*sigma^2));
% Y = Y/sum(Y); %πÈ“ªªØ
% CDF = zeros(1,256);
% CDF(1)=Y(1);
% for i=2:256;
%     CDF(i)= Y(i)+CDF(i-1);
% end
% plot(X,Y)




