function Output = resizeLINEAR2(H,W,Input)
%双线性内插
%行缩放后行数rerow 列缩放后列数recol 行倍数H 列倍数W
%H = 3;
%W = 3;
%Input = InputPicture();
%imshow(Input);
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*W);
Output = zeros(rerow,recol);

for i=1:rerow;
    u = i/H-floor(i/H); %计算坐标小数部分
    indexX = round((i+0.5)/H-0.5);
    for j=1:recol;
        v = j/W-floor(j/W); %计算坐标小数部分
        indexY = round((j+0.5)/W-0.5);
        %边界处理
        if indexX <1
           indexX=1;
        end
        if indexY <1                         
            indexY=1;  
        end
        if indexX >row-1
            indexX=row-1;           
        end
        if indexY >col-1
            indexY=col-1;       %双线性内插容易丢失边界信息
        end
            Output(i,j) = (1-u)*(1-v)*Input(indexX,indexY) + u * (1-v) * Input(indexX+1,indexY) ...
                         + (1-u)*v*Input(indexX,indexY+1) + u*v*Input(indexX+1,indexY+1);%内插公式
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);