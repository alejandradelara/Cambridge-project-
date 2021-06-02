%viscosity
%https://h2tools.org/hyarc/hydrogen-data/hydrogen-viscosity-different-temperatures-and-pressures

V = [6.3447,6.9143,7.4668,8.0031,8.5245,9.0321,9.5270,10.010,10.483,10.945].*1e-6;
T_C= [-100,-75,-50,-25,0,25,50,75,100,125] ;
T_K = T_C +273.15;
xx = 0:.25:3000;
%yy = spline(T_C,V,xx);
p = polyfit(T_C,V,1);

poly = p(1).*xx + p(2);
y1 = polyval(p,xx);

%[val, idx] = find(xx = 400);

figure (1)
hold on; box on; grid on;
plot (T_C,V,'.')
plot (xx,y1)
plot (xx,poly,'--')
