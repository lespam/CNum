function [ lambdas ] = MQR_simple( A, k, tol )

    Am = A;
    for j = 1:k
        [Q,R] = qr(Am);
        Am = R*Q;
        if norm(diag(Am, -1)) <tol
            break
        end
    end
    
    lambdas=diag(Am);

end