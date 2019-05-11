function plotting_secant(s,xi)
    
    figure('name','plotting_secant');
    f = str2sym(s);
    if xi(1) < xi(size(xi))
        arrX = (xi(1)-1):0.01:(xi(size(xi))+1);
    else
        arrX = (xi(size(xi))-1):0.01:(xi(1)+1);
    end
    arrY = [];
    for temp = arrX
        arrY = [arrY, (subs(f,temp))];
    end
    fun = plot(arrX,arrY,'k');
    hold on;
    pause;
    
    for t = 2:1:(size(xi)-1)
       plot([xi(t-1) xi(t+1)], [subs(f,xi(t-1)) 0], 'b-');
       hold on;
       plot([xi(t+1) xi(t+1)], [0 subs(f,xi(t+1))], 'b--');
       hold on;
       pause;
    end 
    
end