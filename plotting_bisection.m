function plotting_bisection(str,root,xLower,xUpper,i)
    figure('name','plotting_bisection');
    f = str2sym(str);
    y = [(subs(f,(xLower(1,1)))), (subs(f,(xUpper(1,1))))];
    aa = plot ([xLower(1,1),xLower(1,1)],y,'b');
    hold on;
    bb = plot ([xUpper(1,1),xUpper(1,1)],y,'g');
    hold on;
    arrX = (xLower(1,1)):(xUpper(1,1)-xLower(1,1))/20:(xUpper(1,1));
    arrY = [];
    for temp = arrX
        arrY = [arrY, (subs(f,temp))];
    end
    fun = plot(arrX,arrY,'k');
    hold on;
    pause;
    for t = 1:1:(i-1)
       fun = plot(arrX,arrY,'k');
       hold on;
       mid = plot([root(1,t),root(1,t)],y,'r');
       hold on;
       point = plot(root(1,t),(subs(f,(root(1,t)))),'ko','markerfacecolor','k');
       hold on;
       pause;
        if root(1,t) == xLower(1,(t+1))
            delete(aa);
            aa = plot ([xLower(1,(t+1)),xLower(1,(t+1))],y,'b');
            pause;
        else
            delete(bb);
            bb = plot ([xUpper(1,(t+1)),xUpper(1,(t+1))],y,'g');
            pause;
        end
        delete(mid);
        delete(point);
    end
    mid = plot([root(1,i),root(1,i)],y,'r');
    hold on;
    point = plot(root(1,i),(subs(f,(root(1,i)))),'ko','markerfacecolor','k');
    hold on;
end