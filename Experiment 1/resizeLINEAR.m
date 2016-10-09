function Output = resizeLINEAR(H,W,Input)

%行缩放rerow 列缩放 recol 行倍数H 列倍数W
%双线性内插
%H = 3;
%W = 3;
%Input = InputPicture();
%imshow(Input);
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*W);
Output = zeros(rerow,recol);



for i=1:rerow;
    for j=1:recol;
        u = i/H-floor(i/H);
        v = j/W-floor(j/W);
        %边界处理
        indexX = round(i/H);
        indexY = round(j/W);
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
                         + (1-u)*v*Input(indexX,indexY+1) + u*v*Input(indexX+1,indexY+1);
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);

