function Output = resizeNEAREST(H,W,Input)

% 最邻近插值法
% 行缩放rerow 列缩放 recol 行倍数H 列倍数W
% H = 3;W = 3;

row = size(Input,1);
col = size(Input,2);%图像行数和列数
rerow = round(row*H);
recol = round(col*W);
Output = zeros(rerow,recol,3);

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
            Output(i,j,:) = Input(indexX,indexY,:);      
    end
 end

Output = uint8(Output);
figure
imshow(Output);