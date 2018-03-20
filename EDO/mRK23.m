function [ T, W ] = mRK23( f, y0, I, tol )
    % In:   f   ... lado derecho de la EDO
    %       y0  ... condicion inicial
    %       I   ... intervalo (vector)[t0, tm]
    %       tol ... tolerancia
    %
    % Out:  T   ... malla (vector con muchas entradas)
    %       W   ... aprox en una matriz n*(?)

    T = [I(1), I(1)];
    W = zeros(length(y0),2);
    W(:,1)= y0;
    hj = min(1,I(2)-I(1));
    % mientras T(end) < I(2)
    j = 2;
    while(T(end) < I(2))
        [ T(j+1),W(:,j+1),hj ] = paso_RK23( f, T(j), W(:,j), hj, tol);
        j = j + 1;
        %Para no ir más allá del intervalo
        if(T(j)+hj > I(2))
            hj = I(2)-T(j);
        end
    end
    
end

