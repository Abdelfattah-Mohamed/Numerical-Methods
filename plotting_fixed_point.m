function plotting_fixed_point(str,xi,xii,i)
    figure('name','plotting_fixed_point');
    g = str2sym(str);
    if xi(1) < xi(size(xi))
        arrX = (xi(1)-1):0.01:(xi(size(xi))+1);
    else
        arrX = (xi(size(xi))-1):0.01:(xi(1)+1);
    end
    arrY = [];
    for temp = arrX
        arrY = [arrY, (subs(g,temp))];
    end
    fung = plot(arrX,arrY,'k');
    hold on;
    funl = plot(arrX,arrX,'r');
    hold on;
    pause;
    for t = 1:1:(i-1);
       ver = plot([xi(t) xi(t)], [xi(t) xii(t)], 'b-');
       hold on;
       hor = plot([xi(t) xi(t+1)], [xi(t+1) xi(t+1)], 'b--');
       hold on;
       pause;
    end
end