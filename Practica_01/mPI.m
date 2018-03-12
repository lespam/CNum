function [lam1, w] = mPI(A, q0, k, tol)
  for i=1:k
    w = q0/norm(q0);
    q0 = A*w;
    lam1 = dot(w,q0);
    if norm( q0 - lam1*w) <= tol*norm(q0)
      break;
    end
  end
  w = q0/norm(q0);
end
  