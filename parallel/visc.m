function V = visc(T)

% t = dlmread('H_thermo.dat').*1e-6;
% T = (-100:100:800) +273.15;
a =   1.983e-07  ;
b =      0.6685 ;


V = a.*T.^b;

       a =   3.055e-07 ;
       b =      0.6128  ;
       c =  -9.014e-07 ;

    V = a.*T.^b+c;


end

% General model Power1:
%      f(x) = a*x^b
% Coefficients (with 95% confidence bounds):
%        a =   1.983e-07  (1.85e-07, 2.116e-07)
%        b =      0.6685  (0.6584, 0.6787)
% 
% Goodness of fit:
%   SSE: 5.354e-14
%   R-square: 0.9998
%   Adjusted R-square: 0.9997
%   RMSE: 8.181e-08