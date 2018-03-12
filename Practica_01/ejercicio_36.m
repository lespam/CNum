clear all;

close all;

clc;

%ejercicio_36
[lambdas_simp, Q_simp] = mQRsimple( gallery( 'fiedler', 25 ), 2000, 1E-10);

[lambdas_dyna, Q_dyna] = mQRdyna( gallery( 'fiedler', 25 ), 20, 1E-10);


eig_reales = sort(eigs(gallery( 'fiedler', 3 )),'descend');
%Esta linea solo la agregamos para llenar de ceros y poder comparar
eig_reales(numel(lambdas_simp))=0;

lambdas = [lambdas_simp,lambdas_dyna,eig_reales];
T = array2table(lambdas,...
    'VariableNames',{'Simple','Dynamic','Real'})