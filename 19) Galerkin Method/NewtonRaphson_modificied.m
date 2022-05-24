function [x,y] = NewtonRaphson_modificied(x, y, epsilon)

global Re;

dx = - (9.931035 / Re * x + 0.011713 * y - 0.002546 * x * y + 44.689656 / Re) / (9.931035 / Re - 0.002546 * y);
x = x + dx;
dy = - (0.050148 * x + 2.201058 / Re * y + 0.002421 * x ^ 2 - 0.000376 * y ^ 2 + 0.379018) / (2.201058 / Re - 0.000752 * y);
y = y + dy;

while (abs(dx) >= epsilon || abs(dy) >= epsilon)
    
    dx = -(9.931035 / Re * x + 0.011713 * y - 0.002546 * x * y + 44.689656 / Re) / (9.931035 / Re - 0.002546 * y);
    x = x + dx;
    dy = - (0.050148 * x + 2.201058 / Re * y + 0.002421 * x ^ 2 - 0.000376 * y ^ 2 + 0.379018) / (2.201058 / Re - 0.000752 * y);
    y = y + dy;
    
end

end
