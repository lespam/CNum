%% Author: Andreas Wachtel
%% Created: 2018-01-12

function [int_I] = ruleGenericComposite( rule, f, I, n )
% Purpose: implements the general (equidistant) composite rule for quadrature
%
% In :  rule ... function hande for a quadrature rule
%       f    ... function hande for f(x)
%       I    ... (vector) interval [a,b] = [ I(1), I(2) ]
%		n    ... number of equidistant subintervals
%
% Out:  int_I ... approximates value of  int_[a,b] f(x) dx
%


	x = linspace(I(1), I(2), n+1);

	int_I = 0.0;
	for i=1:n
		int_I = int_I + rule(f, x(i:i+1));
	end
end
