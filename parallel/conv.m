%convective hydrogen
function h = conv (mu,cp,kH,m,Dh)
Pr = mu.*cp./kH;
Re = 4.*m./(mu.*pi.*Dh);
Nu = 0.023.*Re.^0.8.*Pr.^0.4; % Pr^n with n= 0.4 because is being heated
h = Nu.*kH./Dh ;

end