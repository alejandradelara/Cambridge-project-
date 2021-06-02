
function k_Types = k_(T,type)

if strcmpi(type, 'Al')

p1 =       209.2  ;
p2 =  -1.844e+04 ;
q1 =      -91.24  ;

k_Types = (p1.*T + p2)./ (T + q1);

if strcmpi(type, 'Be')

end

%https://www.nist.gov/mml/acmd/1100-aluminum-uns-a91100
% but is from 4-300 so i did a fitting