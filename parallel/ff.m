% assumption : cylinder

myObj = functionsContainer;

er = 0.4; %emissivity 
ep = void;

Qv = 40e9;   %W/m3
sig_SB = 5.670374419e-8 ;
l = 0.01;
x = linspace(0,l./sqrt(ep),100);
TT = linspace (Tcoo,3000,100);
%TT= nonLinspace( Tcoo, 3000, 100, 'cos' );
 


dh = dp.*ep./(1-ep); 

Flux = qv.*dp./4; %%% OJO QUE EL AREA QUE HE USADO ESTA FATAL 
% hay que cambiarlo porque yo quiero el flujo para el area wetted 
% eres subnormal 

up = vel./ep;

Reh = dh.*up.*rho(Tcoo)./mu(Tcoo,0.875e-5,300,0.7) ;

% I need to calculate m 
% I know Tin and Tout
Flux = P./ele;
mdot = P./ele.*1./(16e3.*2700) ;

for i = 1:100

Area = 2.*pi.*(0.087/2-x(i)).*0.13; % cross sectional area 
vel = mdot./(rho(TT(i)).*(Area.*ep)); 
V(i) = vel;

Re = rho(TT(i)).*vel.*Rp.*2./visc(TT(i)); 
RE(i) = Re;

Nu_l = 0.664.*prntl(TT(i)).^(1/3).*(Re./ep).^0.5;
Nu_t = 0.037.*(Re./ep).^0.8.*prntl(TT(i))./(1+2.443*(Re./ep).^(-0.1).*(prntl(TT(i)).^(2/3)-1)) ;

Nu_sp = 2 + (Nu_l.^2 + Nu_t.^2).^0.5 ;

Nu_n(i) = (1+1.5*(1-ep)).*Nu_sp; 

Nu_h(i) =  Nu_n(i).*(ep)./(1-ep) ;

% is not like this because the conductivity of the bed is not the same but
% for now 
Fe = 2./(2./er - 0.264) ; 
kr = 4.*sig_SB.*dp.*TT(i).^3.*Fe; % this is the k radiation so we can assume that is equal to 0 for now
ks = ktot; 
kgc_max = (ep.*conduc(TT(i)) + (1-ep).*ks);
kgc_min = conduc(TT(i))./(ep+(1-ep).*(conduc(TT(i))./ks));
kgc = 1/2*(kgc_max+kgc_min) ; 

keff_0(i) = kgc +kr ; 

h(i) = Nu_h(i).*keff_0(i)./dh;
% 
T_film(i) = Flux./h(i) + TT(i);

end

figure(1)
hold on; box on; grid on;
plot (x,T_film)
plot (x,TT,'.')
% xlabel ('Radius (m)')
% ylabel ('Temp (K)')





% Nu = 2 + 1.1 .*Re.^0.5.*prntl(Tcoo).^0.33;
% h = Nu.*conduc(Tcoo)./(dp);
% Pe = vel.*dp.*H_cp(TT).*1e3./conduc(TT) ;
% D = 0.087./2 ; % assume that tube diameter is the whole rad ????
% K = 8.*(2-(1-2.*dp./D).^2); 