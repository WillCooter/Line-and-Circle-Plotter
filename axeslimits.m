% C1535277

function [minx, maxx, miny, maxy] = axeslimits(lines, circles)
% gives the max and min values needed for each axis
    
    if isempty(lines) == 0
        minx = lines(1,1);
        maxx = minx;
        miny = lines(1,2);
        maxy = miny;
    else
        minx = circles(1, 1) + circles(1, 3);
        maxx = minx;
        miny = circles(1, 1) - circles(1, 3);
        maxy = miny;
    end
  
    for i = 1:size(lines,1) %checks each line to see if it's end points are greater/less than the max/min axes values
        for j = 1:2:3 %1,3
            if lines(i,j) > maxx
                maxx = lines(i,j);
            elseif lines(i,j) < minx
                minx = lines(i,j);
            end
            if lines(i,j+1) > maxy
                maxy = lines(i,j+1);
            elseif lines(i,j+1) < miny
                miny = lines(i,j+1);
            end
        end
    end
    
    for i = 1:size(circles,1) %checks each circle to see if it's most extreme x and y points are greater/less than the max/min axes values. Does this by adding or subtracting the radius from the co-ordinates of the centre
        if (circles(i, 1) + circles(i, 3)) > maxx %furthest to the right
            maxx = circles(i, 1) + circles(i, 3);
        elseif (circles(i, 1) - circles(i, 3)) < minx %furthest to the left
            minx = circles(i, 1) - circles(i, 3);
        end
        if (circles(i, 2) + circles(i, 3)) > maxy 
            maxy = circles(i, 2) + circles(i, 3);
        elseif (circles(i, 2) - circles(i, 3)) < miny
            miny = circles(i, 2) - circles(i, 3);
        end
    end
    
    xborder = (maxx - minx) / 10;
    yborder = (maxy - miny) / 10;
    maxx = maxx + xborder;
    minx = minx - xborder;
    maxy = maxy + yborder;
    miny = miny - yborder;
end
            