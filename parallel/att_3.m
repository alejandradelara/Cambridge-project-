%third attempt
clc
clear

gm = 1.409 ; 
l = 0.01 ; 
Dp = 0.5e-3;
T_i = 300;
ep = 0.4;
c = 14600;
mu_i = 9e-6;
R_cons = 4157;
p_i =  60.*101325;
%p_i = 60;
n = 2/3;

%q_0 = 4e10;

mu = @(T,v) mu_i.*(T./Ti).^n; 

K = ep.^3.*Dp.^2./(150.*(1-ep).^2);
b = 1.75.*sqrt(K)./(sqrt(150).*ep^1.5);

%Re_0 = rho_i*u_i*Dp./mu_i; 

Da = K./(Dp).^2;
Fs = b./Dp;


%p_0 = rho_0*R_cons*T_0;

Re_0 = linspace(1,300,100);
phi = linspace(1,15,100);
x = linspace(0,1,10);

q = phi.*Re_0.*c.*T_i.*mu_i./(l.*Dp) ; 


% non-dim

%p_0 = rho_0*T_0;


%u_0 = 1./rho_0; 

% T_0 = Dp./l.*phi.*1+1 ; %% assume x = 1; 
% %phi = (T_0-T_i)./T_i ; 
% 
% M_i = (gm-1)/gm *q_0.*l./(p_i.*phi.*sqrt(gm.*R_cons.*T_i)) ; 
% 
% %po exit
% p_0 = sqrt(1-gm.*M_i.^2.*(3/4.*l./(Dp.*phi.*Re_0.*Da).*(T_0.^(n+2)-1)+l.*Fs./(Dp.*phi.*Da).*(T_0.^2-1)));

%%lp0 = log10(sqrt(1-gm.*((gm-1)/gm*mu_i*c*T_i./(Dp.*p_i.*sqrt(gm.*R_cons.*T_i)).^2.*(Re_0).^2.*(3/4.*l./(Dp.*phi(i).*10.^(lRe).*Da).*(T_0.^(n+2)-1)+l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1))));  

lRe = log10(Re_0) ;
% for i= 1:numel(phi)
% T_0 = Dp./l.*phi(i).*1 + 1 ;
% 
% q_0 = phi(i).*10.^lRe.*c.*T_i.*mu_i./(l.*Dp); 
% 
% M_i = (gm-1)/gm *q_0.*l./(p_i.*phi(i).*sqrt(gm.*R_cons.*T_i)) ; 
% 
% lp_0= log10(sqrt(1-gm.*M_i.^2.*(3/4.*l./(Dp.*phi(i).*10.^(lRe).*Da).*(T_0.^(n+2)-1)+l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1))));  
% gd(i,:) = deriva(lp_0,lRe);
% %gp (i,:) = gradient(lp_0); 
% 
% der(i,:)= 1/2 * (-2.*(gm.*M_i.^2.*(3/4.*l./(Dp.*phi(i).*10.^(lRe).*Da).*(T_0.^(n+2)-1)+l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1))) + (gm.*M_i.^2.*(3/4.*l./(Dp.*phi(i).*10.^(lRe).*Da).*(T_0.^(n+2)-1)))) ./((1-gm.*M_i.^2.*(3/4.*l./(Dp.*phi(i).*10.^(lRe).*Da).*(T_0.^(n+2)-1)+l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1))));
% 
% end

%M_i = (gm-1)/gm *c.*T_i.*mu_i./(Dp.*p_i.*sqrt(gm.*R_cons.*T_i)).*Re_0(1);
% % 
% % Re_0 = linspace(1,300,10);
% % %phi = linspace(1,15,100);
% % x = linspace(0,1,10);
% % i = 1; 
% % Re_0 = 10
% % q_0 = phi(i).*Re_0.*c.*T_i.*mu_i./(l.*Dp); 
% % M_i = (gm-1)/gm *q_0.*l./(phi(i).*p_i.*sqrt(gm.*R_cons.*T_i));
% % T_0 = Dp./l.*phi(i).* x + 1 ;
% % %T_0 = q_0.* 1 + 1 ;
% % X = 10;
% % 
% % 
% % A = gm*(M_i).^2; 
% % B = 3/4.*l./(Dp.*phi(i).*Da).*(T_0.^(n+2)-1);
% % C = l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1);
% % y = sqrt(1-A.*B./X -A.*C);

