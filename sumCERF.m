function R = sumCERF(Input,Output)

[m,n] = size(Input);
sumPix = m*n;
[m,n] = size(Output);
sumPix2 = m*n;
for i=1:256;
    P(i) = sum(histc(Input,i-1))/sumPix;
    F(i) = sum(histc(Output,i-1))/sumPix2;
end
    %CERF1(i+1)= P(i)*log(P(i)/F1(i))+CERF1(i);
   % CERF2(i+1)= P(i)*log(P(i)/F2(i))+CERF2(i);
    CERF= P.*log(P./F);
    CERF(isnan(CERF))=0;
    R=sum(CERF);
  