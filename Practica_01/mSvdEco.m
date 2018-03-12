function [U, S, V] = mSvdEco(A)
K=
Tol=
i=1
[n,m]=length(A);
V=zeros(n,r)
S=zeros(r,r)
U=zeros(m,r)
 
if(n<=m)
[vaps,V]=QRdyna(A*(A'), k, tol)

while(vaps(i)>=10e-7)
            U(:,i)=(1/vaps(i))*A*V(:,i)
            i=i+1
end
else
[vaps,U]=QRdyna((A')*A, k, tol)
    
while(vaps(i)>=10e-7)
    V(:,i)=(1/vaps(i))*(A')*U(:,i)
end
end

i=i-1
S=diag(vaps(1:i)
