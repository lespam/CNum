clear all;

close all;

clc;

%ejercicio_36
[lambdas_simp, Q_simp] = mQRsimple( gallery( 'fiedler', 25 ), 2000, 1E-10);

[lambdas_dyna] = mQRdyna( gallery( 'fiedler', 25 ), 20, 1E-10);

eig_reales = sort(eig(gallery( 'fiedler', 25 )),'descend');


lambdas = [lambdas_simp,lambdas_dyna,eig_reales];
T = array2table(lambdas,...
    'VariableNames',{'Simple','Dynamic','Real'})