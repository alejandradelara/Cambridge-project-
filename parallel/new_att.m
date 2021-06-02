clc
clear

cp = 1.456e4; 
Ti = 300; 
p_i = 1e7; 
ep = 0.3; 
v = 0.7; 
Q = 4e10; 
gm = 1.409 ; 
l = 0.01 ; 
Dp = 0.5e-3;
R = 4124;
mu0 = 0.87e-5;

%q = 5 ; 

Re = linspace(1,100,100); 

for i = 1:numel (Re)

qq(i) = Dp.*Q.*l./(cp.*Ti.*mu0.*Re(i));

q = qq(i);
%q = 10;
    
M = (gm-1)./gm .* Q.*l./(p_i.*q.*sqrt(gm.*R.*Ti)) ; 
%M = (gm-1)./gm .* Q.*l./(1.*q.*sqrt(gm.*R.*Ti)) ; 

b1 = 150.*(1-ep).^2./ep.^3 .*1./Dp .*gm.*M.^2./Re(i); 
b2 = 1.75.*(1-ep)./ep.^3.*1./Dp .*gm.*M.^2;

x = 1 ; 

A = 2.*b1.*Re(i)./((v+2).*q).* ((1+q.*x).^(v+2) -1 );
%q = Dp.*Q.*l./(cp.*Ti.*mu0.*Re(i));

po(i) = 1 - 2.*b1./((v+2).*q).*((1+q.*x).^(v+2) -1 ) -b2./q .*((1+q.*x).^(2) -1) ; %p^2
P(i) = sqrt(- po(i));


rat(i) = A./(2.*Re(i).*po(i));
%P(i) = sqrt(-po(i));
end 

figure(1)
hold on;grid on;box on;
plot(log10(Re),log10(P))

b = polyfit(log10(Re),log10(P), 1);
sl = b(1);

figure(2)
hold on;grid on;box on;
plot(log10(Re),rat)

figure(3)
hold on;grid on;box on;
%plot(log10(Re),log10(P))

samplingRateIncrease = 10;
newXSamplePoints = linspace(0,log10(100), numel(Re) * samplingRateIncrease);
smoothedY = spline(log10(Re), log10((P)), newXSamplePoints);

%plot(newXSamplePoints, smoothedY, '-ob');

slopes = [0, diff(smoothedY)];
plot(newXSamplePoints(2:end), slopes(2:end), 'k-', 'LineWidth', 3);



%%
% 
% Re = linspace(1,100,100); 
% 
% for i = 1:numel (Re)
% 
% q = Dp.*Q.*l./(cp.*Ti.*mu0.*Re(i));
% 
% q = 5
%     
% %M = (gm-1)./gm .* Q.*l./(p_i.*q.*sqrt(gm.*R.*Ti)) ; 
% 
% b1 = 150.*(1-ep).^2./ep.^3 .*1./Dp.^3 .*((gm-1)./gm).^2 .*cp.^2.*Ti.*mu0.^2./(p_i.^2.*R) ; 
% b2 = 1.75.*(1-ep)./ep.^3.*1./Dp.^3 .*((gm-1)./gm).^2 .*cp.^2.*Ti.*mu0.^2./(p_i.^2.*R) ;
% 
% x = 1 ; 
% 
% %A = 2.*b1.*Re(i)./((v+2).*q).* ((1+q.*x).^(v+2) -1 );
% %q = Dp.*Q.*l./(cp.*Ti.*mu0.*Re(i));
% 
% po(i) = 1 - 2.*b1./((v+2).*q).*((1+q.*x).^(v+2) -1 ).*Re(i) -b2./q .*((1+q.*x).^(2) -1).*Re(i).^2 ; 
% P(i) = sqrt(- po(i));
% 
% rat(i) = (- 2.*b1./((v+2).*q).*((1+q.*x).^(v+2) -1 ).*Re(i) -b2./q .*((1+q.*x).^(2) -1).*Re(i).^2 )./(2.*po(i));
% %rat(i) = A./(2.*Re(i).*po(i));
% %P(i) = sqrt(-po(i));
% end 