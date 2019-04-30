function [root,ea,i,xLower,xUpper] = false_position(str,xl,xu,es,imax)
f = str2func(str);
    %{
    it = plot([xl,xu],[f(xl),f(xu)],'g');
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
           root(1,i) = (xl*f(xu) - xu*f(xl))/(f(xu) - f(xl));
           xLower(1,i) = xl;
           xUpper(1,i) = xu;
           ea(1,i) = abs((xu-xl)/xl)*100;
           if f(root(1,i))<0
               xl = root(1,i);
               %delete(it);
               %it = plot ([xl,xu],[f(xl),f(xu)],'g');
               %pause(0.5);
           elseif f(root(1,i))>0
               xu = root(1,i);
               %delete(it);
               %it = plot ([xl,xu],[f(xl),f(xu)],'g');
               %pause(0.5);
           end
           if (f(xl)* f(root(1,i)) == 0) || (ea(1,i) <= es)
               break;
           end
        end
    end
end