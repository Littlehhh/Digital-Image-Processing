%行缩放rerow 列缩放 recol 行倍数H 列倍数L
%最邻近插值
H = 3;
L = 3;
Input = InputPicture();
imshow(Input);
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*L);
Output = zeros(rerow,recol);



 for i=1:rerow;
    for j=1:recol;              
        
        if i/H <1
            Output(i,j) = Input(1,1);
        end
        if j/L <1                         %边界处理
            Output(i,j) = Input(1,1);
        end
        if i/H >row
            Output(i,j) = Input(row,j/L);
        end
        if i/L >col
            Output(i,j) = Input(i/H,col);
        end
        if i/H>=1&&j/L>=1&&i/H<=row&&i/L<=col
            Output(i,j) = Input(round(i/H),round(j/L));
        end
        
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);