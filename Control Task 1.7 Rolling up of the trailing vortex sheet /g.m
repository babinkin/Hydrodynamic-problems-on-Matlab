% Strength of vortex i

function g = g(x)

global a m G0;

g = zeros(1, m);

for i = 1 : m
    
    g(i) = G0 * (sqrt(1 - (x(i) / a + 1 / m) ^ 2) - sqrt(1 - (x(i) / a - 1 / m) ^ 2));
    
end

end

