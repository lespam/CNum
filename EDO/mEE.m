function [T, W] = mEE(f, y0, I, m)
%Euler expl´?cito
% In:   f ... lado derecho de la EDO
%       yo ... (vector columna) con CI
%       I ... vector [t0, tm]
%       m ...  número de pasos
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)

% T = linspace(I(1), I(2), m+1); %Malla
% n = length(y0);
% W = zeros(n, m+1);
% W(:,1) = y0;
% 
% h = (I(2)-I(1))/m;
% for j=1:m
%     W(:,j+1) = W(:,j) + h*f((T(j)), W(:,j));
% end

[T,W] = mGenerico(@pasoEuler, f, y0, I, m)
end

