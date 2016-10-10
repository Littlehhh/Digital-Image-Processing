function Output = resizeNEAREST(H,W,Input)
%最邻近插值
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
    for j=1:recol; 
        indexX = round(i/H);
        indexY = round(j/W);
        %边界处理
        if indexX <1
           indexX=1;
        end
        if indexY <1                         
            indexY=1;  
        end
        if indexX >row
            indexX=row; 
        end
        if indexY >col
            indexY=col;
        end
            Output(i,j) = Input(indexX,indexY);      
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);