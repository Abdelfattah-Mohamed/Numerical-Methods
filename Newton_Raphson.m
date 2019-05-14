function [x,err] = Newton_Raphson(s,x0,itr,error)
    fileID = fopen("Newton_Raphson_Solution.txt", "w");
    fprintf(fileID,'%6s %12s %12s %12s \r\n','itr', 'Xi', 'Xi+1', 'eps');
    f = str2sym(s);
    x = zeros(1);
    err = zeros(1);
    x(1)=x0;
    d=diff(f);
    tic;
    for i=1:itr
        x(i+1)=x(i)-((subs(f,x(i))/(subs(d,x(i)))));
        err(i)=abs((x(i+1)-x(i))/x(i+1));
        fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, x(i), x(i+1), err(i));
        if err(i)<error
            break
        end
    end
    %root=x(i);
    %fprintf('The Root is : %f \n',root);
    fprintf(fileID,"time = %.6f ms\n", toc);
    fclose(fileID);
end