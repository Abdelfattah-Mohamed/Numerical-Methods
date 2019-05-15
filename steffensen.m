function [p,p0,ea,i] = steffensen(s)
f = str2sym(s);
p = zeros(1);
ea = zeros(1);
p0 = zeros(1);
i = 0;
fileID = fopen("Steffensen_Solution.txt", "w");
fprintf(fileID,'%6s %12s %12s %12s \r\n','itr', 'Xi', 'Xi+1', 'eps');
tic;
for j=1:50
  p0(1) = randi([-100,100]); %tring to find initial value near to the root 
  x = subs(f,p0(1));          %To make the algorithm more ifficient
  if (x > -5) && (x < 5)
      break;
  end
end
if j == 50                %Not finding initial value by rand 
    p0(1) = 0;               %so we assume it
end
format compact
format long
if x ~= 0
for i=1:50
    p1=subs(f,p0(i));
    p2=subs(f,p1);
    p(i)=p0(i)-(p1-p0(i))^2/(p2-2*p1+p0(i));
    ea(i) = abs((p(i)-p0(i))/p(i));
    fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, p0(i), p(i), ea(i));
    if ea(i) <= 10^-4
        break ;
    end
    p0(i+1) = p(i);
end
else
    p(1) = p0(1);
    fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, p0(1), p(1), ea(1));
end
fprintf(fileID,"time = %.6f ms\n", toc);
fclose(fileID);
end