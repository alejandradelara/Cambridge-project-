% attempt 1
myObj = functionsContainer;

Tin = 300;
q0p = 6e3 ;
Le = 1 ;
m = 0.005 ;
cp = 14.45e3;
L = Le ;

%Rci---Rco--Rm3---Rout
Rco = 0.8; % outter radius of the clad moderator= wall
Rci = 0.6; % inner radius of the moderator
Rm3 = Rco + 2/100 ; % the coolant inlet channel diam (for this modle it is the annular width)
Rout = 0.9;

kB   = 20   ; % W/K (beryllium as moderator)
kH   = 0.2;
mu = 1.5e-5      ; % mu factor for the reynolds number

Din = Rco.*2 ;
Dout = Rm3.*2;
Dh = Dout-Din;

%%%%%%%%%%%%%%
% calculating h
hf = conv(mu,cp,kH,m,Dh);
% Pr = mu.*cp./kH;
% Re = 4.*m./(mu.*pi.*Dh);
% Nu = 0.023.*Re.^0.8.*Pr.^0.4; % Pr^n with n= 0.4 because is being heated
% hf = Nu.*kH./Dh ;


z = 0:0.01:L;

qp = q0p.*sin(pi.*z./Le);

Tcoo = q0p.*Le./(pi.*m.*cp).*(-cos(pi.*z./Le) + 1) + Tin;
Tw = Tcoo + qp./(2*pi).*(1./(Rco.*hf));
Tmod = Tcoo + qp./(2*pi).*(1./(Rco.*hf) + 1./kB.*log(Rco./Rci));
Tmod2 = Tcoo - qp./(2*pi).*( 1./(Rm3.*hf));


%
figure (1)
hold on; box on; grid on;
%plot (Tcl,z)
plot (Tcoo,z)
plot (Tw,z)
plot (Tmod,z)
plot (Tmod2,z)
%plot (Tg,z)
legend ('bulk','wall','mod','mod2')

%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

zspan = [0 L];
T0 = Tin;
[zz,T] = ode45(@(z,T) q0p.*sin(pi.*z./Le)./(m.*(myObj.Cp(T))), zspan, T0);

%V = myObj.visc(300)

%%%%%%%%%%%%%%%%%


for i= 1:numel (zz)
    
    cp = myObj.Cp(T(i));
    mu = visc(T(i));
    kH = conduc(T(i));
    %     Pr = mu.*cp./kH;
    %
    %     Re = 4.*m./(mu.*pi.*Dh);
    %
    %     Nu = 0.023.*Re.^0.8.*Pr.^0.4; % Pr^n with n= 0.4 because is being heated
    h = conv(mu,cp,kH,m,Dh);
    
    Tww(i) = T(i) + q0p.*sin(pi.*zz(i)./Le)./(2*pi).*(1./(Rco.*h));
    Tmmod(i) = T(i) + q0p.*sin(pi.*zz(i)./Le)./(2*pi).*(1./(Rco.*h) + 1./kB.*log(Rco./Rci));
    Tmmod2(i) = T(i) - q0p.*sin(pi.*zz(i)./Le)./(2*pi).*(1./(Rm3.*h));
    
    
end
%
figure (2)
hold on; box on; grid on;
plot (T,zz,'.')
plot (Tcoo,z)


plot (Tww,zz,'*')
plot (Tw,z)


plot(Tmmod,zz,'o')
plot (Tmod,z)


plot(Tmmod2,zz,'+')
plot (Tmod2,z)

xlabel 'Temperature (K)'
ylabel 'Axial length (m)'
legend ('Coolant N','Coolant A','Wall N','Wall A','Moderator N','Moderator A', 'Moderator Out A', 'Moderator Out N') 

