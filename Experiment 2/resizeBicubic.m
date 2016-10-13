function Output = resizeBicubic(H,W,Input)
%双三次插值 
%行缩放后行数rerow 列缩放后列数recol 行倍数H 列倍数W
%clc,clear; 
%Input=InputPicture();  
Input=double(Input);
%H = 3;
%W = 3;
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*W);
Output = zeros(rerow,recol);
for i=1:rerow;                
   u = i/H-floor(i/H);%计算坐标小数部分
   indexX = round((i+0.5)/H-0.5);
   A=[sw(1+u) sw(u) sw(1-u) sw(2-u)]; %插值公式   
  for j=1:recol; 
     v = j/W-floor(j/W);%计算坐标小数部分
     indexY = round((j+0.5)/W-0.5);
     C=[sw(1+v);sw(v);sw(1-v);sw(2-v)]; %插值公式
       %边界处理
    if indexX <2
        indexX=2;
    end
    if indexY <2                         
        indexY=2;  
    end
    if indexX >row-2
        indexX=row-2;           
    end
    if indexY >col-2
        indexY=col-2;
    end
    %插值公式
     B=[Input(indexX-1,indexY-1)   Input(indexX-1,indexY) Input(indexX-1,indexY+1) Input(indexX-1,indexY+2) 
        Input(indexX,indexY-1)     Input(indexX,indexY)   Input(indexX,indexY+1)   Input(indexX,indexY+2) 
        Input(indexX+1,indexY-1)   Input(indexX+1,indexY) Input(indexX+1,indexY+1) Input(indexX+1,indexY+2) 
        Input(indexX+2,indexY-1)   Input(indexX+2,indexY) Input(indexX+2,indexY+1) Input(indexX+2,indexY+2)]; 
     Output(i,j)=(A*B*C);  %利用双三次插值公式对新图象所有像素赋值 
   end 
end 
Output=uint8(Output); 
figure,imshow(Output);
title('双三次插值放大的图像');     %显示插值后的图像 
