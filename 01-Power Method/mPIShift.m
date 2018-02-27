% Author: LesPam
function [lamn, w] = mPIinvShift(A, q0, rho, k, tol)
% Power Method 
% This algorithm implements the Power Method with shift to a Matrix
% In  : q       initial vector
%       A       square Matrix
%       TOL     tolerance error number

% Out : sigma   dominant eigenvalue
%       w       dominant eigenvector

    %Tolerancia
    error = 1;
    it = 0;
    A = A-(rho*eye(size(A)));
    
    while error>tol && k>=it
        w = q0/norm(q0);
        q0 = A\w;
        lamn = dot(w,q0);
        error = norm(A\w - lamn*w)/norm(A\w);
        it = it+1;
    end
    w = q0/norm(q0);
end
