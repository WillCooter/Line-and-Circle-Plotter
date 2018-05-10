% C1535277

function inbetween = circleIn(a, b, intersect)
% checks if the intersect is between the end points of the lines ([a,b])

    if a > b % orders the end points so that aa is the smallest
        temp = a;
        a = b;
        b = temp;
    end
    
    if (intersect >= a) && (intersect <= b)
        inbetween = 1; % returns 1 if the intersect is between the end points
    else
        inbetween = 0; % returns 0 otherwise
    end
end