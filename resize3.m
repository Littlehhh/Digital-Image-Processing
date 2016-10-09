%行缩放rerow 列缩放 recol 行倍数H 列倍数L
%双线性内插
H = 2;
L = 2;
Input = InputPicture();
imshow(Input);
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*L);
Output = zeros(rerow,recol);



 for i=1:rerow-1;
    for j=1:recol-1;
        u = round(i/H);
        v = round(j/L);
        %边界处理
        if i/H <1
            Output(i,j) = Input(1,1);
        end
        if j/L <1
            Output(i,j) = Input(1,1);
        end
        if i/H >row
            Output(i,j) = Input(row,j/L);
        end
        if i/L >col
            Output(i,j) = Input(i/H,col);
        end
        if i/H>=1&&j/L>=1&&i/H<=row&&i/L<=col
            Output(i,j) = (i/H-u)*(j/L-v)*Input(round(i/H),round(j/L)) + u * (j/L-v) * Input(round(i/H)+1,round(j/L)) ...
                         + (i/H-u)*v*Input(round(i/H),round(j/L)+1) + u*v*Input(round(i/H)+1,round(j/L)+1);
        end
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);

%P(m,n)=(1-u)*(1-v)*z(i,j)+(1-u)*v*z(i,j+1)+u*(1-v)*z(i+1,j)+u*v*z(i+1,j+1)
