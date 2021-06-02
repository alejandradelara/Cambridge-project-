clc
clear
%%%%%%%%%%%%%%%%%
%Parameters
p_i = 60*101325; 
T_i = 300; 
d = 0.0005; 
ep = 0.4; 
c = 14600; 
gm = 1.409 ; 
mu_i = 9e-6; 
R = 4157; 
l = 0.01 ; 

%%%%%%%%%%%%%%%%%
n = 2/3; 


K = ep^3.*d.^2./(150.*(1-ep).^2) ; 
b = 1.75.*sqrt(K)./(sqrt(150).*ep.^(1.5)); 

% flow properties are nondimensionalised using bed input flow quantities
% p_i, rho_i, T_i, u_i
% length scales are nondimensionalised by hte particle diameter d


% nondimensionalised

%Re = pho_i.*u_i.*d./mu_i ; 
Fs = b./d;
Da = K./d.^2; 
%phi = (T_end-T_i)./T_i;
%Pr = mu_i.*c./k;
%S = (rho.*c)./(rho_i.*c);
%lb = k_m./k; 



% zeroth order quantities
%{ 
p_o = rho_o.*R.*T_o;
rho_o.*u_o = 1; 
% momentum eqn
% energy eqn
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%random values
Re = linspace (1,130,100) ; 
%Re = 1.5; 
phi = linspace (1,15,4) ; 
phi = 15;

x = l./d; 

% mu = mu_i.*(T./T_i).^n;
% Re_exit = d./mu; 

for j = 1:numel(phi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:numel(Re)
q = (phi(j).*Re(i).*c.*T_i.*mu_i)./(l.*d) ; 

M_i = (gm-1)/gm.*q.*l./(phi(j).*p_i.*sqrt(gm.*R.*T_i)); 
%M_i = (gm-1)/gm.*Re(i).*c.*T_i.*mu_i./(d.*p_i.*sqrt(gm.*R.*T_i)); 
T = d./l.*phi(j).*x +1; 


p0_i2(i) = 1-gm.*M_i.^2 .* (3/4*l./(d.*phi(j).*Re(i).*Da).*(T.^(n+2)-1) + l*Fs./(d.*phi(j).*Da).*(T.^2-1)) ; 
p0_i(i) = sqrt (p0_i2(i)); 


tra(i) = (-gm.*M_i.^2.* (3/4*l./(d.*phi(j).*Re(i).*Da).*(T.^(n+2)-1) + 2.*l*Fs./(d.*phi(j).*Da).*(T.^2-1)))./(2*p0_i2(i));
trb(i) = (gm.*M_i.^2.* (3/4*l./(d.*phi(j).*Re(i).*Da).*(T.^(n+2)-1)))./(2*p0_i2(i));
end

dydx = gradient(log10(p0_i(:))) ./ gradient(log10(Re(:)));



txt = ['phi ',num2str(phi(j))];

figure(1)
hold on;box on; grid on;
%plot(log10(Re),dydx)
% plot(log10(Re),dydx,'DisplayName',txt)
plot(log10(Re),tra,'r.')
plot(log10(Re),trb,'c.')
%plot(log10(Re),dydx,'DisplayName',txt)

end
legend show

% figure(2)
% hold on;box on; grid on;
% plot(log10(Re),phi)
%plot(log10(Re),dydx,'DisplayName',txt)
% 
% [D,E] = find (dydx>-0.0002);
% val = log10(Re(D(end))); 


% figure(2)
% plot3(log10(Re),phi,dydx)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %random values
% %Re = linspace (1,250,100) ; 
% Re = 32; 
% phi = linspace (1,15,50) ; 
% %phi = 16;
% 
% x = l./d; 
% i = 1; 
% 
% for j = 1:numel(phi)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% q = (phi(j).*Re(i).*c.*T_i.*mu_i)./(l.*d) ; 
% 
% M_i = (gm-1)/gm.*q.*l./(phi(j).*p_i.*sqrt(gm.*R.*T_i)); 
% T = d./l.*phi(j).*x +1; 
% p0_i2 = 1-gm.*M_i.^2 .* (3/4*l./(d.*phi(j).*Re(i).*Da).*(T^(n+2)-1) + l*Fs./(d.*phi(j).*Da).*(T.^2-1)) ; 
% p0_i = sqrt (p0_i2); 
% dydx2(j) = (log10(p0_i)) ./ (log10(Re));
% 
% end
% 
% 
% 
% figure(4)
% hold on;box on; grid on;
% plot(phi,dydx2)
% %plot(phi,dydx,'DisplayName',txt)
% %plot(log10(Re),dydx,'DisplayName',txt)
% 
% 
% legend show
