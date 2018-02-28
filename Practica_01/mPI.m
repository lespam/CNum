% Author: LesPam
function [lam1, w] = mPI( A, q0, k, tol )
% Power Method 
% This algorithm implements the Power Method to a Matrix
% In:   q0      initial vector
%       A       square Matrix
%       tol     tolerance error number
%       k       iteration number

% Out:  lam1   dominant eigenvalue
%       w       dominant eigenvector

    error = 1;
    it = 0;
    while error>tol && k>=it
        w = q0/norm(q0);
        q0 = A*w;
        lam1 = dot(w,q0);
        error = norm(A*w - lam1*w)/norm(A*w);
        it = it+1;
    end
    w = q0/norm(q0);
    
end
