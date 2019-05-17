function [p,ea,i] = steffensen(s)
f = str2sym(s);
p = zeros(1);
ea = zeros(1);
p0 = zeros(1);
p0(1) = -50;
i = 0;
fileID = fopen("Steffensen_Solution.txt", "w");
fprintf(fileID,'%6s %12s %12s %12s \r\n','itr', 'Xi', 'Xi+1', 'eps');
tic;
while(p0(1)<50)
  x = subs(f,p0(1));
  if (x > 0) && (x < 1)
      break;
  end
  p0(1) = p0(1) + 0.3;
end
if p0(1)>=100
    if subs(f,115) > subs(f,-115)
        p0(1) = 115;
    else
        p0(1) = -115;
    end
end
if x ~= 0
for i=1:50
    gx = ((subs(f,p0(i) + subs(f,p0(i))))/subs(p0(i))) - 1;
    p(i)=p0(i)-(subs(f,p0(i))/gx);
    ea(i) = abs((p(i)-p0(i))/p(i));
    fprintf(fileID,"%6d %12.5f %12.5f %12.5f \r\n", i, p0(i), p(i), ea(i));
    if ea(i) <= 10^-5
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