%after modcool to get outside T
myObj = functionsContainer;


Tin_2 = T(end) ;

%{ Real values 
% Rip --> Rcf --->Rcf_in --fuel-->Rhf-->Rhf_in
% 
% Rcf = 5.8/(100*2)        ; % cold frit
% Rcf_in = Rcf - 0.15/100  ;
% Rhf = Rhf_in + 0.3/100   ; % hot frit (then the fuel)
% Rhf_in = 2.4/(2*100)     ;
% Rip = 0.035              ; % inlet plenum




Rhf = 0.35; % hot frit (then the fuel)
Rhf_in = 0.33;
Rcf = 0.45; % cold frit
Rcf_in = 0.43;
Rip = 0.5 ; % inlet plenum

kf = 10;
kH   = 0.2;
mu = 1.5e-5      ; % mu factor for the reynolds number

Din_2 = Rcf.*2 ;
Dout_2 = Rip.*2;
Dh_2 = Dout_2-Din_2;

Lx = Rcf_in-Rhf ;
x = Rcf_in:-0.01:Rhf;

hf = conv(mu,cp,kH,m,Dh_2);

z_2 = L:-0.01:0;

qp = q0p.*sin(pi.*z_2./Le);
Tcoo_2 = q0p.*Le./(pi.*m.*cp).*(-cos(pi.*z_2./Le) - 1) + Tin_2;


Tw_2 = Tcoo_2 + qp./(2*pi).*(1./(Rcf.*hf));
Tcf = Tcoo_2 + qp./(2*pi).*(1./(Rcf.*hf) + 1./kf.*log(Rcf./Rcf_in));


figure(3)
hold on;grid on;box on;
plot (qp,z_2)

figure (1)
hold on; box on; grid on;
plot (Tcoo_2,z_2)

plot (Tw_2,z_2)
plot (Tcf,z_2)
legend ('bulk','wall','cf')




eps = 0.1; % fraction of voids 
eff = 0.4; % efficiency

dp = 1e-3; % diameter of a pebble
dh = (2/3).*(eps./(1-eff)).*dp; % hydraulic diameter of the little conducts


Tf = zeros (numel(z_2),numel(x));
for i = 1:numel(z_2)
    for j = 1:numel(x)
    Tf(i,j) = q0p.*Lx./(pi.*m.*cp).*(-cos(pi.*x(j)./Lx) +cos(pi.*Rcf_in./Lx)) + Tcoo_2(i);
    end
end


zspan = [L 0];

[zz_2,T_2] = ode45(@(z,T) q0p.*sin(pi.*z./L)./(m.*(myObj.Cp(T))), zspan, Tin_2);


eps = 0.1; % fraction of voids 
eff = 0.4; % efficiency

dp = 1e-3; % diameter of a pebble
dh = (2/3).*(eps./(1-eff)).*dp; % hydraulic diameter of the little conducts

xspan = [Rcf_in Rhf];
 

for i= 1:numel (zz_2)
    
    cp = myObj.Cp(T_2(i));
    mu = visc(T_2(i));
    kH = conduc(T_2(i));
    
    h = conv(mu,cp,kH,m,Dh_2);
    
    Tww_2(i) = T_2(i) + q0p.*sin(pi.*zz_2(i)./Le)./(2*pi).*(1./(Rcf.*h));
    Tcff(i) = T_2(i) + q0p.*sin(pi.*zz_2(i)./Le)./(2*pi).*(1./(Rcf.*h) + 1./kf.*log(Rcf./Rcf_in));
    
    
    % for each slice of zz_2 I'm going to introduce a slice 
    T_indh = T_2(i); 
    [xx,Tdh] = ode45(@(z,T) q0p.*sin(pi.*z./Lx)./(m.*(myObj.Cp(T))), xspan, T_indh);
    nx = numel(xx);
    Tfuel (i,:) = Tdh';
    
    
end



figure (2)
hold on; box on; grid on;
plot (T_2,zz_2,'o')
plot (Tcoo_2,z_2)


plot (Tww_2,zz_2,'o')
plot (Tw_2,z_2)

plot (Tcff,zz_2,'.')
plot (Tcf,z_2)

xlabel 'Temperature (K)'
ylabel 'Axial length (m)'
legend ('Coolant N','Coolant A','Wall N','Wall A','Cold frit N','Cold frit A') 



% mean porosity
 
% D = 2.*(Rcf - Rhf); % diameter of the bed
% dp = 1e-3; % diameter of the pebble
% 
% eps = 0.78./(D./dp).^2 +0.375 ; 
% 
% Reh = 1./(1-eps).*Re;

figure(4)
hold on; box on; grid on;
for i= 1:numel (zz_2)
plot (xx,Tfuel(i,:),'.')
end
for i= 1:numel (z_2)
plot (x,Tf(i,:))
end