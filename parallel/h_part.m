%convective hydrogen
function h = h_part (mu,cp,kH,m,Pd,void,rho,flow)
Pr = mu.*cp./kH;

V = m./(rho*flow*void)  
Re = rho.*V.*Pd./mu
Nu = 2 + 1.1*Re.^0.5*Pr.^0.33 ; 
h = Nu.*kH./Pd ;

end