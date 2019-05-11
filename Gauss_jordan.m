function [x] = Gauss_jordan(funcs,size)

x= zeros;
eqns = zeros;
for i=1:size
    eqns(i) = str2sym(funcs(i));
end

[a,b] = equationsToMatrix(eqn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size
    for j=1:size
        if j ~= i %pivot eq
        R = -(a(j,i)/a(i,i));
        for k=1:size
            a(j,k)=a(j,k)+R*a(i,k);
        end
        b(j,1)=b(j,1)+R*b(i,1);
        
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size
    x(i) = a(i,i);
    
end
