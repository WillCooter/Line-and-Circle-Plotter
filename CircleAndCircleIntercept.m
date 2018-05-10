% C1535277

function intersect = CircleAndCircleIntercept(xa1, ya1, ra, xb1, yb1, rb)
    xintersect = circcirc(xa1, ya1, ra, xb1, yb1, rb);
    a = isnan(xintersect);
    if a(1) == 1
        intersect = [];
    else
        if  round(xintersect(1),4) == round(xintersect(2),4) % checks if circles are next to each other as opposed to on top
            yintersect1 = ya1 + sqrt((ra*ra)-((xintersect(1)-xa1)*(xintersect(1)-xa1)));
            yintersect2 = ya1 - sqrt((ra*ra)-((xintersect(1)-xa1)*(xintersect(1)-xa1)));
            if yintersect1 == yintersect2
                intersect = [xintersect(1), yintersect1];
            else
                intersect = [xintersect(1), yintersect1; xintersect(2), yintersect2];
            end
        else
            yint1Apos = ya1 + sqrt((ra*ra)-((xintersect(1)-xa1)*(xintersect(1)-xa1)));
            yint1Aneg = ya1 - sqrt((ra*ra)-((xintersect(1)-xa1)*(xintersect(1)-xa1)));
            yint2Apos = ya1 + sqrt((ra*ra)-((xintersect(2)-xa1)*(xintersect(2)-xa1)));
            yint2Aneg = ya1 - sqrt((ra*ra)-((xintersect(2)-xa1)*(xintersect(2)-xa1)));
            
            yint1Bpos = yb1 + sqrt((rb*rb)-((xintersect(1)-xb1)*(xintersect(1)-xb1)));
            yint1Bneg = yb1 - sqrt((rb*rb)-((xintersect(1)-xb1)*(xintersect(1)-xb1)));
            yint2Bpos = yb1 + sqrt((rb*rb)-((xintersect(2)-xb1)*(xintersect(2)-xb1)));
            yint2Bneg = yb1 - sqrt((rb*rb)-((xintersect(2)-xb1)*(xintersect(2)-xb1)));
            
            yint1array = [yint1Apos, yint1Aneg, yint1Bpos, yint1Bneg];
            yint2array = [yint2Apos, yint2Aneg, yint2Bpos, yint2Bneg];
            
            for i = 1:2
                for j = 3:4
                    if round(yint1array(i),4) == round(yint1array(j),4)
                        yintersect1 = yint1array(i);
                    end
                end
            end
            
            for i = 1:2
                for j = 3:4
                    if round(yint2array(i),4) == round(yint2array(j),4)
                        yintersect2 = yint2array(i);
                    end
                end
            end
            
            intersect = [xintersect(1), yintersect1; xintersect(2), yintersect2];
        end
    end
end