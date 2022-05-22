function [x] = NewtonRaphson(x, epsilon)

global A1 A2 A3 A4 B1 B2 B3 B4

dx = - (0.5 + (A1 + B1) / x ^ 3 + (A2 + B2) / x ^ 4 + (A3 + B3) / x ^ 5 + (A4 + B4) / x ^ 6) / (-3 * (A1 + B1) / x ^ 4 - 4 * (A2 + B2) / x ^ 5 - 5 * (A3 + B3) / x ^ 6 - 6 * (A4 + B4) / x ^ 7);

x = x + dx;

while (abs(dx) >= epsilon)
    
    dx = - (0.5 + (A1 + B1) / x ^ 3 + (A2 + B2) / x ^ 4 + (A3 + B3) / x ^ 5 + (A4 + B4) / x ^ 6) / (-3 * (A1 + B1) / x ^ 4 - 4 * (A2 + B2) / x ^ 5 - 5 * (A3 + B3) / x ^ 6 - 6 * (A4 + B4) / x ^ 7);
    x = x + dx;
    
end

end
