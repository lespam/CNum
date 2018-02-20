
% Author: LesPam
function [lam1, w] = mPI( A, q0, k, TOL )
% Power Method 
% This algorithm implements the Power Method to a Matrix
% In  : q       initial vector
%       A       square Matrix
%       TOL     tolerance error number

% Out : sigma   dominant eigenvalue
%       w       dominant eigenvector

    %Tolerancia
    error = 1;
    it = 0;
    while error>TOL && k>=it
        w = q0/norm(q0);
        q0 = A*w;
        lam1 = dot(w,q0);
        error = norm(A*w - lam1*w)/norm(A*w);
        it = it+1;
    end
    w = q0/norm(q0);
end
