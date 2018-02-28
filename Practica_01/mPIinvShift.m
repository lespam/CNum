% Author: LesPam
function [lamn, w] = mPIinvShift(A, q0, rho, k, tol)
% Inverse Power Method with Shift
% This algorithm implements the Inverse Power Method with shift to matrix A
% In:   q0      initial vector
%       A       square Matrix
%       tol     tolerance error number
%       rho     shift
%       k       iteration number

% Out:  lamn    nearest eigenvalue to shift
%       w       associated eigenvector

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
    lamn=1/lamn+rho;
    w = q0/norm(q0);
end
