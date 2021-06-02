
ep = 0.3;

%length of the bed 
l = 0.01;
dx = 0:dp:l;

dh = 1/6*dp.*ep./(1-ep); 
ROUT = 0.0435;
X = ROUT:-dp:ROUT-l; 

up = vel./ep;


Tin = 300; 
mdot = 1.22;

x = linspace(0,l,numel(X)-1); % i have NOT included the tortuosity here
xx = linspace(0,l,numel(X));
F = 0; 

for i = 2:numel(X)

Vol = pi.*(X(i-1).^2-X(i).^2).*0.13; %vol
V_p = 4/3*pi.*Rp.^3;
N_p(i-1) = Vol./V_p ;
F(i-1) = P./(ele.*N_p(i-1).*(1-ep).*4*pi*R1.^2); %flux grows when the volume lowers 
end

T_t = Tin ;
TT(1) = Tin; 

for i = 2:numel(X)

TT(i) = P./(ele.*mdot.*16e3.*l).*xx(i) + Tin;
    
end

%%
T_guess = 3000; 
Tf_max = 3000;
T2(1) = 0 ; 
%rho_t = rho(T_guess)
i = 1; 
cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
%mdot =P./(ele.*cp_av.*(T_guess-Tin));
diff = abs(T_guess-T2);
P_test = 1e10; 


%while P_test>1e9

num_max = 20; 
mdot = 0; 
T_save = zeros(1,num_max);  
P_save = zeros(1,num_max);
R1 = 1.1e-4;
R11 = linspace(0.5e-4,1e-4,20);

for s = 1:numel(R11)
    R1 = R11(s);
    mdot = 0;

for j = 1:num_max
    
    mdot = mdot+1;
    M(j) = mdot;
    T_guess = 3000; 
    Tf_max = 3000;
    T2(1) = 0 ; 
    i = 1; 
    cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
    diff = abs(T_guess-T2);
    P_test = 1e10;
    


while diff>0.1
    

cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
Area = 2.*pi.*(0.087/2-l).*0.13; % cross sectional area 
vel = mdot./(rho(T_guess).*(Area.*ep)); % cross sectional vel 
Re = rho(T_guess).*vel.*Rp.*2./visc(T_guess); 
Nu_l = 0.664.*prntl(T_guess).^(1/3).*(Re./ep).^0.5;
Nu_t = 0.037.*(Re./ep).^0.8.*prntl(T_guess)./(1+2.443*(Re./ep).^(-0.1).*(prntl(T_guess).^(2/3)-1)) ;
Nu_sp = 2 + (Nu_l.^2 + Nu_t.^2).^0.5 ;
Nu_sp = 2+1.1.*Re.^0.5.*prntl(T_guess).^0.33;
%Nu_n = (1+1.5*(1-ep)).*Nu_sp;
h_t = (Nu_sp.*conduc(T_guess)./dp);

Vol_tot = pi.*(ROUT.^2-(ROUT-l).^2).*0.13; %total vol
N_p_tot = Vol_tot./V_p.*(1-ep); 
N_p_end = N_p(end).*(1-ep) ;

%R1 = 0.7e-4;
Vf = 4/3.*pi.*R1.^3; 
br1 = 1./(Vf).*(R1.^2./(6.*k_UC) + Vf./(4*pi*k_graph).*(1./R1-1./1.5e-4) + Vf./(4*pi*k_ZrC).*(1./1.5e-4-1./Rp));
br2 = 1./(4*pi.*R1.^2.*h_t) + 1./(mdot.*cp_av); 
P_test = ele.*(Tf_max-Tin)./(br1+br2).*N_p_tot; % q of the 

T2 = P_test./(ele.*mdot.*cp_av) + Tin;

diff = abs(T_guess-T2); 

T_guess = T2;

i = i+1;
end

T_save(s,j) = T2;  
P_save(s,j) = P_test;

end
end

%%


figure(1)
hold on; box on; grid on;
for s = 1:numel(R11)

txt = ['X = ',num2str(R11(s))];

plot (M,T_save(s,:),'DisplayName',txt)

%plot (M,P_save(s,:),'DisplayName',txt)

end
legend show


figure(2)
hold on; box on; grid on;
for s = 1:numel(R11)
txt = ['X = ',num2str(R11(s))];
plot (M,P_save(s,:),'DisplayName',txt)
%Tf_pr = P./(N_p_tot.*ele).*(br1+br2) + Tin

end
legend show

%%

for s = 1:numel(R11)

    [row,col] = find(T_save(s,:)<3000) ;
    T_3000(s) = T_save(s,min(col));
    P_3000(s) = P_save(s,min(col));
    M_3000(s) = M(min(col));

end

tot_3000 = [R11',T_3000',P_3000',M_3000'];

for s = 1:numel(R11)
    
    
    [row,col] = find(P_save(s,:)<1e9) ;
    if (numel(row)>1)
        T_1e9(s) = T_save(s,min(col));
        P_1e9(s) = P_save(s,min(col));
        M_1e9(s) = M(min(col));
    else
        T_1e9(s) = 0;
        P_1e9(s) = 0;
        M_1e9(s) = 0;
    end
    
end

tot_1e9 = [R11',T_1e9',P_1e9',M_1e9'];