close all
Input1=double(InputPicture());
Input = fftshift(fft2(Input1));
Input = abs(Input);

Input = log(Input);
%mesh(Input)
imshow(Input,[])

%[x,y] = ginput(4);
[length,width] = size(Input);

%mask
Mask = ones(length,width);


Mask(1:325,330:345) = 0;
Mask(345:674,330:345) = 0;
Input = Mask.* fftshift(fft2(Input1));

Input = ifft2(Input);
Input = abs(Input);
figure
imshow(Input,[])