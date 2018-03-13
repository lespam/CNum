function [wNuevo] = pasoEulerE(f, tj, wj, h)
%Euler expl´?cito
% In:   f ... lado derecho de la EDO
%       wj ... (vector columna) con CI de dimens
%       tj ... tiempo inicial
%       h ...  tamaño del paso
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)

    wNuevo = wj + h*f(tj, wj); 

end