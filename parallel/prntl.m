% clc
% clear 
% p = dlmread('hydrogen_prop.dat');

% T = p(:,1) + 273.15;
% pr = p(:,2);

function PP = prntl(T)
p1 =     -0.0001  ;
p2 =      0.7173  ;

PP = p1*T + p2;
end
% Coefficients (with 95% confidence bounds):
%        p1 =     -0.0001  (-0.0001, -0.0001)
%        p2 =      0.7173  (0.7173, 0.7173)
% 
% Goodness of fit:
%   SSE: 1.479e-31