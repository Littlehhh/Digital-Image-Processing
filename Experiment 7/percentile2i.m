function I = percentile2i(h, P)
%PERCENTILE2I Computes an intensity value given a percentile.
%	I = PERCENTILE2I(H, P) Given a percentile, P, and a histogram,
%	H, this function computes an intensity, I, representing the
%	Pth percentile and returns the value in I. P must be in the
%	range [0, 1] and I is returned as a value in the range [0, 1]
%	also.
%
%   Example:
%   
%   Suppose that h is a uniform histogram of an 8-bit image.  Typing
%   
%       I = percentile2i(h, 0.5) 
%
%   would output I = 0.5. To convert to the (integer) 8-bit range
%   [0, 255], we let I = floor(255*I).
%
%   See also function i2percentile.   

%   Copyright 2002-2009 R. C. Gonzalez, R. E. Woods, and S. L. Eddins
%   From the book Digital Image Processing Using MATLAB, 2nd ed.,
%   Gatesmark Publishing, 2009.
%
%   Book web site: http://www.imageprocessingplace.com
%   Publisher web site: http://www.gatesmark.com/DIPUM2e.htm

% Check value of P.
if P < 0 || P > 1
   error('The percentile must be in the range [0, 1].')
end

% Normalized the histogram to unit area. If it is already normalized
% the following computation has no effect.
h = h/sum(h);

% Cumulative distribution.
C = cumsum(h);

% Calculations.
idx = find(C >= P, 1, 'first');
% Subtract 1 from idx because indexing starts at 1, but intensities
% start at 0. Also, normalize to the range [0, 1].
I = (idx - 1)/(numel(h) - 1); 

       