%%





Re_0 = linspace(1,300,100);
phi = linspace(1,15,100);

for i= 1:numel(phi)

q_0 = phi(i).*Re_0.*c.*T_i.*mu_i./(l.*Dp); 
M_i = (gm-1)/gm *q_0.*l./(phi(i).*p_i.*sqrt(gm.*R_cons.*T_i));
T_0 = Dp./l.*phi(i).* 1 + 1 ;
%T_0 = q_0.* 1 + 1 ;
X = Re_0;


A = gm*(M_i).^2; 
B = 3/4.*l./(Dp.*phi(i).*Da).*(T_0.^(n+2)-1);
C = l.*Fs./(Dp.*phi(i).*Da).*(T_0.^2-1);
y(i,:) = sqrt(1-A.*B./X -A.*C);
%gp (i,:) = gradient(log10(y),log10(Re_0)); 
ratio(i,:) = (+B.*A)./(X.*2.*y(i,:).^2) ;

%ratio(i,:) = (+B.*A)./(X.*2.*y.^2) ;

gd(i,:) = deriva(y,lRe);


end



% figure(2)
% hold on;grid on;box on;
% plot(log10(Re_0),log10(y(1,:).*p_i))
%plot(lRe,ratio(1,:))
%plot(log10(Re_0),log10(y.*p_i))
% plot(lRe,ratio(end,:))
%plot(lRe,gd(1,:))


% figure(1)
% hold on;grid on;box on;
% plot(lRe,gd(1,:))
% plot(lRe,gd(100,:))
% plot(lRe,gd(end,:))
% plot(lRe,der(1,:),'.')
% plot(lRe,der(50,:),'.')

% figure(2)
% hold on;grid on;box on;
% plot(lRe,lp_0)
% plot(lRe,gd(end,:))
y = 0;
ratio = 0;
phi = 1;
Re_0 = linspace(1,200,100);

for i= 1:numel(Re_0)

q_0 = phi(1).*Re_0(i).*c.*T_i.*mu_i./(l.*Dp); 
%q_0 = 4e10;
M_i = (gm-1)/gm *q_0.*l./(phi(1).*p_i.*sqrt(gm.*R_cons.*T_i));
T_0 = Dp./l.*phi(1).* 1 + 1 ;
%T_0 = q_0.* 1 + 1 ;
X = Re_0(i);


A = gm*(M_i).^2; 
B = 3/4.*l./(Dp.*phi(1).*Da).*(T_0.^(n+2)-1);
C = l.*Fs./(Dp.*phi(1).*Da).*(T_0.^2-1);
y(i) = (1-A.*B./X -A.*C);

P(i) = sqrt(y(i));
%gp (i,:) = gradient(log10(y),log10(Re_0)); 
ratio(i) = (B.*A)./(X.*2.*y(i)) ;

%ratio(i,:) = (+B.*A)./(X.*2.*y.^2) ;

%gd(i,:) = deriva(y,lRe);


end


figure(3)
hold on;grid on;box on;
plot(log10(Re_0),ratio)




figure(5)
hold on;grid on;box on;
%plot(log10(Re),log10(P))

samplingRateIncrease = 10;
newXSamplePoints = linspace(0,log10(100), numel(Re_0) * samplingRateIncrease);
smoothedY = spline(log10(Re_0), log10(P), newXSamplePoints);

%plot(newXSamplePoints, smoothedY, '-ob');

slopes = [0, diff(smoothedY)];
plot(newXSamplePoints(2:end), slopes(2:end), 'k-', 'LineWidth', 3);


figure(15)
hold on;grid on;box on;
plot(log10(Re_0),log10(P))


b = polyfit(log10(Re_0),log10(P), 1);
sl = b(1);