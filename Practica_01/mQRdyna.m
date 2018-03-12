function [lambdas] = mQRdyna(A, k, tol)
M=length(A);
B=A;
i=M;
j=0;
%La vuelve en forma hessenberg
[Q,A]=hess(A);

%Aplicamos QR simple una vez
[Q,R]=qr(A);
A=R*Q;

while (i>1)
    while (abs(A(i,i-1))>tol)
        %shift din?mico de Wilkinson
        an = A(i,i);
        an1 = A(i-1,i-1);
        bn1 = A(i,i-1);
        delta = .5*(an1 - an);
        mu = an - sign(delta)*bn1^2/(abs(delta)+sqrt(delta^2 + bn1^2));
        %QR con shift din?mico
        [Qi,R]=qr(A-mu*eye(i));
        A=(R*Qi)+(mu*eye(i));
    end
    %vector de eigenvalores
    lambdas(M-i+1)=A(i,i);
    i=i-1;
    if(norm(diag(Qi'*A*Qi,-1))<tol || j>=k)
        break
    end
    %deflaci?n
    A=A(1:i,1:i);
    j=j+1;
end
j
lambdas(1,M)=A(1,1);

%%Reordenaci?n
[v, P] = sort(abs(lambdas), 'descend');
lambdas = sort(lambdas,'descend')';
Q=Q(:,P);
