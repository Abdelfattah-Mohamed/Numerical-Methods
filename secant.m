function [root,x,iterations,ea] = secant(str,x0,xi,es,maxI)
fileID = fopen("Secant_Solution.txt", "w");
fprintf(fileID,'%6s %12s %12s %12s \r\n','itr', 'Xi', 'Xi+1', 'eps');
func = str2sym(str);
ea = zeros(1);
x = zeros(1);
x(1) = x0;
x(2) = xi;
maxI= maxI + 2;
iterations = 0 ;
tic;
for i=3:maxI
    x(i) = x(i-1)- (subs(func,x(i-1))*(x(i-2)-x(i-1)))/(subs(func,x(i-2))-subs(func,x(i-1)));
    iterations=iterations+1;
    root = x(i);
    ea(i-2) = abs((x(i)-x(i-1))/x(i));
    fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, x(i-1), x(i), err(i-2));
    if  (ea(i-2) <= es) %*100 walla mn8er ? 7asab hwa hyb3thaly ezay
        break;
    end
end
fprintf(fileID,"time = %.6f ms\n", toc);
fclose(fileID);
end
    