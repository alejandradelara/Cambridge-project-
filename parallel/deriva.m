% ===================================================
% Primera derivada de una funcion
% Pablo Garcia Gonzalez 12/agosto/2016
% Array arbitrario
% Uso : DF = deriva(F,X)
% X   : array fila con los valores de x
% F   : array fila con los valores de la funcion f(x)
% DF  : array fila con los valores de f'(x)
% ===================================================
function DF = deriva(F,X)
N = numel(X) ; % Numero de elementos
DF(1) = (F(2)-F(1))/(X(2)-X(1)) ;     % Derivada k=1
DF(N) = (F(N)-F(N-1))/(X(N)-X(N-1)) ; % Derivada k=N
for k = 2:N-1
    dizq = (F(k)-F(k-1))/(X(k)-X(k-1)) ;
    dder = (F(k+1)-F(k))/(X(k+1)-X(k)) ;
    DF(k) = 0.5*(dizq+dder) ;
end
return
end