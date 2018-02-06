
% Author: LesPam
function [sigma, w , it] = invmPow( q, A, TOL )
% Inverse Power Method 
% This algorithm implements the Power Method to a Matrix
% In  : q       initial vector
%       A       square Matrix
%       TOL     tolerance error number

% Out : sigma   dominant eigenvalue
%       w       dominant eigenvector

    %Tolerancia
    sigma = 25;
    error = 1;
    it = 0;
    %Inver the matrix
    
    while error>TOL
        w = q/norm(q);
        q = A\w;
        sigma = dot(w,q);
        error = norm(A\ w - sigma*w)/norm(A\w);
        it = it+1;
    end
    w = q/norm(q);
    it = it+1;
end
