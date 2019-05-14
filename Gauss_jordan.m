function [x] = Gauss_jordan(funcs,size)
fileID = fopen("Gauss_jordan_Solution.txt", "w");
x= zeros(1);
flag = 0;
[a,b] = equationsToMatrix(funcs);
tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size
    if a(i,i) == 0
        flag =1;
        break;
    end
end
for i=1:size
    if flag ==1
        max = abs(a(1,i));
        maxInd =1;
            for t=2:size
                if abs(a(t,i))>=max
                    max = abs(a(t,i));
                    maxInd = t;
                end
            end
            bn = b(i,1);
            b(i,1)=b(maxInd,1);
            b(maxInd,1)=bn;
            for k=1:size
                an=a(i,k);
                a(i,k)=a(maxInd,k);
                a(maxInd,k)=an;
            end
    end
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