clear all;
close all;
clc;
%ejercicio_34
A = [1,1,2;-1,9,3;0,-1,3];
q1_0 = [11,92,79]';
q2_0 = [-61,-21,99]';
q3_0 = [31,32,-68]';
k = 10;


[lam1, w1] = mPIinvRayleigh(A,q1_0,k)
[lam2, w2] = mPIinvRayleigh(A,q2_0,k)
[lam3, w3] = mPIinvRayleigh(A,q3_0,k)
[V,U] = eig(A)
v1 = -V(:,2);
v2 = V(:,1);
v3 = V(:,3);
for i = 1:k
  [l, z] = mPIinvRayleigh(A,q2_0,i);

  error(i) = abs(l-U(2,2));
 
end
error

