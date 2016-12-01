function Mask = BandFilter(length,width,type, band, D0, W, n)

%[length,width] = size(Input);

%mask
Mask = ones(length,width);
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
   Mask = idealReject(D, D0, W); 
case 'btw'
   Mask = btwReject(D, D0, W, n);
case 'gaussian'
   Mask = gaussReject(D, D0, W);
end

% Generate a bandpass filter if one was specified.
if strcmp(band, 'pass')
   Mask = 1 - Mask;
end

%Output = Input.*Mask;
%------------------------------------------------------------------%
function H = idealReject(D, D0, W)
RI = D <= D0 - (W/2);   % Points of region inside the inner 
                        % boundary of the reject band are labeled 1.
                        % All other points are labeled 0.
                         
RO = D >= D0 + (W/2);   % Points of region outside the outer 
                        % boundary of the reject band are labeled 1.
                        % All other points are labeled 0.
                        
H = tofloat(RO | RI);   % Ideal bandreject filter.

function H = btwReject(D, D0, W, n)
H = 1./(1 + (((D*W)./(D.^2 - D0^2)).^2*n));

%------------------------------------------------------------------%
function H = gaussReject(D, D0, W)
H = 1 - exp(-((D.^2 - D0^2)./(D.*W + eps)).^2);