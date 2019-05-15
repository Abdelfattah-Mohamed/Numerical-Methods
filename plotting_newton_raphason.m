function plotting_newton_raphason(str,xi)
    figure('name','plotting_newton_raphason');
    f = str2sym(str);
    if xi(1) < xi(size(xi,2))
        arrX = (xi(1)):(xi(size(xi,2)) - xi(1))/20:(xi(size(xi,2)));
    else
        arrX = (xi(size(xi,2))):(xi(1) - xi(size(xi,2)))/20:(xi(1));
    end
    arrY = [];
    for temp = arrX
        arrY = [arrY, (subs(f,temp))];
    end
    
    funf = plot(arrX,arrY,'k');
    hold on;
    pause;
    
    for t = 1:1:(size(xi,2)-1)
        plot([xi(t) xi(t)],[0 (subs(f,xi(t)))],'--r');
        hold on;
        plot([xi(t) xi(t+1)],[(subs(f,xi(t))) 0],'-r');
        hold on;
        pause;
    end

end