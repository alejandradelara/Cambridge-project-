% hy
% clc
% clear
function dens = rho(T)
% t = dlmread('data_H.dat');
% T = t(:,1) +273.15;
% % % 
% r = t(:,end);

% t = dlmread('H_nist.dat');
% T = t(:,1) ;
% % % 
% r = t(:,end).*2;

% rr = t(:,2);
% rrr = t(:,3);


p1 =       1110 ;
q1 =        -9.643 ;

p1 =        1410  ;
q1 =      0.1544;

dens =  (p1)./ (T + q1);


% p1 =      0.1082  ;
% p2 =        1335  ;
% q1 =      -4.468  ;
% dens = (p1.*T + p2)./ (T + q1);


%        a =       65.73  ;
%        b =    -0.02698 ;
%        c =       10.83 ;
%        d =   -0.003346  ;
% dens = a*exp(b*T) + c*exp(d*T);




% figure(1)
% hold on; box on; grid on
% plot(T,r)
% plot(T,rr)
% plot(T,rrr)
% dens1 = a*exp(b*(100:10:3000)) + c*exp(d*(100:10:3000));
% plot(linspace(100,3000,291),dens1,'b.')
% dens2 =  (p1)./ (100:10:3000 + q1); 
% plot(linspace(100,3000,numel(dens2)),dens2,'r.')

end

% General model Rat01:
%      f(x) = (p1) / (x + q1)
% Coefficients (with 95% confidence bounds):
%        p1 =        1110  (1082, 1139)
%        q1 =      -9.643  (-11.89, -7.4)
% 
% Goodness of fit:
%   SSE: 0.2155
%   R-square: 0.9991
%   Adjusted R-square: 0.999
%   RMSE: 0.134