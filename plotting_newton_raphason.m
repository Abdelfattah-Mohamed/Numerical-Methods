function plotting_newton_raphason(str,xi)
    figure('name','plotting_newton_raphason');
    f = str2sym(str);
    fplot(f);
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