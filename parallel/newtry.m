% zeroth order heat transfer

l = 0.01; 

dp = 0.5e-3;
% K = void.^3.*dp.^2./(150.*(1-void).^2) ; 
% 
% b = 1.75.*sqrt(K)./(sqrt(150).*void.^1.5); 

x = linspace (0,l,100); 

q = qv.*l./(rho(Tcoo).*Tcoo.*vel.*H_cp(Tcoo).*1e3);

% hh = 75./dp.*(1-void).^2./void.^2.*1/Re + 0.875./dp.*(1-void)./void.^2;
% HH = hh.*l; 
% 
% 
% Temg = 1 + q.*x./l ;
% Temp = 1 + q.*x./l + q./HH;
% 
% 
% TEMG = Temg.*Tcoo;
% TEMP = Temp.*Tcoo;

% dydx = gradient(TTT(:)) ./ gradient(RRR(:));
% dydx2 = gradient(dydx(:)) ./ gradient(RRR(:));

%[x,t] = ode45(@(x,t) H_cp(t).*1e3.*(Tp-t).*h, tspan, y0);

%%

% these are initial conditions 
Area = 2.*pi.*((0.087/2)).*0.13; % cross sectional area 
vel = m./(rho(Tcoo).*(Area.*void)); 
Re = rho(Tcoo).*vel.*Rp.*2./visc(Tcoo); 
Nu = 2 + 1.1 .*Re.^0.5.*prntl(Tcoo).^0.33;
h(1) = Nu.*conduc(Tcoo)./(dp);
Flux = qv.*R1./2;  
T_film = Flux./h + Tcoo;
Tgas(1) = Tcoo; 

for i = 2:100

Area = 2.*pi.*((0.087/2-x(i-1))).*0.13; % cross sectional area 
vel = m./(rho(Tgas(i-1)).*(Area.*void)); 
Re = rho(Tgas(i-1)).*vel.*Rp.*2./visc(Tgas(i-1)); 
Nu = 2 + 1.1 .*Re.^0.5.*prntl(Tgas(i-1)).^0.33;
h(i-1) = Nu.*conduc(Tgas(i-1))./(dp);
Flux = qv.*R1./2;  
T_film(i-1) = Flux./h(i-1) + Tgas(i-1);

% the next value for the coolant 
Tgas(i) = T_film(i-1) - (T_film(1)-300).*exp(-x(i).*h(i-1)) ;

end



%%

figure(20)
hold on; box on; grid on;
plot (x,Tgas)


%%
% %%
% %%%%%%%%%%%%%%%%%
% % the heat transport from the particle to the coolant
% TCO = linspace(300,3000,100);
% for i= 1:100
% 
% Tcoo = TCO(i);
% press = 60*101325;
% Area = 2.*pi.*(0.087/2).*0.13; % cross sectional area 
% vel = m./(rho(Tcoo).*(Area.*void)); 
% 
% 
% Re = rho(Tcoo).*vel.*Rp.*2./visc(Tcoo); 
% Nu = 2 + 1.1 .*Re.^0.5.*prntl(Tcoo).^0.33;
% h = Nu.*conduc(Tcoo)./(dp);
% 
% %Flux = Q_part./(4*pi*R1.^2) ;
% Flux = qv.*R1./2; 
%  
% T_film = Flux./h + Tcoo;
% %%%%%%%%%%%%%%%%%
% 
% %% 
% 
% %analytical 
% 
% r1 = linspace(R1,eps,100); 
% r2 = linspace(R2,R1,100); 
% r3 = linspace(Rp,R2,100); 
% 
% 
% Tco = (qv.*4/3*pi.*R1.^3)./(4*pi.*k_ZrC) .*(-1./Rp +1./r3) + T_film;
% Tci = (qv.*4/3*pi.*R1.^3)./(4*pi.*k_graph) .*(-1./R2 +1./r2) + Tco(end); 
% Tf = qv.*(R1.^2-r1.^2)./(6.*k_UC) + Tci(end); 
% 
% TTT(i,:) = [Tf(end:-1:1),Tci(end:-1:1),Tco(end:-1:1)];
% RRR(i,:) = [r1(end:-1:1),r2(end:-1:1),r3(end:-1:1)];
% end
