clc
clear

Q = 4e10; 
v = 0.7; 
l = 0.01; 
d = 0.5e-3; 
cp = 1.456e4; 
T_i = 300; 
p_i = 1e7; 
ep = 0.3; 
gm = 1.409 ;
mu_i = 0.87e-5; 
R = 4157; 

x = 1; 

Re = linspace (1,200,100) ; 

for i = 1:numel(Re)
q(i) = d.*Q.*l./(cp.*T_i.*mu_i.*Re(i)); 
%q(i) = 15; 
M = (gm-1)./gm .*Q.*l./(p_i.*q(i).*sqrt(gm.*R.*T_i)) ; 

b1 = 150.*(1-ep).^2./ep.^3 .*l/d .* gm.*M.^2./Re(i); 
b2 = 1.75.*(1-ep)./ep.^3 .*l/d .* gm.*M.^2;

T = 1+q(i).*x; 
p02(i) = 1- 2*b1./((v+2).*q(i)).*(T.^(v+2)-1) -b2./q(i).*(T.^2-1);

p0(i) = sqrt(p02(i)) ; 

tr (i) = (2*b1./((v+2).*q(i)).*(T.^(v+2)-1))./(2.*p02(i)); 
end

dydx = gradient(log10(p0(:))) ./ gradient(log10(Re(:)));

figure(1)
hold on;box on; grid on;
%plot(log10(Re),dydx)
plot(log10(Re),tr,'.')

% figure(3)
% hold on;box on; grid on;
% plot(log10(Re),q)

