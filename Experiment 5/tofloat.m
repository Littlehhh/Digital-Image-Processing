function [out, revertclass] = tofloat(in)
%TOFLOAT Convert image to floating point
%   [OUT, REVERTCLASS] = TOFLOAT(IN) converts the input image IN to
%   floating-point. If IN is a double or single image, then OUT
%   equals IN.  Otherwise, OUT equals IM2SINGLE(IN).  REVERTCLASS is
%   a function handle that can be used to convert back to the class
%   of IN.

%   Copyright 2002-2009 R. C. Gonzalez, R. E. Woods, and S. L. Eddins
%   From the book Digital Image Processing Using MATLAB, 2nd ed.,
%   Gatesmark Publishing, 2009.
%
%   Book web site: http://www.imageprocessingplace.com
%   Publisher web site: http://www.gatesmark.com/DIPUM2e.htm

identity = @(x) x;
tosingle = @im2single;

table = {'uint8',   tosingle, @im2uint8
   'uint16',  tosingle, @im2uint16
   'int16',   tosingle, @im2int16
   'logical', tosingle, @logical
   'double',  identity, identity
   'single',  identity, identity};

classIndex = find(strcmp(class(in), table(:, 1)));

if isempty(classIndex)
   error('Unsupported input image class.');
end

out = table{classIndex, 2}(in);

revertclass = table{classIndex, 3};
