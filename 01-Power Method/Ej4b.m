%Ejercicio 4a

%A = [0 1 2;1 0 1;2 1 0];
%q = [1;1;-1];

q = [1;1;1];
A = [1 1 1; 1 2 3; 1 3 6];

TOL = 0.1^10;
    
    
for i=1:10
    sigma = 25;
    error = 1;
    it = 0;
    
    w = q; 
    w1 = q;
    
    for k=1:i
        w0 = w1;        %save the 3d oldest one
        w1 = w;         %save the 2nd oldest one
        w = q/norm(q);  %modifies the last one
    
        q = A*w;
    
        sigma = dot(w,q);
        it = it+1;
    end
    w = q/norm(q);
    it = it+1;
    
    %comparar con el w "real"
    %podemos iterar sobre el mismo método, y guardar el valor (recursivo)
    erc(i) = norm(w1 - w)/norm(w0 - w);
end
erc

%Calculando el error teórico
e = eig(A);
se = sort(e,'descend');

r = abs(se(2)/se(1))


%A = [0 1 2;1 0 1;2 1 0];
%q = [1;1;-1];

q = [1;1;1];
A = [1 1 1; 1 2 3; 1 3 6];

TOL = 0.1^10;

[sigma, w ,it] = mPow( q, A, TOL)
eig(A)
