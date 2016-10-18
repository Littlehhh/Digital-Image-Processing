function CDF = caculateCDF(Input)
%求累计分布函数
%此函数可以由一些内置函数代替  等同于
%hist=imhist(Input);
%cdf = cumsum(hist) / numel(Input);
PDF = zeros(1,256);
num = zeros(1,256);
for i=1:256;
    num(i) = sum(histc(Input,i-1));
end
PDF = num./numel(Input);
%累计分布函数
CDF = zeros(1,256);
CDF(1)=PDF(1);
for i=2:256;
    CDF(i)= PDF(i)+CDF(i-1);
end

% CDF(1)=Y(1);
% for i=2:256;
%     CDF(i)= Y(i)+CDF(i-1);
% end



