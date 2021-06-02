clc
clear

Power = 1e9;
qddd = 4e10; 
m3 = 25e-3;
ele = 37;
hig = 72.94e-2;
ep = 0.3; 
%https://www.hindawi.com/journals/ijne/2014/178360/
k_UC = 20 ; %(W/mK)
% [198C-6.6944   315-5.8576   402-6.276
% http://www.eyoungindustry.com/uploadfile/file/20160612/20160612155015_39381.pdf
k_graph = 180.4725;
%https://www.azom.com/properties.aspx?ArticleID=261
k_ZrC = 20.5;%(W/mK)
Rp = 2.5e-4;
dp = Rp.*2;
R2 = 2e-4; 

rin_up = 1.101e-2;
rout_up = 1.976e-2;

rin_down = 2.975e-2;
rout_down = 2.429e-2;

r_in = (rin_up + rin_down)./2 ;
r_out = (rout_up + rout_down)./2 ;
l = r_out -r_in; 
% 
% RR = rin_down.^2 + rout_down.^2 + rout_down.*rin_down;
% rr = rin_up.^2 + rout_up.^2 + rout_up.*rin_up;

% VOL = 1/3.*pi.*hig.*(RR - rr);
VOL = pi.*(r_out.^2 + r_in.^2).*hig;

Vp = 4/3.*pi.*(Rp).^3;

NN = VOL./Vp.*(1-ep);

R_try = (m3./ele .* 1./(4/3*pi.*NN)).^(1/3);
%R_try = (m3./ele .* 1./(4/3*pi.*NN.*(1-ep))).^(1/3);
Vf = 4/3.*pi.*(R_try).^3;
% go up ;

%%
% 
% num_max = 10;
% mdot = 0;
% T_save = zeros(1,num_max);
% P_save = zeros(1,num_max);
% M = linspace(0.5,20,num_max);

%%
Tin = 300; 
P_test = 1e9;
TOUT = 3000; 

cp_av = (H_cp(TOUT)+H_cp(Tin))./2.*1e3;
mdot = P_test./(ele.*cp_av.*(TOUT- Tin)) ;

%xspan= nonLinspace( 0, l ,50, 'log10' );
xspan = [0 l];

[x,t] = ode45(@(x,t) P_test./(l.*ele.*H_cp(t).*1e3.*mdot), xspan, Tin);

%%

%x = linspace (0,l,100)';
prantl = (visc(t).*H_cp(t).*1e3)./conduc(t);
Area = 2.*pi.*(r_out-x).*hig; % cross sectional area
vel = mdot./(rho(t).*(Area)); % cross sectional vel
Re = rho(t).*vel.*Rp.*2./visc(t);
Nu_l = 0.664.*prantl.^(1/3).*(Re./ep).^0.5;
Nu_t = 0.037.*(Re./ep).^0.8.*prantl./(1+2.443*(Re./ep).^(-0.1).*(prantl.^(2/3)-1)) ;

Nu_sp = 1.9.*(2 + (Nu_l.^2 + Nu_t.^2).^0.5) ;
h_t = (Nu_sp.*conduc(t)./dp);
T_film = Power./(ele.*NN.*4*pi*R_try.^2.*h_t) + t;




num_r = 50; 
r1 = linspace(R_try,eps,num_r);
r2 = linspace(R2,R_try,num_r);
r3 = linspace(Rp,R2,num_r);
RRR = [r1(end:-1:1),r2(end:-1:1),r3(end:-1:1)];

Tco = zeros (numel(x),num_r);
Tci = zeros (numel(x),num_r);
Tf = zeros (numel(x),num_r);
TTT=zeros (numel(x),numel(r1).*3);


for i = 1:numel(x)
    Tco(i,:) = (Power/(ele.*NN))./(4*pi.*k_NbC(T_film(i))).*(-1./Rp +1./r3) + T_film(i);
    Tci(i,:) = (Power/(ele.*NN))./(4*pi.*k_G(Tco(i,end))) .*(-1./R2 +1./r2) + Tco(i,end);
    Tf(i,:) = Power/(ele.*Vf.*NN).*(R_try.^2-r1.^2)./(6.*k_UC) + Tci(i,end);
    
    TTT(i,:) = [Tf(i,end:-1:1),Tci(i,end:-1:1),Tco(i,end:-1:1)];

end


QQ = Power./(ele.*NN);
dTCO  =QQ.* (1./(4*pi*k_ZrC).*(1./(R2)-1./Rp))  ;
dTCI = QQ.*(1./(4*pi*k_G(Tco(:,end))).*(1./R_try-1./(R2))) ;
dTF =QQ.* 1./(Vf).*(R_try.^2./(6.*k_UC));

%%

figure(1)
hold on; box on; grid on;
plot (x,T_film)
plot (x,t,'.')


figure(2)

for i = 39:2:numel(x)
    
    hold on; box on; grid on;
    plot (RRR,TTT(i,:))
    
%     plot (RRR,TTT(10,:))
%     plot (RRR,TTT(20,:))
end


%%
% % 
% % for j = 1:num_max
% % 
% %     mdot = M(j);
% %     T_guess = 3000;
% %     Tf_max = 3500;
% %     T2(1) = 0 ;
% %     i = 1;
% %     cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
% %     diff = abs(T_guess-T2);
% %     P_test = 1e9;
% %     
% %     while diff>1
% %         %
% %         prantl = (visc(T_guess).*H_cp(T_guess).*1e3)./conduc(T_guess);
% %         cp_av = (H_cp(T_guess)+H_cp(Tin))./2.*1e3;
% %         %
% %         %area at the end as there is where the hottest particle is
% %         %Area = 2.*pi.*(0.087/2-l).*hig; % cross sectional area
% %         Area = 2.*pi.*(r_out-l).*hig; % cross sectional area
% %         vel = mdot./(rho(T_guess).*(Area.*ep)); % cross sectional vel
% %         Re = rho(T_guess).*vel.*Rp.*2./visc(T_guess);
% %         %             if Re<2300
% %         %                 Nu_sp = 3.66;
% %         %             else
% %         %                 Nu_sp = 2+1.1.*Re.^0.5.*prantl(i).^0.33;
% %         %             end
% %         %             Nu_sp = 2+1.1.*Re.^0.5.*prantl.^0.33;
% %         %             h_t = (Nu_sp.*conduc(T_guess)./dp);
% %         
% %         Nu_l = 0.664.*prantl.^(1/3).*(Re./ep).^0.5;
% %         Nu_t = 0.037.*(Re./ep).^0.8.*prantl./(1+2.443*(Re./ep).^(-0.1).*(prantl.^(2/3)-1)) ;
% %         
% %         Nu_sp = 1.9.*(2 + (Nu_l.^2 + Nu_t.^2).^0.5) ;
% %         h_t = (Nu_sp.*conduc(T_guess)./dp);
% %         %    %%%
% %         %
% % %         Vol_tot = pi.*(r_out.^2-(r_out-l).^2).*hig; %total vol
% % %         N_p_tot = Vol_tot./V_p.*(1-ep);
% %         
% %         Vf = 4/3.*pi.*R1.^3; % volume of the fuel
% %         br1 = 1./(Vf).*(R1.^2./(6.*k_UC) + Vf./(4*pi*k_graph).*(1./R1-1./1.5e-4) + Vf./(4*pi*k_ZrC).*(1./1.5e-4-1./Rp));
% %         br2 = 1./(4*pi.*R1.^2.*h_t) + 1./(mdot.*cp_av);
% %         
% %         P_test = ele.*(Tf_max-Tin)./(br1+br2).*NN; % P tot
% %         
% %         T2 = P_test./(ele.*mdot.*cp_av) + Tin; % recalculate T with the calculated P
% %         
% %         
% %         if imag(T2) ~= 0
% %             %T_guess = 0;
% %             T2 = 0 ;
% %             P_test = 0;
% %             
% %             break
% %         end
% %         diff = abs(T_guess-T2);
% %         T_guess = T2 ;
% %         i = i+1;
% %         
% %         if i>10
% %             T2 = 0 ;
% %             P_test = 0;
% %             break
% %         end
% %         
% %         
% %     end
% %     
% %     % s is the radii
% %     % j is the mass flow rate
% %     
% %     T_save(j) = T2;
% %     P_save(j) = P_test;
% % end
% % 
% % %%
% % % determine wich convination is better
% % 
% % 
% % 
% % [row,col] = find(T_save(:)<3000) ;
% % T_3000 = T_save(min(col));
% % P_3000 = P_save(min(col));
% % M_3000 = M(min(col));
% % 
% % 
% % tot_3000 = [T_3000',P_3000',M_3000'];
% % 
% %     
% %     
% % [row,col] = find(P_save(:)<1e9) ;
% % if (numel(row)>1)
% %     T_1e9 = T_save(min(col));
% %     P_1e9 = P_save(min(col));
% %     M_1e9 = M(min(col));
% % else
% %     T_1e9 = 0;
% %     P_1e9 = 0;
% %     M_1e9 = 0;
% % end
% %     
% % 
% % tot_1e9 = [T_1e9',P_1e9',M_1e9'];
% % 
% % %%
% % S_3000(1)= 0 ;
% % S_1e9(1)= 0 ;
% % 
% % 
% %     
% % if tot_3000(1)<3000 && 7e8<tot_3000(2) && tot_3000(2)<1.3e9
% %     S_3000 = s;
% % else S_3000 = 0;
% % end
% % 
% % 
% % 
% % if tot_1e9(1)==0
% %     S_1e9 = 0;
% % elseif tot_1e9(1)<3000 && 7e8<tot_1e9(2) && tot_1e9(2)<1.3e9
% %     S_1e9(s) = s;
% % else S_1e9(s) = 0;
% % end
% % 
% %   
% % 
% % S_3000(S_3000 == 0) = [];
% % S_1e9(S_1e9 == 0) = [];
% % 
% % 
% % posb = [tot_3000(S_3000,:,:,:)];
% % 
% % 
% % pos_decided = posb(7,:,:,:);
% % % pos_decided(1) = R1 ; pos_decided(2) = Tout ; pos_decided(3) = P_tot ;
% % % pos_decided(4) = mdot
% % 
% % 

% %%
% kkk = -1.6753e-8.*(0:2000).^3 + 9.5687e-5.*(0:2000).^2 - 1.9529e-1.*(0:2000) + 2.3090e2;
%        a1 =       698.9 ;
%        b1 =       -2263  ;
%        c1 =        1922 ;
%        a2 =       84.24 ;
%        b2 =        2085 ;
%        c2 =        3259    ;
% %d =   0.0002586;
% kk = a1*exp(-((t-b1)/c1).^2) + a2*exp(-((t-b2)/c2).^2);
% %numero = 0:2000;
% 
% plot(x,kk)

%%

T_nb = [25,100,200,300,400,500,600,700,800,900,1000];
con_nb = [14,15,16,17,18,19,21,22,23,24,25];