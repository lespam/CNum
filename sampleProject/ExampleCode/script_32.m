clear all;   close all;   clc;


f = @(x)  exp(x)-1.0;
I = [0.0, 3.0];


fprintf('1) composite formula using midpoint rule -> see documentation\n\n');

fprintf('2)\n')
exact_value = exp(3.0) -exp(0.0) -3.0;
fprintf('\ta) exact value : %14.10g\n\n', exact_value)


fprintf('\tb) the table\n\n')
relative_error = @(approximation)  abs(approximation - exact_value)/abs(exact_value);
Ns = [1,2,4,8,16];

fprintf('%3s  %20s  %14s\n', 'n',  'approximation', 'relative error')
for i = 1:numel(Ns)
	approx_value = ruleGenericComposite( @ruleMidPoint, f, I, Ns(i) );
	fprintf('%3g  %20e  %14.10f\n', Ns(i), approx_value, relative_error(approx_value) )
end
