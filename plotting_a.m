function plotting_a (bisection, false, fixed, newton, secant, birge)
    figure('name','plotting_roots');
    if size(bisection,2) > 1
    plot(1:1:size(bisection,2), bisection, 'k');
    hold on;
    end
    if size(false,2) > 1
    plot(1:1:size(false,2), false, 'b');
    hold on;
    end
    if size(fixed,2) > 1
    plot(1:1:size(fixed,2), fixed, 'r');
    hold on;
    end
    if size(newton,2) > 1
    plot(1:1:size(newton,2), newton, 'g');
    hold on;
    end
    if size(secant,2) > 1
    plot(1:1:size(secant,2), secant, 'm');
    hold on;
    end
    if size(birge,2) > 1
    plot(1:1:size(birge,2), birge, 'y');
    hold on;
    end
    xlabel('Iteration');
    ylabel('Roots');
end