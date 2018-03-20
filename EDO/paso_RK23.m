function [ tN,wN,hN ] = paso_RK23( f, tj, wj, hj, tol)
    %in:    tj ...   tiempo viejo
    %       wj ...   aprox. vieja
    %       hj ...   paso sugerido
    %       tol ...  tolerancia para error relativo
    %       f ...    lado derecho de la EDO (como funcion)   
    %
    %Out:   tN ...   tiempo despues de este paso
    %       wN ...   aprox. al tiempo tN
    %       hN ...   paso sugerido para el siguiente paso
    
    %cota = tol + 1;
    h = hj;
    theta = 1;
    %Mientras cota>tol
    while(true)
        s1 = f(tj, wj);
        s2 = f(tj+h, wj+h*s1);
        s3 = f(tj+h*0.5, wj+0.25*h*(s1+s2));
        cota = h*abs((s1-2*s3+s2))/3;
        
        if(cota >= tol*max(abs(wj), theta))
            h = 0.5*h;
        else
            wN =  wj + h*(s1+s2)/2;
            tN = tj + h;
            hN = 2*h;
            break;
        end
    end
    
end

