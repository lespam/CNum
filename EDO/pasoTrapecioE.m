function [wNuevo] = pasoTrapecioE(f, tj, wj, h)
%Trapecio expl´?cito
% In:   f ... lado derecho de la EDO
%       wj ... (vector columna) con CI de dimens
%       tj ... tiempo inicial
%       h ...  tamaño del paso
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)

    wNuevo = wj + (h/2)*(f(tj, wj)+f(tj+h, @pasoEulerE)); 

end