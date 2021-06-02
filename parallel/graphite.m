function k = graphite(T)
p = [-1.6753e-8,9.5687e-5,-1.9529e-1,2.3090e+2];
k = p(1).*T.^3 + p(2).*T.^2 + p(3).*T + p(4);
end