function [wNuevo,kNuevo] = pasoTrapecioE_estados(f, tj, wj, h,kj)
%Trapecio expl??cito
% In:   f ... lado derecho de la EDO
%       wj ... (vector columna) con CI de dimens
%       tj ... tiempo inicial
%       h ...  tama?o del paso
%
% Out:  T ... vectr con m+1 entradas
%       W ... matriz n*(m+1)
    wjn = f(tj, wj);
    wNuevo = wj + (0.5*h)*(wjn+f(tj+h, wj + h*wjn)); 
    kNuevo = kj + 2;
end