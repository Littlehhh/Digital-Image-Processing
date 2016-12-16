function varargout = RGB_to_HSI(rgb)
%Converts an RGB image to HSI.
%The format of the function
% 1.HSI = RGB_to_HSI(rgb);
% 2.[h,s,i] = RGB_to_HSI(rgb);

% Extract the individual component images.
rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% Implement the conversion equations.
num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));

H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;

I = (r + g + b)/3;

% Combine all three results into an hsi image.
hsi = cat(3, H, S, I);

if nargout == 3
    varargout{1} = H;
    varargout{2} = S;
    varargout{3} = I;
end
if nargout == 1
    varargout{1} = hsi;
end

