n=5;m=10;
A=diag(randn(n,1));T=randn(n); A=T^(-1)*A*T;
[U H]=hess(A);
Hr=H; H0=H
Ur=U;
Q=U;
for k=1:m
    %Iteracion del algoritmo QR
    %Desplazamiento
    s=H(n,n)
    %Factorizacion QR de sI-H
    [Q R]=qr(H-s*eye(n));
    H=R*Q+s*eye(n)
    U=U*Q;
    pause
    
    %Iteracion del algoritmo de Rayleigh por filas
    x=flipud(eye(n,1));
    sr=x'*Hr*x
    y=x'/(Hr-s*eye(n));
    x=y'/norm(y');
    la=x'*Hr*x;
    res=x'*Hr-la*x'
    norres=norm(res)
    [V ~]=qr(x);
    V=fliplr(V);
    Vp=V'
    xp=x'
    Hr=V'*Hr*V
    Ur=Ur*V;
    pause
    norm(U'*A*U-H)
    norm(Ur'*A*Ur-Hr)
    pause
end
