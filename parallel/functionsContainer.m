%fuel = to find the heat distribution of the moderator
%Cp   = to find the specific heat (cte pressure)



classdef functionsContainer
    methods
        
        function [r,t] = fuel(obj,q0,rc,R,Tw,kU)
            
            rspan = [rc R];
            [r,t] = ode45(@(r,t) q0./(kU.*2.*pi.*r), rspan, Tw);
            
        end
        
        function CP = Cp (obj,T)
            A = [33.066178,18.563083,43.413560];
            B = [-11.363417,12.257357,-4.293079];
            C = [11.432816,-2.859786,1.272428];
            D = [-2.772874,0.268238,-0.096876];
            E = [-0.158558,1.977990,-20.533862];
            
            t = T./1000;
            if  t<(1000*1e-3)
                CP = A(1) + B(1).*t + C(1).*t.^2 + D(1).*t.^3 + E(1)./t.^2 ;
            end
            
            if t>=(1000*1e-3) & t<(2500*1e-3)
                CP = A(2) + B(2).*t + C(2).*t.^2 + D(2).*t.^3 + E(2)./t.^2 ;
            end
            
            if t>=(2500*1e-3)
                CP = A(3) + B(3).*t + C(3).*t.^2 + D(3).*t.^3 + E(3)./t.^2 ;
            end
            
            CP = CP.*1000./2;
        end
        
    end
end
