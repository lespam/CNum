function [wNuevo] = pasoTrapecioI(f, tj, wj, h)
%Euler expl�?cito
% In:   f ... lado derecho de la EDO
%       wj ... (vector columna) con CI de dimens
%       tj ... tiempo inicial
%       h ...  tama�o del paso
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)

    wNuevo = wj + (h/2)*(f(tj, wj)+f(tj, wj));

end