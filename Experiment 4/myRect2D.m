function output = myRect2D(sizex,sizey,deltaN,constc)
%%Rect2D function 

% clc
% clear
% close all

Lx = sizex;
Ly = sizey;
N = deltaN;
c = constc;


tempx = myRect(Lx,N,c);
tempy = myRect(Ly,N,c);
%output = zeros();

output = tempx'*tempy;








