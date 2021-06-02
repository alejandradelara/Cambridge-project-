%Heat transfer within a particle
clc
clear
myObj = functionsContainer;
%melting point = 3000K
%{
To achievegoodheat-transferandfluid dynamicperformance,the fuel bed 
should not be less than about 15 particle diameters thick. Particles are 
approximately 500 microns in diameter, and thus, the bed's thickness should 
range from .75 cm - 1.5 cm to satisfy the criteria of particle diameterand 
disadvantagefactor.To achievegoodheat-transferandfluid dynamicperformance,
the fuel bed should not be less than about 15 particle diametersthick. 
Particles are approximately 500 microns in diameter, and thus, the bed's 
thickness should range from .75 cm - 1.5 cm to satisfy the criteria of 
particle diameterand disadvantagefactor
%}


L   =    1; % axial length
R_f = 0.01; % thickness of the fuel 
kH   = 0.2;
m = 0.005 ;
cp = 14.45e3;
H_rho = 71 ; % kg/m3
mu = 1.5e-6      ;



Q_tot = 300e6;     % MW 
fuel_elem = 19 ; 
Q = Q_tot/fuel_elem;

pd = 0.5e-3; % particle diameter 0.5mm approx
pr = pd/2;   % particle radius

qv = 10e6 ; %  (W/L) bed power density

vol = Q./qv *0.001;  % m3 of fuel
vol_part = 4/3*pi.*pr.^3; % volume of a particle

num = vol/vol_part;

%%

Q_part = Q./num ;




%fuel elements identical composition and enrichment

%https://www.hindawi.com/journals/ijne/2014/178360/
k_UC = 20 ; %(W/mK)
% http://www.eyoungindustry.com/uploadfile/file/20160612/20160612155015_39381.pdf
k_graph = 115;
%https://www.azom.com/properties.aspx?ArticleID=261
k_ZrC = 22;%(W/mK)


%%%some assumptions

% particle subradii distribution
graph_r = pr.*(1-0.2);
fuel_r = pr.*(1-0.9);

T0 = 1000;   % temperature of the coolant (in reality it ranges from 300 to 3000)

%% Calculations 1: temperature distribution within the fuel 

%analytical
qvol = Q_part./(4/3*pi.*fuel_r.^3);

R_clad  = linspace(pr,graph_r,100);
R_graph = linspace(graph_r,fuel_r,100);
R_fuel = linspace(fuel_r,eps,100); % didnt do it until 0 -> it crashes


Tclad = Q_part./(k_ZrC.*4*pi) .*(-1./pr + 1./R_clad) + T0;
Tgraph = Q_part./(k_graph.*4*pi) .*(-1./graph_r + 1./R_graph) + Tclad(end);
Tf = qvol.*(fuel_r.^2-R_fuel.^2)./(6.*k_UC) + Tgraph(end); 

%numerical

tspan = [pr graph_r];
[rcl,tcl] = ode45(@(r,t) -Q_part./(4*pi.*r.^2.*k_ZrC), tspan, T0);

tspan_gr = [graph_r fuel_r];
[rgr,tgr] = ode45(@(r,t) -Q_part./(4*pi.*r.^2.*graphite(t)), tspan_gr, tcl(end));

%for the fuel the equation is a second order diff
sol = fuel_solve(tgr(end),qvol/k_UC,R_fuel);
rf = sol.x;
tf=sol.y(1,:);

%% Plots

figure(3)
hold on; box on; grid on;
plot (R_fuel,Tf)
plot (rf,tf,'o')


figure(1)
hold on; box on; grid on;
plot (R_clad.*1e3,Tclad)
plot(rcl.*1e3,tcl,'o')

plot (R_graph.*1e3,Tgraph)
plot (rgr.*1e3,tgr,'o')

plot (R_fuel.*1e3,Tf)
plot (rf.*1e3,tf,'o')

xlabel 'Rad (mm)'
ylabel 'Temperature (K)'
%ylim ([1000,1010])
legend ('Clad A','Clad N','Graph A','Graph N','fuel A','fuel N')


% %pressure
% in_press = 60*101325 ; % inlet pressure (Pa)
% Dp_in    = 0.6       ;
% Dp_duct  = 0.001     ; 
% Dp_plenum = 0.0001   ; 
% Dp_bed   = 0.1       ; 
% 
% P_bed   = in_press - (Dp_in + Dp_duct + Dp_plenum).*101325 ;

%% Calculation fuel-to-coolant
void = 0.4; 

flow = L.*2*pi*R_f ; %is this the flow area?
%cp = myObj.Cp(T);
h = h_part (mu,cp,kH,m,pd,void,H_rho,flow);

Tw = T0 + Q./(4*pi*pr.^2.*num).*(1./h);













%{
this function calculates the second order 
differential equation for the fuel
Tc = T from the graphite
C  = the constant in the equation qvol/k
inter = the interval (make sure not to use 0 because it crashes 1/0)
        use eps instead (1e-16)
%}

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
