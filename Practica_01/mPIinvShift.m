function [lamn, w] = mPIinvShift(A, q0, rho, k, tol)
  A = A - eye(size(A))*rho;
  for i=1:k
    w = q0/norm(q0);
    q0 = A\w;
    lamn = dot(w,q0);
    if norm( q0 - lamn*w) <= tol*norm(q0)
      break;
    end
  end
  w = q0/norm(q0);
  lamn = 1/lamn + rho;
  i