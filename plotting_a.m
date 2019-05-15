function plotting_a (bisection, false, fixed, newton, secant, birge)
    figure('name','plotting_roots');
    plot(1:1:size(bisection,2), bisection, 'k');
    hold on;
    plot(1:1:size(false,2), false, 'b');
    hold on;
    plot(1:1:size(fixed,2), fixed, 'r');
    hold on;
    plot(1:1:size(newton,2), newton, 'g');
    hold on;
    plot(1:1:size(secant,2), secant, 'p');
    hold on;
    plot(1:1:size(birge,2), birge, 'y');
    hold on;
    xlabel('Iteration');
    ylabel('Roots');
end