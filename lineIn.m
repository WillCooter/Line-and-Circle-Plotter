% C1535277

function inside = inBetween(a1, a2, b1, b2, intersect)
% checks if the intersect is between the end points of the lines ([a1,a2] and [b1, b2])

    if a1 > a2 % orders the end points so that a1 is the smallest
        temp = a2;
        a2 = a1;
        a1 = temp;
    end
    if b1 > b2 % orders the end points so that b1 is the smallest
        temp = b2;
        b2 = b1;
        b1 = temp;
    end

    if (intersect >= a1) && (intersect <= a2) && ...
       (intersect >= b1) && (intersect <= b2) % returns 1 if the intersect is between the end points
        inside =  1;
    else
        inside = 0; % returns 0 otherwise
    end
end

        
    