
function [ error, sigma, w ] = mPow( q, A, TOL )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %Tolerancia
    sigma = 25;
    error = 1;
    
    while error>TOL
        w = q/norm(q);
        q = A*w;
        sigma = dot(w,q);
        error = norm(A*w - sigma*w)/norm(A*w)
    end
    w = q/norm(q);
end
