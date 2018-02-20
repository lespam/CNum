% MÉTODO DE LA POTENCIA
%----------------------
% Ejercicio 2.1.1
clear
clc
format long;
A   = [1 -1 0; 1 9 -1; 2 3 3];
q0  = [1; 1; 1];
k   = 10;
TOL = 10^-15;

[m,w] = mPI( A, q0, k, TOL);

% Ejercicio 2.1.2
[V,D] = eig(A);
e = sort(D,'descend');
% Obtenido con el método de potencia
m
% "Real"
e(1,3)
e - m

% Ejercicio 2.1.3
v = V(:,3)
j = 10;
for i=1:j
    [m,q(:,i)] =  mPI( A, q0, i, TOL);
    if(i>1)
        razon(i-1) = norm(q(i)-v, Inf)/norm(q(i-1)-v, Inf)
    end
end

% Ejercicio 2.1.4
e(1,2)/e(1,3)

