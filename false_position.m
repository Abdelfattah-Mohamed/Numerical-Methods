function [root,ea,i,xLower,xUpper] = false_position(str,xl,xu,es,imax)
    f = str2sym(str);
    if subs(f,xl)*subs(f,xu)>0
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
           root(1,i) = (xl*subs(f,xu) - xu*subs(f,xl))/(subs(f,xu) - subs(f,xl));
           xLower(1,i) = xl;
           xUpper(1,i) = xu;
           ea(1,i) = abs((xu-xl)/xl);
           if subs(f,root(1,i))<0
               xl = root(1,i);
           elseif subs(f,root(1,i))>0
               xu = root(1,i);
           end
           if (subs(f,xl)* subs(f,root(1,i)) == 0) || (ea(1,i) <= es)
               break;
           end
        end
    end
end