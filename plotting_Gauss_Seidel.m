function plotting_Gauss_Seidel(x)
    figure('name','plotting_Gauss_Seidel');
    [mm,nn] = size(x);
    for m = 1: mm
        y = [];
        for t = 1:nn
            y = [y, x(m,t)];                        
        end
        plot(1:1:nn, y, 'k');
        hold on;
    end
    xlabel('Iteration');
    ylabel('Roots');
end