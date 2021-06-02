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

m = 0.000009; % i dont really kknow but take into account that mass is in toal 

Tg_ex =3000;%L

Q = 4e10; %Watt/m3

% initial conditions coolant

Tg0 = 300;
P0 = 100*101325 ; % inlet pressure (Pa)
rho0_Hy = 7.67; %kg/m3
A = pi.*(ep.*Dp./2).^2; 
u0 = m/(rho0_Hy.*A) ;

cp = 1.456e4 ; %J/kgK
rho_part = 3000 ; %k/m3   %page 34 of the PBR guide


mu0 = 0.87e-5; % kg/sm
mu = @(Tg,v) mu0.*(Tg./Tg0).^v; 


% coefs
mu0_k = 150* (1-ep).^2/ep.^3 *mu0./Dp.^2 ; 
b0_k = 1.75* (1-ep)/ep.^3*1/Dp ; 

b1 = mu0_k.*u0.*l./P0 ; 
b2 = b0_k.*u0.^2.*rho0_Hy.*l./P0 ; 
%%

% nondim
Re = 4*m./(pi*ep.^2*Dp*mu(Tg,v));
h = 75./Dp * (1-ep).^2/ep^2 *1./Re + 0.875./Dp * (1-ep)/ep^2;

%
%cp_Hy  = H_cp(T) ; %kJ/kgk

c = rho_part.*cp./(rho0_Hy.*cp_Hy) ;
H = h.*l ; 

kcond = 0.1; %dont know but from graphite
krad = 16/3*sg*Dp.*Tp.^3;
keff = kcond + krad;
K = keff./(P0.*u0.*cp_Hy.*l) ;
%q = Q.*l./(rho0_Hy.*u0.*cp_Hy.*Tg0) ; 

%% Steady State

% rho0_u0 = 1; 

x = linspace (0,l,100);

cp_Hy  = H_cp(Tg0) ; %J/kgk
q(1) = Q.*l./(rho0_Hy.*u0.*cp_Hy.*Tg0) ;



for i = 1:numel(x)

    Tg_ss(i) = 1 + q(i).*x(i) ; 
    
    P_ss(i) = sqrt(1-(2.*b1./((v+2).*q(i))).*((1+q(i).*x(i)).^(v+2)-1) -b2./q(i).*((1+q(i).*x(i)).^2-1));
    
    rho_ss(i) = P_ss(i)./Tg_ss(i);
    
    u_ss(i)  = 1./rho_ss(i);
    
    cp_Hy  = H_cp(Tg_ss(i)) ; %J/kgk
%    q(i+1) = Q.*l./(rho0_Hy.*u0.*cp_Hy.*Tg0) ;
    
    
    Re(i) = 4*m./(pi*ep.^2*Dp*mu(Tg_ss(i),v));
    h(i) = 75./Dp * (1-ep).^2/ep^2 *1./Re(i) + 0.875./Dp * (1-ep)/ep^2;
    H = h(i).*l ;
    
    Tp_ss(i) = 1 + q(i).*x(i) + q(i)./H;
    q(i+1) = Q.*l./(rho0_Hy.*u0.*cp_Hy.*Tg0) ;
    
    
end

%%

figure(1)
hold on;grid on;box on;
plot(Re,q(1:end-1),'.-')
ylabel ('q', 'FontSize', 12)
xlabel ('Re', 'FontSize', 12)

%%

Re = rho_ss(1).*u_ss(1).*Dp./mu0; 
%q = (Dp.*Q.*l)./(cp.*300.*mu0.*Re);