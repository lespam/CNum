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

v2 = -V(:,2);

v1 = V(:,1);

v3 = -V(:,3);
valores_num = [lam1 lam2 lam3;U(1,1) U(2,2) U(3,3)]

lambdas = array2table(valores_num,...
    'VariableNames',{'lam1','lam2','lam3'},...
    'RowNames',{'num?rico','real'})

vectores_numerico = [w1,w2,w3];
vectores_reales = [v1,v2,v3];

vectores_num = array2table(vectores_numerico,...
    'VariableNames',{'vec_Num1','vec_Num2','vec_Num3'})
vectores_real = array2table(vectores_reales,...
    'VariableNames',{'vec_Real1','vec_Real2','vec_Real3'})


for i = 1:k

  [l, z] = mPIinvRayleigh(A,q2_0,i);

  error(i) = abs(l-U(2,2));
end

error



