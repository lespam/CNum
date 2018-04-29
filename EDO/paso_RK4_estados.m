function [wNuevo,kNuevo] = paso_RK4_estados(f, tj, wj, h, kj)
%Runge-Kutta 4
% In:   f ... lado derecho de la EDO
%       wj ... (vector columna) con CI de dimens
%       tj ... tiempo inicial
%       h ...  tama?o del paso
%
% Out:  wNuevo ... la nueva aproximacion

    s1 = f(tj, wj);
    s2 = f(tj+0.5*h, wj+0.5*h*s1);
    s3 = f(tj+0.5*h, wj+0.5*h*s2);
    s4 = f(tj+h, wj+h*s3);
    
    wNuevo = wj + (h/6)*(s1+2*s2+2*s3+s4); 
    kNuevo = kj+4;
end