function [ sigma, w ] = mPow( q, A, k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for i = 1:k
        w = q/norm(q);
        q = A*w;
        sigma = cross(w,A*w);
    end
    w = q/norm(q);
    sigma
    w
end

