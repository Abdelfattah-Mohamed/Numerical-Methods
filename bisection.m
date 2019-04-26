function [root,ea,i,xLower,xUpper] = bisection(f,xl,xu,es,imax)
%{
y = [f(xl), f(xu)];
aa = plot ([xl,xl],y,'b');
hold on;
bb = plot ([xu,xu],y,'g');
hold on;
arrX = (xl-1):0.1:(xu+1);
arrY = [];
for temp = arrX
    arrY = [arrY, f(temp)];
end
fun = plot(arrX,arrY);
hold on;
pause(0.5);
%}
if f(xl)*f(xu)>0
    root = ('no bracket!');
    ea = ('');
    i = 0;
    xLower = ('');
    xUpper = ('');
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
    tic;
    for i=1:1:imax
       root(1,i) = (xu+xl)/2;
       %mid = plot([root(1,i),root(1,i)],y,'r');
       %pause(0.5);
       xLower(1,i) = xl;
       xUpper(1,i) = xu;
       ea(1,i) = abs((xu-xl)/xl);
       if f(xl)*f(root(1,i))<0
           xu = root(1,i);
           %{
           delete(bb);
           bb = plot ([xu,xu],y,'g');
           pause(0.5);
           %}
       elseif f(xl)*f(root(1,i))>0
           xl = root(1,i);
           %{
           delete(aa);
           aa = plot ([xl,xl],y,'b');
           pause(0.5);
           %}
       end
       if (f(xl)* f(root(1,i)) == 0) || (ea(1,i) <= es)
           break;
       end
       %delete(mid);
    end
end
end
