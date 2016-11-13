clc
clear all

% Input = InputPicture();
% Input = double(Input);
Input = zeros(2048,2048);
mask = ones(10,10);
Input(40:49,40:49) = mask;

% [M,N] = size(Input);
% X = zeros(M,N);
tic
X=myFFT2(Input);
X = myFFT2(X.').';
toc
% tic
% for i = 1:M;
%     X(i,:)=myFFT(Input(i,:));
% end
% for i = 1:N;
%     X(:,i)=myFFT(X(:,i));
% end
% toc
tic
COM = fftshift(fft2(Input));
toc

tic
XY = myDFTforPicture(Input);
IXY = myIDFT2(XY,size(Input,1),size(Input,2));
X_abs = abs(XY);
toc
% 
X = fftshift(X);
XY_abs = abs(X);
figure
imshow(XY_abs,[])
figure
imshow(X_abs,[])
figure
imshow(abs(COM),[])