function [lambdas, Q] = mQRdynaPas(A, k, tol)
M=length(A);
B=A;
i=M;
j=1;
[Q,A]=hess(A);  %La vuelve en forma hessenberg

[X,R]=qr(A);  %Aplicamos QR una vez
A=R*X;
Q=Q*X;
while (i>1)
    T=Q'*B*Q;
    U=eye(M);
    while (abs(A(i,i-1))>tol)
        an = T(i,i);   %shift din?mico de Wilkinson
        an1 = T(i-1,i-1);
        bn1 = T(i,i-1);
        delta = .5*(an1 - an);
        mu = an - sign(delta)*bn1*bn1/(abs(delta)+sqrt(delta^2 + bn1^2));
        [Qi,R]=qr(A-mu*eye(i)); %QR con shift din?mico
        U(1:i,1:i)=U(1:i,1:i)*Qi;
       A=R*Qi+mu*eye(i);
       
    end
    lambdas(M-i+1)=A(i,i); %vector de vaps
    i=i-1;
    A=A(1:i,1:i); %deflaci?n
    Q=Q*U;  %Cambio de base
    j
    j=j+1;
    if(norm(diag(Q'*B*Q,-1))<tol || j>k)
        break
    end
    
end
lambdas(M)=A(1,1);
%%Reordenaci?n

[v, P] = sort(abs(lambdas), 'descend');
lambdas = sort(lambdas,'descend')';
Q=Q(:,[P])
[n,m]=size(Q);
for i=0:(n-1)
  B(:,(i+1))=Q(:,(n-i))
  
  end
  Q=B;
  