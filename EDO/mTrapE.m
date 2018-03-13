function [T, W] = mTrapE(f, y0, I, m)
%Trapecio expl´?cito
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


[T,W] = mGenerico(@pasoTrapecioE, f, y0, I, m)

end

