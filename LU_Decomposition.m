function [x] = LU_Decomposition(funcs,size)
fileID = fopen("LU_Decomposition_Solution.txt", "w");
x= zeros(1);
y=zeros(1);
flag = 0;
l = zeros(3,3);
[u,b] = equationsToMatrix(funcs);
tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size
    if u(i,i) == 0
        flag =1;
        break;
    end
end
for i=1:size
    if flag ==1
        max = abs(u(1,i));
        maxInd =1;
            for t=2:size
                if abs(u(t,i))>=max
                    max = abs(u(t,i));
                    maxInd = t;
                end
            end
            bn = b(i,1);
            b(i,1)=b(maxInd,1);
            b(maxInd,1)=bn;
            for k=1:size
                an=u(i,k);
                u(i,k)=u(maxInd,k);
                u(maxInd,k)=an;
            end
    end
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

for i=size:-1:1
    n=y(i);
    for j = i+1:size
        n = n - u(i,j)*x(j);
    end
    x(i) = n / u(i,i);
end
for i=1:size
    fprintf(fileID,"X%d = %.6f \n", i, x(i));
end
fprintf(fileID,"time = %.6f ms\n", toc);
fclose(fileID);
end
