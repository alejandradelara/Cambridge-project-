%%
% after FUEL_ne9

Tin = 300;
ROUT = 0.0435;
V_p = 4/3*pi.*Rp.^3;
ep = void;
l = 0.01;
%l = 1.2e-2;
hig = 0.13;

num_max = 10;
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
        
%         mdot = 1; 
%         R1 = 0.5e-4;
%         
        while diff>0.1
            
            
            cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
            
            % area at the end as there is where the hottest particle is
%            Area = 2.*pi.*(0.087/2-l).*hig; % cross sectional area
            Area = 2.*pi.*(0.087/2-l).*hig; % cross sectional area
            vel = mdot./(rho(T_guess).*(Area.*ep)); % cross sectional vel
            Re = rho(T_guess).*vel.*Rp.*2./visc(T_guess);
%             if Re<2300
%                 Nu_sp = 3.66;
%             else
                %Nu_sp = 2+1.1.*Re.^0.5.*prntl(TT(i)).^0.33;
            %end
            Nu_sp = 2+1.1.*Re.^0.5.*prntl(T_guess).^0.33;
            h_t = (Nu_sp.*conduc(T_guess)./dp);
            
            
            
            Vol_tot = pi.*(ROUT.^2-(ROUT-l).^2).*hig; %total vol
            N_p_tot = Vol_tot./V_p.*(1-ep);
            
            Vf = 4/3.*pi.*R1.^3; % volume of the fuel
            br1 = 1./(Vf).*(R1.^2./(6.*k_UC) + Vf./(4*pi*k_graph).*(1./R1-1./1.5e-4) + Vf./(4*pi*k_ZrC).*(1./1.5e-4-1./Rp));
            br2 = 1./(4*pi.*R1.^2.*h_t) + 1./(mdot.*cp_av);
            
            P_test = ele.*(Tf_max-Tin)./(br1+br2).*N_p_tot; % P tot
            
            T2 = P_test./(ele.*mdot.*cp_av) + Tin; % recalculate T with the calculated P
            
            diff = abs(T_guess-T2); % check convergence
            
            T_guess = T2;
            
            i = i+1;
        end
        
        % s is the radii
        % j is the mass flow rate
        
        T_save(s,j) = T2;
        P_save(s,j) = P_test;
        
    end
end

%%
% plot the temperature and the total power VS mass flow rate per radii

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
% determine wich convination is better

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

%%
S_3000(1)= 0 ;
S_1e9(1)= 0 ;

for s= 1:numel(R11)
    
    if tot_3000(s,2)<3000 && 7e8<tot_3000(s,3) && tot_3000(s,3)<1.3e9
        S_3000(s) = s;
    else S_3000(s) = 0;
    end
    
    
    
    if tot_1e9(s,2)==0
        S_1e9(s) = 0;
    elseif tot_1e9(s,2)<3000 && 7e8<tot_1e9(s,3) && tot_1e9(s,3)<1.3e9
        S_1e9(s) = s;
    else S_1e9(s) = 0;
    end
    
    
end

S_3000(S_3000 == 0) = [];
S_1e9(S_1e9 == 0) = [];


posb = [tot_3000(S_3000,:,:,:)];

pos_decided = posb(2,:,:,:);
% pos_decided(1) = R1 ; pos_decided(2) = Tout ; pos_decided(3) = P_tot ;
% pos_decided(4) = mdot 