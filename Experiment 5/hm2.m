close all
Input1=double(InputPicture());
Input = fftshift(fft2(Input1));
Input = abs(Input);

Input = log(Input);
%mesh(Input)
imshow(Input,[])
%选取对角线
%[x,y] = ginput(4);
[length,width] = size(Input);
% Mask = 1-LPF(floor(y(2)-y(1)),floor(x(2)-x(1)),'ideal',max(x(2)-x(1),y(2)-y(1)),1);
% Mask1 = 1-LPF(floor(y(4)-y(3)),floor(x(4)-x(3)),'ideal',max(x(4)-x(3),y(4)-y(3)),1);

% Mask = zeros(floor(y(2)-y(1)),floor(x(2)-x(1)));
% Mask1 = zeros(floor(y(4)-y(3)),floor(x(4)-x(3)));
% H = ones(length,width);
% H(floor(y(1)):floor(y(2))-2,floor(x(1)):floor(x(2))-1) = Mask;
% H(floor(y(3)):floor(y(4))-2,floor(x(3)):floor(x(4))-1) = Mask1;
% Out = fftshift(fft2(Input1)).*H;
% Out = ifft2(Out);
% figure
% imshow(abs(Out),[]);
%[x,y] = ginput(2);
% mask
Mask = ones(length,width);
for i=1:8;
    [x,y] = ginput(2);
    %Mask(floor(y(1)):floor(y(2)),floor(x(1)):floor(x(2))) = 0;
    mask = 1-LPF(floor(y(2))-floor(y(1)),floor(x(2))-floor(x(1)),'btw',max(x(2)-x(1),y(2)-y(1)),2);
    Mask(floor(y(1)):floor(y(2))-1,floor(x(1)):floor(x(2))-1) = mask;
   
    
    % Mask(floor(y(3)):floor(y(4)),floor(x(3)):floor(x(4))) = 0;
    % 滤波效果最好
    % Mask(1:322,335:339) = 0;
    % Mask(347:674,335:339) = 0;
    Input = Mask.* Input;
    %mask = Mask.* mask;
    imshow(Input,[])
    
end

Out = Mask.* fftshift(fft2(Input1));
Out1 = ifft2(Out);
Out = abs(Out1);
figure
imshow(Out,[])
