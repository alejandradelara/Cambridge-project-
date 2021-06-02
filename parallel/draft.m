% attempt 1
myObj = functionsContainer;




q0p = 6e3 ;
Le = 1 ;
m = 0.005 ;
cp = 14.45e3;
L = Le ;
Rco = 0.7; % outter radius of the clad (moderator)= wall
Rci = 0.67; % inner radius of the clad (moderator)
Rg = 0.65; % radius of the gap (Rfo+Rci)./2
% gap do not count now
kfu = 33;
kH   = 0.8;
hf = 2e2;
kc = 13;
hg = 6e3;
Tin = 300;
mu = 1.5e-5      ; % mu factor for the reynolds number


z = 0:0.01:L;

qp = q0p.*sin(pi.*z./Le);

Tcoo = q0p.*Le./(pi.*m.*cp).*(-cos(pi.*z./Le) + 1) + Tin;

Tcl = Tcoo + q0p.*sin(pi.*z./Le)./(2*pi).*(1./(Rco.*hf) + 1./kc.*log(Rco./Rci)  + 1./(2.*kfu)) ;

Tw = Tcoo + q0p.*sin(pi.*z./Le)./(2*pi).*(1./(Rco.*hf));

Tclad = Tcoo + q0p.*sin(pi.*z./Le)./(2*pi).*(1./(Rco.*hf) + 1./kc.*log(Rco./Rci));

%Tg = Tf + q0p.*sin(pi.*z./Le)./(2*pi).*(1./(Rco.*hf) + 1./kc.*log(Rco./Rci)+1./(Rg.*hg));

%
figure (1)
hold on; box on; grid on;
plot (Tcl,z)
plot (Tcoo,z)
plot (Tw,z)
plot (Tclad,z)
%plot (Tg,z)
legend ('fuel','bulk','wall','clad')

%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

zspan = [0 L];
T0 = Tin;
[zz,T] = ode45(@(z,T) q0p.*sin(pi.*z./Le)./(m.*(myObj.Cp(T))), zspan, T0);

%V = myObj.visc(300)

%%%%%%%%%%%%%%%%%

Din = Rci.*2 ;
Dout = Rco.*2;
Dh = Dout-Din;


Re = 4.*m./(mu.*pi.*Dh);
% valid for small ratio a = D2/D1 < 5
Pr = mu.*cp./kH;
Nu = 0.023.*Re.^0.8.*Pr.^0.4; % Pr^n with n= 0.4 because is being heated



for i= 1:numel (zz)
    
    cp = myObj.Cp(T(i));
    mu = visc(T(i));
    Pr = mu.*cp./kH;
    
    Re = 4.*m./(mu.*pi.*Dh);
    
    Nu = 0.023.*Re.^0.8.*Pr.^0.4; % Pr^n with n= 0.4 because is being heated
    h = Nu.*kH./Dh ;
    
    Tww(i) = T(i) + q0p.*sin(pi.*zz(i)./Le)./(2*pi).*(1./(Rco.*h));
end
%
figure (2)
hold on; box on; grid on;
plot (T,zz)
plot (Tcoo,z,'.')
plot (Tww,zz,'-')
plot (Tw,z)
%
%

