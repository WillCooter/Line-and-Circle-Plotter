% C1535277

function h = plotAll(lines, circles)
% plots all lines and circles
    for i = 1:size(lines,1)
        plot([lines(i,1), lines(i,3)], [lines(i,2), lines(i,4)]);
        hold on;
    end
    for i = 1:size(circles,1)
        th = 0:pi / 50:2 * pi;
        plot(circles(i,3) * cos(th) + circles(i,1), circles(i,3) * sin(th) + circles(i,2));
        hold on;
    end
    [LL LC CC] = intersects(lines, circles);
    AA = [LL; LC; CC];
    xintersects = [];
    yintersects = [];
    for i = 1:size(AA,1)
        xintersects = [xintersects; AA(i,1)];
        yintersects = [yintersects; AA(i,2)];
    end
    plot(xintersects, yintersects, 'o');
    hold off;
    [minx maxx miny maxy] = axeslimits(lines, circles);
    xlim([minx maxx]);
    ylim([miny maxy]);
    daspect([1 1 1])
end