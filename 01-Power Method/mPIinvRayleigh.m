% Author: LesPam
function [lamj, w] = mPIinvRayleigh(A, q0, k)
% Power Method 
% This algorithm implements the Power Method with shift to a Matrix
% In  : q       initial vector
%       A       square Matrix
%       TOL     tolerance error number

% Out : sigma   dominant eigenvalue
%       w       dominant eigenvector

    %Tolerancia
    TOL = 10^-7;
    error = 1;
    it = 0;
    rho = (htranspose(q0)*A*q)/(htranspose(q0)*q0);
    
    A = A-(rho*eye(size(A)));
    while error>TOL && k>=it
        w = q0/norm(q0);
        q0 = A\w;
        lamj = dot(w,q0);
        error = norm(A*w - rho*w)/norm(w);
        it = it+1;
    end
    w = q0/norm(q0);
end
