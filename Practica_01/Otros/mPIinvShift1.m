% Author: LesPam
function [lamn, w, k] = mPIinvShift1(A, q0, rho, tol)
% Inverse Power Method with Shift
error = 1;
    %k = 0;
    k = 0;
    A = A-(rho*eye(size(A)));
    
    while error>tol
        w = q0/norm(q0);
        q0 = A\w;
        lamn = dot(w,q0);
        error = norm(A\w - lamn*w)/norm(A\w);
        k = k+1;
    end
    lamn=1/lamn+rho;
    w = q0/norm(q0);
end