function [lambdas, Q] = mQRsimple(A, k, tol)
  Q = eye(size(A));
  i=1;
  B=A;
while i<=k && norm(diag(A, -1))>=tol
  [Qi,R] = qr(A);
  A = R*Qi;
  Q = Q*Qi;
  i = i+1;
 
end
lambdas = diag(A);
lambdas = sort(lambdas(:),'descend');
Q'*B*Q;
i