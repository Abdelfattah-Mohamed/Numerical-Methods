function [root,x,iterations,ea] = secant(str,x0,xi,es,maxI)
func = str2sym(str);
ea = zeros;
x(1) = x0;
x(2) = xi;
maxI= maxI + 2;
ea(2) = abs((xi-x0)/xi);
iterations = 0 ;
for i=3:maxI
    x(i) = x(i-1)- (subs(func,x(i-1))*(x(i-2)-x(i-1)))/(subs(func,x(i-2))-subs(func,x(i-1)));
    iterations=iterations+1;
    
    root = x(i);
    ea(i) = abs((x(i)-x(i-1))/x(i));
    if  (ea<es) %*100 walla mn8er ? 7asab hwa hyb3thaly ezay
        break;
    end
    
end
    