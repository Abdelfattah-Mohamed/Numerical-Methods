function [X,err,j] = Gauss_Seidel(funcs,X0,itr,error)

disp ( 'Enter the system of linear equations in the form of AX=B')

[A,B] = equationsToMatrix(funcs);
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR: Matrix A must be a square matrix')
    return
end
% check if B is a column matrix
 
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR: Matrix B must be a column matrix')
   return
end
% allowable error in final answer
k= 1; 
X( : , 1 ) = X0;
err = zeros(na,1);
for j=1:itr
    for i=1:na
      if(i==1)   
         X ( 1 ,k+ 1 ) = (B(1)-(A(1,2:na)*X(2:na,k)))/A(1,1);
      elseif (i == na)
         X ( na ,k+ 1 ) = (B(na)-(A(i,1:na-1)*X(1:na-1,k+1)))/A(na,na);
      else
         X ( i ,k+ 1 ) = (B( i)-A(i,1:i-1)*X(1:i-1,k+1)-A(i,i+1:na)*X(i+1:na,k))/A(i,i);
      end
    end
    err( : , k ) = abs(X( :,k+1) - X( :, k));% finding error
    if err(:,k) <= error(:,1)
            break;
    end
    k = k + 1;
    
end
end
