function plotting_secant(s,xi)
    figure('name','plotting_secant');
    f = str2sym(s);
    fplot(f);
    hold on;
    pause;
    for t = 2:2:(size(xi,2)-1)
       plot([xi(t-1) xi(t+1)], [subs(f,xi(t-1)) 0], 'r');
       hold on;
       plot([xi(t+1) xi(t+1)], [0 subs(f,xi(t+1))], 'g');
       hold on;
       pause;
    end
end