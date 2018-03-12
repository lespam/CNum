clear all;

close all;

clc;

%ejercicio_35

A = [1 -4 -6; -12 -8 -6; 11 10 10];
q = [1 1 1]';

[lam, w] = mPIinvShift(A, q, 0, 100, 10^-5);
[V,D] = eig(A);

lambdas = [lam, D(1,1)];
vectores = [w, V(:,1)];

lamb_dom = array2table(lambdas,...
    'VariableNames',{'mPInvShit','Real'})
vec_dom = array2table(vectores,...
    'VariableNames',{'mPInvShit','Real'})
