% im going to move in small bits dx=dp

Qv = 40e9;   %W/m3
% sig_SB = 5.670374419e-8 ;
% er = 0.4; %emissivity 

ep = void;

%length of the bed 
l = 0.01;
dx = 0:dp:l;
%dh = dp.*ep./(1-ep);
dh = 2/3*dp.*ep./(1-ep); % from chinese paper 
%%%% https://www.research-collection.ethz.ch/bitstream/handle/20.500.11850/93162/eth-26305-02.pdf
dh = 1/6*dp.*ep./(1-ep); % from that paper which makes more sense

ROUT = 0.0435;
X = ROUT:-dp:ROUT-l; 

up = vel./ep;

Reh = dh.*up.*rho(Tcoo)./mu(Tcoo,0.875e-5,300,0.7) ;

% I need to calculate m 
% I know Tin and Tout
%Flux = P./ele;
mdot = P./ele.*1./(16e3.*2700) ;

%x = linspace(0,l./sqrt(ep),numel(X)-1); % i have included the tortuosity here
x = linspace(0,l,numel(X)-1); % i have NOT included the tortuosity here

TT = linspace (Tcoo,3000,numel(X)-1);
%TT= nonLinspace( Tcoo, 3000 ,numel(X)-1, 'cos' );

%at each bit 
Flux = qv.*R1./3;  % of 1 particle
% how many particles per unit volume?
F = 0; 

for i = 2:numel(X)

Vol = pi.*(X(i-1).^2-X(i).^2).*0.13; %vol
V_p = 4/3*pi.*Rp.^3;
N_p(i-1) = Vol./V_p ;
F(i-1) = P./(ele.*N_p(i-1).*(1-ep).*4*pi*R1.^2); %flux grows when the volume lowers 

end

for i = 1:numel(X)-1
Area = 2.*pi.*(0.087/2-x(i)).*0.13; % cross sectional area 
vel = mdot./(rho(TT(i)).*(Area.*ep)); % cross sectional vel 
V(i) = vel;

Re = rho(TT(i)).*vel.*Rp.*2./visc(TT(i)); 
RE(i) = Re;

Nu_l = 0.664.*prntl(TT(i)).^(1/3).*(Re./ep).^0.5;
Nu_t = 0.037.*(Re./ep).^0.8.*prntl(TT(i))./(1+2.443*(Re./ep).^(-0.1).*(prntl(TT(i)).^(2/3)-1)) ;

Nu_sp = 2 + (Nu_l.^2 + Nu_t.^2).^0.5 ;
%Nu_sp = 2+1.1.*Re.^0.5.*prntl(TT(i)).^0.33;
Nu_n = (1+1.5*(1-ep)).*Nu_sp;

h(i) = (Nu_n.*conduc(TT(i))./dh);
% h
T_film(i) = F(i)./h(i) + TT(i);

end

figure(1)
hold on; box on; grid on;
plot (x,T_film)
plot (x,TT,'.')


%%

% according to the paper the Nu number of the wall is the following 

%Nu_w = 