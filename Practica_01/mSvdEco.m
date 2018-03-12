function [U, S, V] = mSvdEco(A)

k=20

tol=1e-5



[m,n]=size(A)
i=1;
if(n<=m)

[vaps,Vi]=mQRdyna((A'*A),k, tol)
for r=1:n
   vaps(i)=sqrt(vaps(i))
  if vaps(i)<=10e-7
    r=r-1;
    break 
    end
    end
  

  



vaps(1)=sqrt(vaps(1));
while( i<=r) 

            
            
            U(:,i)=(1/vaps(i))*A*Vi(:,i) 
            
            i=i+1;
           
           
            

end

V=Vi(:,1:r)

else

[vaps,Ui]=mQRdyna((A*A'), k, tol)
vaps
for r=1:m
   vaps(i)=sqrt(vaps(i))
  if vaps(i)<=10e-7
    r=r-1;
    break 
    end
    end
  



    
vaps(1)=sqrt(vaps(1));
while(i<=r)
    
    V(:,i)=(1/vaps(i))*(A')*Ui(:,i)
    i=i+1
    

end



U=Ui(:,1:r)


end

S=diag(vaps(1:r))

