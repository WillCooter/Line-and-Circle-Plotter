% C1535277

function intersect = StraightAndStraightIntercept(xa1, ya1, xa2, ya2, xb1, yb1, xb2, yb2)

    m1 = (ya2-ya1)/(xa2-xa1); % gradient of line 1
    m2 = (yb2-yb1)/(xb2-xb1); % gradient of line 2
    c1 = ya1 - (m1 * xa1); % y at x=0 for line 1
    c2 = yb1 - (m2 * xb1); % y at x=0 for line 2

    if (m2 == Inf || m2 == -Inf) && (m1 == Inf || m1 == -Inf) % if both lines are vertical
        if xa1 == xb1 % if both lines share the same x value
            if lineIn(ya1, ya2, yb1, yb2, ya1) == 1 || lineIn(ya1, ya2, yb1, yb2, ya2) == 1 % checks if the lines share any points
                intersect = []; % infinite points shared between the y values
            else 
                intersect = []; % no intersection points
            end
        else % cannot be an intersection points
            intersect = [];
        end

   elseif m1 == Inf || m1 == -Inf % if the first line is vertical
        xintersect = xa1; % will intersect on the x co-ordinates of the verticle line
        yintersect = (m2 * xa1) + c2;
        if lineIn(ya1, ya2, yb1, yb2, yintersect) == 1 % checks if the y intersect is between the y end-points
            if lineIn(xa1, xa2, xb1, xb2, xintersect) == 1 % checks if the x intersect is between the x end-points
                intersect = [xintersect, yintersect];
            else
                intersect = [];
            end
        else
            intersect = [];
        end

    elseif m2 == Inf || m2 == -Inf % if the second line is vertical
        xintersect = xb1; % will intersect on the x co-ordinates of the verticle line
        yintersect = (m1 * xb1) + c1;
        if lineIn(ya1, ya2, yb1, yb2, yintersect) == 1 % checks if the y intersect is between the y end-points
            if lineIn(xa1, xa2, xb1, xb2, xintersect) == 1 % checks if the x intersect is between the x end-points
                intersect = [xintersect, yintersect];
            else
                intersect = [];
            end
        else
            intersect = [];
        end

    elseif m1 == 0 && m2 == 0 % if both lines have a gradient of 0
        if ya1 == yb1 % check if both lines have the same y co-ordinate
            if lineIn(xa1, xa2, xb1, xb2, xa1) || lineIn(xa1, xa2, xb1, xb2, xa2) % check if they share at least one point
                intersect = []; % infinite points shared between the x values
            else 
            intersect = [];
            end
        else
            intersect = [];
        end

    else % if both gradients are finite and at least one is not zero
        xintersect = (c2-c1)/(m1-m2);
        yintersect = m1*xintersect + c1;
        if lineIn(xa1, xa2, xb1, xb2, xintersect) == 1 % checks if the x intersect is between the x end-points. Don't need to check y as if one is true the other will be too
            intersect = [xintersect, yintersect];
        else
            intersect = [];
        end
    end

end