A = [1 0 0; 0 0 -1; 1 0 0];
q = [1;1;1];
TOL = 10^-2;
[sigma, w] = mPow( q, A, TOL );