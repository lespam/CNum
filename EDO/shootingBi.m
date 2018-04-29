%shooting
function [ T, W, k ] = shootingBi( f, s_pos, s_neg)
    % In:   f   ... lado derecho de la EDO
    %       y0  ... condicion inicial
    %       I   ... intervalo (vector)[t0, tm]
    %       tol ... tolerancia
    %
    % Out:  T   ... malla (vector con muchas entradas)
    %       W   ... aprox en una matriz n*(?)
    
    [T,W,k] = mGenerico_estados(@paso_RK4_estados, f, y0, I, m);
    
end