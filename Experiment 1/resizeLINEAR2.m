function Output = resizeLINEAR2(H,W,Input)
%˫�����ڲ�
%�����ź�����rerow �����ź�����recol �б���H �б���W
%H = 3;
%W = 3;
%Input = InputPicture();
%imshow(Input);
[row,col] = size(Input);
rerow = round(row*H);
recol = round(col*W);
Output = zeros(rerow,recol);

for i=1:rerow;
    u = i/H-floor(i/H); %��������С������
    indexX = round((i+0.5)/H-0.5);
    for j=1:recol;
        v = j/W-floor(j/W); %��������С������
        indexY = round((j+0.5)/W-0.5);
        %�߽紦��
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
            indexY=col-1;       %˫�����ڲ����׶�ʧ�߽���Ϣ
        end
            Output(i,j) = (1-u)*(1-v)*Input(indexX,indexY) + u * (1-v) * Input(indexX+1,indexY) ...
                         + (1-u)*v*Input(indexX,indexY+1) + u*v*Input(indexX+1,indexY+1);%�ڲ幫ʽ
    end
 end
 
 
Output = uint8(Output);
figure
imshow(Output);