%ITERACION SIMULTANEA

A = [-3,2,0;0,1,4;0,1,1];

[V,D] = eig(A);

q=eye(3);

q0 = [1, -1, 0]'
q1 = [1, 1, 1]'

for i=1:5
    [Q,R] = qr(A*Q,0)
end
lam = diag(Q'*A*Q)

%otra forma
A = [-3,2,0;0,1,4;0,1,1];
q0 = [1, -1, 0]'
q1 = [1, 1, 1]'

for i=1:5
    B = A*[q0, q1];
    [Q,R] = qr(B,0)
    q0 = Q(:,1);
    q1 = Q(:,2);
   
    cross(q0,q1)
end

1/sqrt(5) * [0;1;-2]
