% the one steady state 
clc
clear
% Calculations 
sg = 5.67e-8; % boltzmann constant 
ep = 0.3; %porosity
v = 0.7 ; % viscosity coeff
Dp = 0.5e-3; % particle diameter
l = 0.01; %  bed depth 
m = 90.49; % total mass flow rate

m = 0.000009; % i dont really know but take into account that mass is in toal 
Kcond = 0.1; 
Tg_ex =3000;%L
gm = 1.41;
Q = 4e10; %Watt/m3
%Q = 10 ; 

% initial conditions coolant

Tg0 = 300;
T0 = Tg0;
P0 = 1e7 ; % inlet pressure (Pa)
rho0_Hy = 7.67; %kg/m3
A = pi.*(ep.*Dp./2).^2; 
u0 = m/(rho0_Hy.*A) ;

cp = 1.456e4;
ep = 0.3;
rho_part = 3000 ; %k/m3   %page 34 of the PBR guide



%mu = @(Tg,v) mu0.*(Tg./Tg0).^v; 


% coefs

mu0 = 0.87e-5;
mu0_k = 150*(1-ep).^2/ep.^3 *mu0./Dp.^2 ; 
b0_k = 1.75* (1-ep)/ep.^3*1/Dp ; 

b11 = mu0_k.*u0.*l./P0 ; 
b22 = b0_k.*u0.^2.*rho0_Hy.*l./P0 ; 


re = 1:0.1:10; 
Re = re;
q = Dp.*Q.*l./(cp.*T0.*mu0.*Re) ;

R_cons = 4.120e3; %287.058
Mo = (gm-1)/gm *Q.*l./(P0.*q.*sqrt(gm.*R_cons.*T0)) ; 
b1 = 150.*(1-ep).^2./ep.^3 .*1/Dp .*gm.*Mo.^2./Re;
b2 = 1.75* (1-ep)/ep.^3*1/Dp .*gm.*Mo.^2; 



a1 = 2.*b1./((v+2).*q);
a2 = (1+q.*1).^(v+2);
a11 = (1+q.*1).^2;
%P_ss = sqrt(-(1-a1.*a2 -b2./q.*a11)); % this is a pressure drop -> absolute value
P_ss = sqrt(-(-a1.*a2 -b2./q.*a11));
%%
sl = polyfit(log(Re),log(P_ss),1);


figure(1)
hold on;box on; grid on;
plot ((Re),q)

figure(2)
hold on;box on; grid on;
plot (log(Re),log(P_ss))
