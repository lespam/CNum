clear
q = [1;1;1]
A = [1 1 1; 1 2 3; 1 3 6]
TOL = 10^-1;
[error, sigma, w] = mPow( q, A, 1/10 )
