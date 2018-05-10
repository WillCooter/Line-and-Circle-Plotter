% C1535277

function [LL, LC, CC] = intersects(lines, circles)
%lines Each row of the matrix contains 4 numbers (x1, y1, x2, y2)
%Each row of the matrix contains 3 numbers (xc, yc, r)
    
    LL = [];
    LC = [];
    CC = [];
    
    for i = 1:(size(lines, 1)-1)
        for j = (i+1):size(lines, 1)
            intersect = StraightAndStraightIntercept(lines(i,1), lines(i,2), lines(i,3), lines(i,4),...
                                                     lines(j,1), lines(j,2), lines(j,3), lines(j,4));
            if isempty(intersect) == 0
                LL = [LL; intersect]; 
            end
        end
    end
    
    for i = 1:(size(lines, 1))
        for j = 1:size(circles, 1)
            intersect = StraightAndCircleIntercept(lines(i,1), lines(i,2), lines(i,3), lines(i,4),...
                                                     circles(j,1), circles(j,2), circles(j,3));
            if isempty(intersect) == 0
                LC = [LC; intersect]; 
            end
        end
    end
        
        
    for i = 1:(size(circles, 1)-1)
        for j = (i+1):size(circles, 1)
            intersect = CircleAndCircleIntercept(circles(i,1), circles(i,2), circles(i,3),...
                                                     circles(j,1), circles(j,2), circles(j,3));                            
            if isempty(intersect) == 0
                CC = [CC; intersect]; 
            end
        end
    end
end

