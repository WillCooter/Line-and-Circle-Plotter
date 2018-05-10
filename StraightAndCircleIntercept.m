% C1535277

function intersect = StraightAndCircleIntercept(xa1, ya1, xa2, ya2, xb1, yb1, rb)

    m1 = (ya2-ya1)/(xa2-xa1); % gradient of the line
    c1 = ya1 - (m1 * xa1); % y at x=0 for the line
    
    if m1 == Inf || m1 == -Inf % if the line is verticle
        intersect1 = yb1 + sqrt( (rb * rb) - ((xa1 - xb1) * (xa1 - xb1))); % calculates both intersects
        intersect2 = yb1 - sqrt( (rb * rb) - ((xa1 - xb1) * (xa1 - xb1)));
        if  round(intersect1,4) == round(intersect2,4)
            intersect = [xa1, intersect1]; % if the intersects are the same (i.e.: the line is a tangent) only one intersect is returned
        else
            intersect = [xa1, intersect1; xa1, intersect2];
        end
        
        i = 1;
        isempty = 0;
        initialsize = size(intersect, 1); % gives the number of rows in the matrix (i.e.: the number of intersects)
        while i <= size(intersect, 1) % loops through each intersect
            if circleIn(ya1, ya2, intersect(i, 2)) == 0 % checks if the y intersect is between the y end-points of the line
                intersect(i,:) = []; % if the intersect is not between the end-points it is deleted from the matrix
                isempty = isempty + 1; % isempty is incremented
            else
                i = i + 1; % i is incremented
            end
        end
        if isempty == initialsize % if no intersects are between the end points
            intersect = [];
        end               
        
    else
        xintersects = linecirc(m1, c1, xb1, yb1, rb); % function returns all xintersects
        if  round(xintersects(1),4) == round(xintersects(2),4) % if the intersects are the same (i.e.: the line is a tangent)
            intersect = [xintersects(1), ((m1 * xintersects(1)) + c1)]; % calculates the y intersect
        else
            intersect = [xintersects(1), ((m1 * xintersects(1)) + c1); ...
                        xintersects(2), ((m1 * xintersects(2)) + c1)];% calculates the y intersects
        end

        a = isnan(intersect); % if there are no intersects, linecirc() returns [Nan Nan]
        for i = 1:size(intersect, 1)
            for j = 1:size(intersect, 1)
                if a(i:j) == 1
                    intersect = []; % converts [Nan Nan] to []
                end
            end
        end
        
        i = 1;
        isempty = 0;
        initialsize = size(intersect, 1); % gives the number of rows in the matrix (i.e.: the number of intersects)
        while i <= size(intersect, 1) % loops through each intersect
            if circleIn(xa1, xa2, intersect(i, 1)) == 0 % checks if the y intersect is between the y end-points of the line
                intersect(i,:) = []; % if the intersect is not between the end-points it is deleted from the matrix
                isempty = isempty + 1; % isempty is incremented
            else
                i = i + 1; % i is incremented
            end
        end
        if isempty == initialsize % if no intersects are between the end points
            intersect = [];
        end      
    end
    if isreal(intersect) == 0 % if the intersect is not a real number it is removed
        intersect = [];
    end
    
end
