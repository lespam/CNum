% C?lculo Num?rico
% ITAM PRIMAVERA 2018
% PR?CTICA 1

% Author: Leslie Brenes
% Author: C?sar Becerra
% Author: Gerardo Pastrana
% Author: Max Medina

clear alls
close all
clc

format long

A   = [1, 1, 2; -1, 9, 3; 0, -1, 3];
q0  = [1,1,1]';
k   = 10;
tol = 10^-10;

[lam1, w1] = mPI( A, q0, k, tol )
[V,D] = eig(A);

[lam, q(:,1)] = mPI( A, q0, 1, tol );

for i=2:10
    [lam,q(:,i)] = mPI( A, q0, i, tol );
    r(i,1)=norm(q(:,i)-V(:,1),inf) / norm(q(:,i-1)-V(:,1),inf);
end

%Comparar
r_exp=r(10,1)
r=D(3,3)/D(1,1)

%Metodo de la potencia Inversa con Shift
k=10^6;
rho = 0;
[lam2, w2] = mPIinvShift(A, q0, rho, k, tol)
r=D(2,2)/D(3,3)

rho = 3.3;
[lam3, w3] = mPIinvShift(A, q0, rho, k, tol)
r=(D(3,3)-rho)/abs((D(2,2)-rho))

rho = 3.6;
tol = 10^-15
[lam4, w4, k] = mPIinvShift1(A, q0, rho, tol)


%M?todo de la potencia Inversa con Cociente de Rayleigh

A   = [1, 1, 2; -1, 9, 3; 0, -1, 3];
k   = 3;
tol = 10^-10;

qR1  = V(:,1)+.01;
qR2  = V(:,2)-.01;
qR3  = V(:,3)-.01;

[lamR1, wR1] = mPIinvRayleigh(A, qR1, k)
[lamR2, wR2] = mPIinvRayleigh(A, qR2, k)
[lamR3, wR3] = mPIinvRayleigh(A, qR3, k)

%tomemos qR3 para verificar la convergencia
%qR3 converge a D(3,3)
k   = 1;
qR3  = V(:,3)-.01;
[lamR3conv1, wR3conv1] = mPIinvRayleigh(A, qR3, k)

k=k+1;
[lamR3conv2, wR3conv2] = mPIinvRayleigh(A, qR3, k)

norm(wR3conv2-V(:,3))/(norm(wR3conv1-V(:,3))^2)

%2.6
A = [1,-4, -6;-12, -8, -6; 11, 10 10];
[lambdas, Q] = mQRsimple(A, k, tol)