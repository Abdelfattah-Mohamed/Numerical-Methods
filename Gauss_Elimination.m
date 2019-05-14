function [x] = Gauss_Elimination(funcs,size)

x= zeros(1);
%eqns = zeros;
%for i=1:size
   % eqns(i) = str2sym(funcs(i));
%end

[a,b] = equationsToMatrix(funcs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size
    for j=i+1:size
        R = -(a(j,i)/a(i,i));
        for k=1:size
            a(j,k)=a(j,k)+R*a(i,k);
        end
        b(j,1)=b(j,1)+R*b(i,1);
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=size:-1:1
    n=b(i,1);
    for j = i+1:size
        n = n - a(i,j)*x(j);
    end
    x(i) = n / a(i,i);
end
end