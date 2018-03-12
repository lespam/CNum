function [U, S, V] = mSvdEco(A)

k=1000

tol=1e-10
tol2=10e-10

[m,n]=size(A)
i=1;
if(n<=m)
    
    [vaps,Vi]=mQRsimple((A'*A),k, tol);
    for r=1:n
        vaps(r)=sqrt(vaps(r));
        if abs(vaps(r))<=tol2
            vaps
            r=r-1
            break
        end
    end
    
    while( i<=r)
        U(:,i)=(1/vaps(i))*A*Vi(:,i);
        i=i+1;
    end
    
    V=Vi(:,1:r);
else
    [vaps,Ui]=mQRdyna((A*A'), k, tol);
    
    for r=1:m
        vaps(r)=sqrt(vaps(r));
        if abs(vaps(r))<=tol2
            r=r-1;
            break
        end
    end

    
    while(i<=r)
        
        V(:,i)=(1/vaps(i))*(A')*Ui(:,i);
        i=i+1
    end

    U=Ui(:,1:r);

end

S=diag(vaps(1:r));

