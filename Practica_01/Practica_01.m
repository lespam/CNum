% Cálculo Numérico
% ITAM PRIMAVERA 2018
% PRÁCTICA 1

% Author: Leslie Brenes
% Author: César Becerra
% Author: Gerardo Pastrana
% Author: Max Medina

clear all
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

%Método de la potencia Inversa con Shift
k=10^6;
rho = 0;
[lam2, w2] = mPIinvShift(A, q0, rho, k, tol)
r=D(2,2)/D(3,3)

rho = 3.3;
[lam3, w3] = mPIinvShift(A, q0, rho, k, tol)
r=(D(3,3)-rho)/(D(1,1)-rho)
