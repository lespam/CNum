% Author: LesPam
% Created: 2018-01-31

%Lab 01: The Power Method
clear
clc

q = [1;1;1]
A = [1 1 1; 1 2 3; 1 3 6]
%q = [1;1;1]
%A = [1 0 0; 0 0 -1; 1 0 0]

TOL = 10^-7;
[sigma, w] = mPow( q, A, 1/10 )

% Verifying the experimental rate of convergence
q = [1;1;1];
A = [1 1 1; 1 2 3; 1 3 6];

TOL = 10^-15;

sigma = 25;

error = 1;

w = q; 
w1 = q; 
while error>TOL
    w0 = w1;        %save the 3d oldest one
    w1 = w;         %save the 2nd oldest one
    w = q/norm(q);  %modifies the last one
    
    q = A*w;
    
    sigma = dot(w,q);
    
    error = norm(A*w - sigma*w)/norm(A*w);
end
w = q/norm(q);
w1;
w0;

erc = norm(w1 - w)/norm(w0 - w)

e = eig(A);
se = sort(e,'descend');

r = se(2)/se(1)
