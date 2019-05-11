function p = steffensen(s)

f = str2sym(s);

for j=1:50
  p0 = randi([-100,100]); %tring to find initial value near to the root 
  x = subs(f,p0);          %To make the algorithm more ifficient
  if (x > -2) && (x < 2)
      break;
  end
end
if j == 50                %Not finding initial value by rand 
    p0 = 0;               %so we assume it
end
format compact
format long
if x ~= 0
for i=1:50
    p1=subs(f,p0);
    p2=subs(f,p1);
    p=p0-(p1-p0)^2/(p2-2*p1+p0);
    if abs((p-p0)/p) <= 10^-4
        break ;
    end
    p0=p;
end
if abs((p-p0)/p)>10^-4
    disp('failed to converge in 50 iterations.');
end
else
    p = p0;
end
sprintf('%16.f',p);