function [x] = LU_Decomposition(funcs,size)

x= zeros;
y=zeros;
eqns = zeros;
l(3,3) = zeros;
for i=1:size
    eqns(i) = str2sym(funcs(i));
end

[u,b] = equationsToMatrix(eqn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size
    for j=i+1:size
        R = (u(j,i)/u(i,i));
        l(j,i) = R;
        for k=1:size
            u(j,k)=u(j,k)-R*u(i,k);
        end
        l(i,i) = 1;
        
        
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size
   n=b(i);
    for j=1:i-1
        n=n-l(i,j)*y(j);
    end
    y(i)=n;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=size:1
    n=y(i);
    for j = i+1:size
        n = n - u(i,j)*x(j);
    end
    x(i) = n / u(i,i);
    
end
