function rgb = HSI_to_RGB(varargin)
%Converts an HSI image to RGB.
%The format of the function
%1.rgb = HSI_to_HSI(hsi)
%2.rgb = HSI_to_HSI(h,s,i)



% 初始化
if nargin == 3
    H = varargin{1} * 2 * pi;
    S = varargin{2};
    I = varargin{3};
end
if nargin == 1
    hsi = varargin{1};
    H = hsi(:, :, 1) * 2 * pi;
    S = hsi(:, :, 2);
    I = hsi(:, :, 3);
end


% 初始化
R = zeros(size(H, 1), size(H, 2));
G = zeros(size(H, 1), size(H, 2));
B = zeros(size(H, 1), size(H, 2));

% RG 扇区 (0 <= H < 2*pi/3).
area = find( (0 <= H) & (H < 2*pi/3));
B(area) = I(area) .* (1 - S(area));
R(area) = I(area) .* (1 + S(area) .* cos(H(area)) ./ cos(pi/3 - H(area)));
G(area) = 3*I(area) - (R(area) + B(area));

% BG 扇区 (2*pi/3 <= H < 4*pi/3).
area = find( (2*pi/3 <= H) & (H < 4*pi/3) );
R(area) = I(area) .* (1 - S(area));
G(area) = I(area) .* (1 + S(area) .* cos(H(area) - 2*pi/3) ./ cos(pi - H(area)));
B(area) = 3*I(area) - (R(area) + G(area));

% BR 扇区.
area = find( (4*pi/3 <= H) & (H <= 2*pi));
G(area) = I(area) .* (1 - S(area));
B(area) = I(area) .* (1 + S(area) .* cos(H(area) - 4*pi/3) ./ cos(5*pi/3 - H(area)));
R(area) = 3*I(area) - (G(area) + B(area));

rgb = cat(3, R, G, B);
rgb = max(min(rgb, 1), 0);
