%%% graphs 

% impulse

g0 = 9.8 ;
R  = 8.31 ; 
%T  = 2360 ; 
T = 500:4000; 
P2 = 101325; 
P1 = 4.*1e6 ; 

gm = [ 1.4,1.41,1.67,1.31];
M = [29,2,4,44].*1e-3;
name = (["Air","H_2","He","CO_2"]);

figure (1)
hold on; box on; grid on; 

for i= 1:4
t1 = 2.*gm(i)./(gm(i)-1);
t2 = R.*T./M(i) ;
t3 = 1-(P2./P1).^((gm(i)-1)./gm(i));
I = sqrt (t1.*t2.*t3)./g0 ; 
plot (T,I,'DisplayName',name(i))
end

xlabel 'Temperature (K)'
ylabel 'Specific Impulse (s)'
legend 

