clear all;
close all;
clc;
%ejercicio_32

A = [1,1,2;-1,9,3;0,-1,3];
q0 = [1;1;1];
tol = 10^(-10);
rho1 = 0;
rho2 = 3.3;
%Primero hagamos todo con rho1
[lam2, w] = mPIinvShift(A, q0, rho1, 10, tol)
[V,D] = eig(A)

%Se ve que son muy similares
diferenciaLam2 = abs(lam2 - min(diag(D)))

v2 = -V(:,2);

for i=1:10
  [l,q(:,i)] = mPIinvShift(A,q0, rho1, i,tol);
end
for i=1:9
  erc(i) = norm(q(:,i+1)-v2,inf)/norm(q(:,i)-v2,inf);
end

%Los radios de convergencia experimentales son: 
erc
%El radio de convergencia teórica es: 
ratio = abs(D(2,2)/D(3,3))


%Ahora repitamos con rho2
[lam3, w] = mPIinvShift(A, q0, rho2, 10, tol)
[V,D] = eig(A)

%Se ve que son muy similares
diferenciaLam3 = abs(lam3 - D(3,3))

v3 = V(:,3); 
for i=1:10
  [l,q(:,i)] = mPIinvShift(A,q0, rho2, i,tol);
end
for i=1:9
  erc(i) = norm(q(:,i+1)-v3,inf)/norm(q(:,i)-v3,inf);
end

%Los radios de convergencia experimentales son:
erc

%El radio de convergencia teórica es: 
ratio = abs((D(3,3)-rho2)/(D(2,2)-rho2))