function [lamj, w] = mPIinvRayleigh(A, q0, k)
  z = q0'*A*q0/(q0'*q0);
  A = A-eye(size(A))*z;
  
  if issymmetric(A)
    tol = 10^(-5);
  else
    tol = 10^(-7);
  end
  for i=1:k
    w = q0/norm(q0);
    q0 = A\w;
    lamj = dot(w,q0);
    if norm(q0 - lamj*w) <= tol*norm(q0)
      break;
    end
    A = A-eye(size(A))*lamj;
    z=z+lamj;
  end
  w = q0/norm(q0);
  lamj = 1/lamj + z;
  