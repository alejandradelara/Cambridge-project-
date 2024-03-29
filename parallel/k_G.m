% k of graphite

%real = kkk = -1.6753e-8.*(0:2000).^3 + 9.5687e-5.*(0:2000).^2 - 1.9529e-1.*(0:2000) + 2.3090e2;


function k_GRP = k_G(T)
       a1 =       698.9 ;
       b1 =       -2263  ;
       c1 =        1922 ;
       a2 =       84.24 ;
       b2 =        2085 ;
       c2 =        3259    ;
k_GRP = a1*exp(-((T-b1)/c1).^2) + a2*exp(-((T-b2)/c2).^2);

end