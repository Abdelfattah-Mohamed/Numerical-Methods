function [root,b0,c1,xr,iterations,ea] = biergevieta(f,xr0,es,maxI)
fileID = fopen("Bierge_Vieta_Solution.txt", "w");
fprintf(fileID,'%6s %12s %12s %12s %12s \r\n','itr', 'B0', 'C1', 'Xr', 'eps');
b0=zeros(1);
c1=zeros(1);
xr=zeros(1);
b = zeros(1);
c = zeros(1);
ea = zeros(1);
xr(1) = xr0;
b0(1) = 0;
c1(1) = 0;
a = sym2poly(str2sym(f));
a = fliplr(a);
d=size(a);
b(d(2))=a(d(2));
c(d(2))=a(d(2));
iterations = 0 ;
maxI=maxI+1;
ea(1)=0;
tic;
for i=2:maxI
    iterations=iterations+1;
    for j=d(2)-1:-1:1
        b(j)=b(j+1)*xr(i-1)+a(j);
        c(j)=c(j+1)*xr(i-1)+b(j);
    end
    b0(i)=b(1);
    c1(i)=c(2);
    xr(i)=xr(i-1)-b0(i)/c1(i);
    root = xr(i);
    ea(i) = abs((xr(i)-xr(i-1))/xr(i));
    fprintf(fileID,"%6d %12.5f %12.5f %12.5f %12.5f \r\n", i, b0(i), c1(i), xr(i), ea(i));
    if  ea(i) <= es %*100 walla mn8er ? 7asab hwa hyb3thaly ezay
        break;
    end 
end
fprintf(fileID,"time = %.6f ms\n", toc);
fclose(fileID);
end