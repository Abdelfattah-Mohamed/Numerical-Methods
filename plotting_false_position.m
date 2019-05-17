function plotting_false_position(str,root,xLower,xUpper,i)
    figure('name','plotting_false_position');
    f = str2sym(str);
    it = plot([xLower(1,1),xUpper(1,1)],[(subs(f,(xLower(1,1)))),(subs(f,(xUpper(1,1))))],'g');
    hold on;
    fplot(f);
    hold on;
    pause;
    point = plot(root(1,1),(subs(f,(root(1,1)))),'ko','markerfacecolor','k');
    hold on;
    for t=2:1:i
       delete(it);
       delete(point);
       it = plot ([xLower(1,t),xUpper(1,t)],[(subs(f,(xLower(1,t)))),(subs(f,(xUpper(1,t))))],'g');
       hold on;
       point = plot(root(1,t-1),(subs(f,(root(1,t-1)))),'ko','markerfacecolor','k');
       hold on;
       pause;
    end
    point = plot(root(1,t),(subs(f,(root(1,t)))),'ko','markerfacecolor','k');
end