function Mask = LPF(length,width,type,D0,n)
%ÊäÈëFourier±ä»»
% Input=double(InputPicture());
% Input = fftshift(fft2(Input));
% Input = abs(Input);
% Input = log(Input);
% %mesh(Input)
% imshow(Input,[]);
%[length,width] = size(Input);
%mask
Mask = zeros(length,width);
%create the distance matrix
u = 0:length - 1;
v = 0:width - 1;
idx = find(u > length/2);
u(idx) = u(idx) - length;
idy = find(v > width/2);
v(idy) = v(idy) - width;
[V, U] = meshgrid(v, u);
D = sqrt(V.^2 + U.^2);
D = fftshift(D);
switch type
case 'ideal'
   Mask(D<D0) = 1;
case 'btw'
    if nargin == 4
        n = 1;
    end
    Mask = 1./(1 + (D./D0).^(2*n));                                         
case 'gaussian'
   Mask = exp(-(D.^2)./(2*(D0^2)));
end
%Output = Input.*Mask;