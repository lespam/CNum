clear all;
close all;
clc;
%ejercicio_31

A = [1,1,2;-1,9,3;0,-1,3];
q0 = [1;1;1];
tol = 10^(-10);

[lam1, w] = mPI(A, q0, 10, tol)
[V,D] = eig(A)

format long e

%Se ve que son muy similares. Tienen 4 cifras iguales.
diferenciaLam1 = lam1 - max(diag(D))

v = V(:,1);
%Los radios de convergencia experimentales son: 
for i=1:10
  [l,q(:,i)] = mPI(A,q0,i,tol);
end
for i=1:9
  erc(i) = norm(q(:,i+1)-v,inf)/norm(q(:,i)-v,inf);
end

erc
%El radio de convergencia teórica es: 
ratio = abs(D(3,3)/D(1,1))