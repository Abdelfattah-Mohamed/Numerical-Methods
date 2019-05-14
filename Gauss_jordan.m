function [x] = Gauss_jordan(funcs,size)
fileID = fopen("Gauss_jordan_Solution.txt", "w");
x= zeros(1);
%eqns = zeros;
%for i=1:size
 %   eqns(i) = str2sym(funcs(i));
%end

[a,b] = equationsToMatrix(funcs);
tic;
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
    b(i,1) = b(i,1)/a(i,i);
    a(i,i) = 1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size
    x(i) = b(i,1);
end
for i=1:size
    fprintf(fileID,"X%d = %.6f \n", i, x(i));
end
fprintf(fileID,"time = %.6f ms\n", toc);
fclose(fileID);
end