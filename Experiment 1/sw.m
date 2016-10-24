function A=sw(w1) 
-%双三次插值核函数
-%双三次插值又称立方卷积插值
-
-%          | 1-2×（Abs（x））^2+（Abs（x））^3，0≤Abs（x）<1
-%S（x） =  | 4-8×Abs（x）+5×（Abs（x））^2-（Abs（x））^3，1≤Abs（x）<2
-%          |0，Abs（x）≥2
w=abs(w1); 
if w<1&&w>=0    
    A=1-2*w^2+w^3; 
elseif w>=1&&w<2    
    A=4-8*w+5*w^2-w^3; 
else
    A=0; 
end