% Aluminium Al
% Beryllium Be
function k_Types = k_(T,type)

if strcmpi(type, 'Al')
    
    p1 =       209.2  ;
    p2 =  -1.844e+04 ;
    q1 =      -91.24  ;
    
    k_Types = (p1.*T + p2)./ (T + q1);
    
elseif strcmpi(type, 'Be')
    a =   1.075e+04  ;
    b =     -0.6963;
    
    k_Types= a.*T.^b;
    
end

end


%https://www.nist.gov/mml/acmd/1100-aluminum-uns-a91100
% but is from 4-300 so i did a fitting

%%% beryllium   https://www.engineeringtoolbox.com/thermal-conductivity-metals-d_858.html


