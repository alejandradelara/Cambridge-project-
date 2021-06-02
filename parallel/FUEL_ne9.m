clc
clear
%particles

M = 90.49; % mass flow rate kg/s

dp = 0.05e-2;
Rp = dp./2; 
R1 = Rp.*0.5 ; % fuel diameter
R2 = R1 + Rp.*0.3 ;
%R3 = R2 +Rp.*0.2 ;

void = 0.3; %bw 3-4
ep = void; 

P =1000e6;   %W
Qv = 40e9;   %W/m3
t = 1e-2 ;
ele = 19 ; % assume 19 fuel elements 
l = 25   ; %assume 25 l over the 19 elements
m = M/ele; 
mdot = P./ele.*1./(16e3.*2700) ;

%https://www.hindawi.com/journals/ijne/2014/178360/
k_UC = 20 ; %(W/mK)
% [198C-6.6944   315-5.8576   402-6.276
% http://www.eyoungindustry.com/uploadfile/file/20160612/20160612155015_39381.pdf
k_graph = 180.4725;
%https://www.azom.com/properties.aspx?ArticleID=261
k_ZrC = 22;%(W/mK)

ktot =1/(4*pi).*((1./(2.*R1.*k_UC)+(R2-R1)./(k_graph.*R1.*R2)+(Rp-R2)./(k_ZrC.*Rp.*R2))); 

m3 = P./Qv .*1/ele ; % volume per fuel element 

part_vol_f = 4/3*pi.*R1.^3;

%num = m3.*(1-void)./part_vol;
num = m3./part_vol_f;

qv = Qv;

%qv = Qv./(num);  % power density of 1 particle
%qv = P./(ele.*num.*4/3*pi.*(Rp).^3);
Q_part = Qv.*4/3*pi.*R1.^3;
%Q_part = P/(ele*num);

%%
%%%%%%%%%%%%%%%%%
% the heat transport from the particle to the coolant
Tcoo = 300;
press = 60*101325;
Area = 2.*pi.*(0.087/2).*0.13; % cross sectional area 
%Area = 2.*pi.*(0.087/2).*1.2; % cross sectional area 
%vel = m./(rho(Tcoo).*(Area.*void)); 

%Area = 2.*pi.*(0.087/2-x(i)).*0.13; % cross sectional area 
vel = mdot./(rho(Tcoo).*(Area.*ep)); 


Re = rho(Tcoo).*vel.*Rp.*2./visc(Tcoo); 
Nu_l = 0.664.*prntl(Tcoo).^(1/3).*(Re./ep).^0.5;
Nu_t = 0.037.*(Re./ep).^0.8.*prntl(Tcoo)./(1+2.443*(Re./ep).^(-0.1).*(prntl(Tcoo).^(2/3)-1)) ;

Nu_sp = 2 + (Nu_l.^2 + Nu_t.^2).^0.5 ;

dh = 1/6*dp.*ep./(1-ep); % from that paper which makes more sense

%Re = rho(Tcoo).*vel.*Rp.*2./visc(Tcoo); 
%%Nu = 2 + 1.1 .*Re.^0.5.*prntl(Tcoo).^0.33;
%h = Nu.*conduc(Tcoo)./(dp);
h = Nu_sp.*conduc(Tcoo)./(dp);

%Flux = Q_part./(4*pi*R1.^2) ;
Flux = qv.*R1./3;  
 
T_film = Flux./h + Tcoo;
%%%%%%%%%%%%%%%%%

%% 

%analytical 

r1 = linspace(R1,eps,100); 
r2 = linspace(R2,R1,100); 
r3 = linspace(Rp,R2,100); 


Tco = (qv.*4/3*pi.*R1.^3)./(4*pi.*k_ZrC) .*(-1./Rp +1./r3) + T_film;
Tci = (qv.*4/3*pi.*R1.^3)./(4*pi.*k_graph) .*(-1./R2 +1./r2) + Tco(end); 
Tf = qv.*(R1.^2-r1.^2)./(6.*k_UC) + Tci(end); 

TTT = [Tf(end:-1:1),Tci(end:-1:1),Tco(end:-1:1)];
RRR = [r1(end:-1:1),r2(end:-1:1),r3(end:-1:1)];

figure(1)
hold on; box on; grid on;
plot (r1,Tf)
plot(r2,Tci)
plot(r3,Tco)
xlabel ('Radius (m)')
ylabel ('Temp (K)')

%numerical



tspan = [Rp R2];
[rcl,tcl] = ode45(@(r,t) -Q_part./(4*pi.*r.^2.*k_ZrC), tspan, T_film);

tspan_gr = [R2 R1];
[rgr,tgr] = ode45(@(r,t) -Q_part./(4*pi.*r.^2.*graphite(t)), tspan_gr, tcl(end));

%for the fuel the equation is a second order diff
sol = fuel_solve(tgr(end),qv/k_UC,r1);
rf = sol.x;
tf=sol.y(1,:);


% plot (rf,tf,'-.')
% plot(rgr,tgr,'.')
% plot(rcl,tcl,'.')
% 





function sol = fuel_solve(Tc,C,inter)

    solinit = bvpinit(inter, @guess);

    sol = bvp5c(@bvpfcn, @bcfcn, solinit);


    function dydx = bvpfcn(r,Y)
        dydx = zeros(2,1);
        dydx = [Y(2)
            -Y(2).*2./r - C];
end

% boundary conditions y(R)=T, y'(0)=0. 
function res = bcfcn(ya,yb)
    %Tin = 100;
    res = [ya(1) - Tc
        yb(2)];
end

function g = guess(x)
g = [sin(x)
     cos(x)];
end

end







