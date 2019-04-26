function plotting_bisection(f,root,xLower,xUpper,i)

    y = [f(xLower(1,1)), f(xUpper(1,1))];
    aa = plot ([xLower(1,1),xLower(1,1)],y,'b');
    hold on;
    bb = plot ([xUpper(1,1),xUpper(1,1)],y,'g');
    hold on;
    arrX = (xLower(1,1)-1):0.1:(xUpper(1,1)+1);
    arrY = [];
    for temp = arrX
        arrY = [arrY, f(temp)];
    end
    fun = plot(arrX,arrY,'k');
    hold on;
    pause(0.5);
    for t = 1:1:(i-1);
       fun = plot(arrX,arrY,'k');
       hold on;
       mid = plot([root(1,t),root(1,t)],y,'r');
       hold on;
       point = plot(root(1,t),f(root(1,t)),'ko','markerfacecolor','k');
       hold on;
       pause(0.5);
        if root(1,t) == xLower(1,(t+1))
            delete(aa);
            aa = plot ([xLower(1,(t+1)),xLower(1,(t+1))],y,'b');
            pause(0.5);
        else
            delete(bb);
            bb = plot ([xUpper(1,(t+1)),xUpper(1,(t+1))],y,'g');
            pause(0.5);
        end
        delete(mid);
        delete(point);
    end
    mid = plot([root(1,i),root(1,i)],y,'r');
    hold on;
    point = plot(root(1,i),f(root(1,i)),'ko','markerfacecolor','k');
    hold on;
end