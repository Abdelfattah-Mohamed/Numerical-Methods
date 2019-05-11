function [x,err] = Newton_Raphson(s,x0,itr,error)
    % Program Code of Newton-Raphson Method in MATLAB
    f = str2sym(s);
    x = zeros(1);
    err = zeros(1);
    x(1)=x0;
    d=diff(f);

    for i=1:itr
        x(i+1)=x(i)-((subs(f,x(i))/(subs(d,x(i)))));
        err(i)=abs((x(i+1)-x(i))/x(i+1));
        if err(i)<error
            break
        end
    end
    root=x(i);
    fprintf('The Root is : %f \n',root);
end