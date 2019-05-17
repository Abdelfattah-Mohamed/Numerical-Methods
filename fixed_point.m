function [f1,x1,x2,err,flag] = fixed_point(s,x0,itr,epsilon)
    fileID = fopen("Fixed_Point_Solution.txt", "w");
    fprintf(fileID,'%6s %12s %12s %12s \r\n','itr', 'Xi', 'Xi+1', 'eps');
    f = str2sym(s);
    x = str2sym('x');
    c = coeffs(f);
    f1 = (-f+c(2)*x) / c(2);
    flag = 0;
    if abs(subs(diff(f1),x0)) > 1
        x1 = zeros(1);
        x2 = zeros(1);
        err = zeros(1);
        fprintf(fileID,'Diverge \r\n');
    else
        try
            x1 = zeros(1);
            x2 = zeros(1);
            er = zeros(1);
            err = zeros(1);
            x1(1) = x0;
            tic;
            for i=1:itr
                xnew = (subs(f1,x0));
                x2(i) = xnew;
                err(i)=abs(xnew - x0);
                if i~=1
                    er(i)=((err(i)-err(i-1))/err(i)) * 100;
                end
                %finding the error at each iteration
                fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, x1(i), x2(i), err(i));
                if err(i)<=epsilon %checking the amount of error at each iteration
                    break %if enough accuracy has been achieved the stop the iterations
                end
                x0 = xnew;
                x1(i+1) = xnew;
            end
            %disp(x2(size(x2)));
            %fprintf('The Root is : %f \n',xnew);
            fprintf(fileID,"time = %.6f ms\n", toc);
            fprintf(fileID,"Theoritical Error = %.6f \n", subs(diff(f1),xnew));
        catch
            x1 = zeros(1);
            x2 = zeros(1);
            err = zeros(1);
            fprintf(fileID,'Diverge \r\n');
            flag = 1;
        end
    end
    fclose(fileID);
end
