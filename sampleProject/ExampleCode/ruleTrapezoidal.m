%% Author: Andreas Wachtel
%% Created: 2018-01-12

function [int_ab] = ruleTrapezoidal(f, I)
% Purpose: implements the trapezoidal rule for quadrature
%
% In :  f  ... function hande for f(x)
%       I  ... (vector) interval [a,b] = [ I(1), I(2) ]
%
% Out:  int_ab ... approximates value of  int_[a,b] f(x) dx
%

	int_ab = 0.5*(I(2) - I(1))*sum(f(I));
end
