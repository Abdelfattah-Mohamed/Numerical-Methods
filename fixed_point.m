function [f1,x1,x2,err] = fixed_point(s,x0,itr,epsilon)
    f = str2sym(s);
    x = str2sym('x');
    c = coeffs(f);
    f1 = (-f+c(2)*x) / c(2);
    if subs(diff(f1),x0) > 1 || subs(diff(f1),x0) < -1
        x1 = 'diverge';
    else
        x1 = zeros(1);
        x2 = zeros(1);
        er = zeros(1);
        err = zeros(1);
        x1(1) = x0;
        for i=1:itr
            xnew = (subs(f1,x0));
            x2(i) = xnew;
            err(i)=abs(xnew - x0);
            if i~=1
                er(i)=((err(i)-err(i-1))/err(i)) * 100;
            end
            %finding the error at each iteration
            if err(i)<=epsilon %checking the amount of error at each iteration
                break %if enough accuracy has been achieved the stop the iterations
            end
            x0 = xnew;
            x1(i+1) = xnew;
        end
        disp(x2(size(x2)));
        fprintf('The Root is : %f \n',xnew);
    end
end
