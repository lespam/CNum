function [T, W, k] = mGenerico_estados(paso, f, y0, I, m)
%Euler expl??cito
% In:   f ... lado derecho de la EDO
%       yo ... (vector columna) con CI
%       I ... vector [t0, tm]
%       m ...  n?mero de pasos
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)

T = linspace(I(1), I(2), m+1); %Malla
n = length(y0);
W = zeros(n, m+1);
W(:,1) = y0;
k(:,1) = 0;
h = (I(2)-I(1))/m;
for j=1:m
    [W(:,j+1),k(:,j+1)] = paso(f, T(j), W(:,j), h,k(:,j));
end
k = k(end);
end

