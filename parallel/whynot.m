
data = dlmread('temp_cpc_h2.dat');
xx = linspace (data(1,1),data(end,1),1000);
temp = interp1(data(:,1),data(:,2),xx,'spline');

%[A,B] = find(xx<T);
%cp  = temp(B(end)).*1e3;

a1 =       28.77  ;
b1 =   0.0005545  ;
c1 =     -0.2892  ;
a2 =       12.66  ;
b2 =    0.001147  ;
c2 =       1.053  ;
a3 =       3.903  ;
b3 =    0.002117  ;
c3 =       1.199  ;
a4 =       2.046  ;
b4 =    0.003074  ;
c4 =       1.305  ;
a5 =       1.398  ;
b5 =     0.00404  ;
c5 =       1.379  ;
a6 =       3.325  ;
b6 =    0.004882  ;
c6 =       1.885  ;
a7 =       2.689  ;
b7 =     0.00498  ;
c7 =       4.729  ;
a8 =     0.01063  ;
b8 =    0.006994  ;
c8 =       1.949  ;


fit = a1*sin(b1*x+c1) + a2*sin(b2*x+c2) + a3*sin(b3*x+c3) + a4*sin(b4*x+c4) + a5*sin(b5*x+c5) + a6*sin(b6*x+c6) + a7*sin(b7*x+c7) + a8*sin(b8*x+c8);

figure(2)
hold on;grid on;box on;
%plot(xx,temp,'.-','LineWidth',2)
plot(x,fit,'.-','LineWidth',2)
ylabel ('k', 'FontSize', 12)
xlabel ('Vm/Vf', 'FontSize', 12)