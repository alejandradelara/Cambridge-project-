%conductivity hidrogen

function k = conduc(T)
p = [0.000571085714286,0.011827619047619];
k = p(1).*T + p(2);

% p1 =      0.0004826   ;
% p2 =      0.04219  ;
% 
% k = p1.*T + p2;
end