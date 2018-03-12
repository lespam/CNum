clear all;

close all;

clc;

%ejercicio_33

A = [1,1,2;-1,9,3;0,-1,3];

q0 = [1;1;1];

tol = 10^(-15);

rho1 = 3.6;

k = 100;

%El m?todo imprime el n?mero de iteraciones.

n = mPIinvShift(A,q0,rho1, k, tol)



%El m?todo requiere de 13 iteraciones