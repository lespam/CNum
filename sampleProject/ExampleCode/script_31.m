clear all;   close all;   clc;

% define function and interval
f = @(x)  0.5*x-3.0;
I = [0.0, 8.0];

fprintf('1) Aproximation\n');
fprintf('\ta) using the midpoint rule             :  %g \n', ruleMidPoint(f, I) );
fprintf('\tb) using the trapezoidal rule          :  %g \n', ruleTrapezoidal(f, I) );
fprintf('\tc) using the composite trapezoidal rule:  %g \n', ruleGenericComposite( @ruleTrapezoidal, f, I, 10 ))

fprintf('\n2) Exact?\n');
fprintf('\t YES, all formulas are exact up to rounding errors, since f is  affine linear\n\n')

