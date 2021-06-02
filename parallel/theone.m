clc
clear
% Calculations 
sg = 5.67e-8; % boltzmann constant 
ep = 0.3; %porosity
v = 0.7 ; % viscosity coeff
Dp = 0.5e-3; % particle diameter
l = 0.1; %  bed depth 

Q = 4e10; %Watt/m3
Tg_ex =3000;%L
Tg0 = 300;
m = 90.49;

in_press = 60*101325 ; % inlet pressure (Pa)
rho0_Hy = 3.9; %kg/m3

A = pi.*(ep.*Dp./2).^2; 


cps = 1.456e4 ; %J/kgK
rho_part = 3000 ; %k/m3   %page 34 of the PBR guide
cp_Hy  = cp_H(T) ; %kJ/kgk


mu0 = 0.87e-5; % kg/sm
mu = @(Tg,v) mu0.*(Tg./Tg0).^v; 

krad = 16/3*sg*Dp.*Tp.^3;
keff = kcond + krad;

%%% I need to calculate several parameters

% T = linspace(300,3000,1000);
% for i=1:1000
Tg = T;    
Re = 4*m./(pi*ep.^2*Dp*mu(Tg,v));
h = 75./Dp * (1-ep).^2/ep^2 *1./Re + 0.875./Dp * (1-ep)/ep^2;
H = h.*l;
% end




y0 = 0;
[r,y] = ode45(@(t,y) 2*t, rspan, 300);