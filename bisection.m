function [root,ea,i,xLower,xUpper] = bisection(str,xl,xu,es,imax)
f = str2sym(str);
fileID = fopen("Bisection_Solution.txt", "w");
fprintf(fileID,'%6s %12s %12s %12s %12s \r\n','itr', 'Xl', 'Xu', 'root', 'eps');
tic;
if subs(f,xl)*subs(f,xu)>0
    root = zeros(1);
    fprintf(fileID,'Diverge \r\n');
    ea = zeros(1);
    i = 0;
    xLower = zeros(1);
    xUpper = zeros(1);
else
    if nargin == 3
        es = 0.00001;
        imax = 50;
    elseif nargin == 4
        imax = 50;
    end
    ea = zeros(1,1);
    xLower = zeros(1,1);
    xUpper = zeros(1,1);
    root = zeros(1,1);
    for i=1:imax
       root(1,i) = (xu+xl)/2;
       xLower(1,i) = xl;
       xUpper(1,i) = xu;
       ea(1,i) = abs((xu-xl)/xl);
       if subs(f,xl)*subs(f,root(1,i))<0
           xu = root(1,i);
       elseif subs(f,xl)*subs(f,root(1,i))>0
           xl = root(1,i);
       end
       fprintf(fileID,"%6d %12.5f %12.5f %12.5f %12.5f \r\n", i, xLower(1,i), xUpper(1,i), root(1,i), ea(1,i));
       if (subs(f,xl)* subs(f,root(1,i)) == 0) || (ea(1,i) <= es)
           break;
       end
    end
end
fprintf(fileID,"time = %.6f ms\n", toc);
fprintf(fileID,"Theoritical Error = %d",(log10(xu-xl)-log10(es))/log10(2));
fclose(fileID);
end
