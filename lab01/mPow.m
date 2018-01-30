function [ sigma, w ] = mPow( q, A, TOL )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %Tolerancia
    sigma = 25;
    w = 0;
    tolerancia=1;
    error = -1;
    while tolerancia<=error
        w = q/norm(q);
        q = A*w;
        sigma = cross(w,A*w);
        tolerancia = norm(A*w - sigma*w);
        error = TOL*norm(A*w);
    end
    w = q/norm(q);
end

