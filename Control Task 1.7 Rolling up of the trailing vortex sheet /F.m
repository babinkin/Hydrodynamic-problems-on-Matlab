function F = F(~, z)

global a m;

x = zeros(m, 1);
y = zeros(m, 1);

x(1) = z(1);
y(2) = z(2);

U = zeros(m, 1);
V = zeros(m, 1);

Ui = zeros(m, 1);
Vi = zeros(m, 1);





for i = 1 : m
    
    for j = 1 : m
        
        if i ~= j
            
            Ui(j) = (sqrt(1 - (x(j) / a + 1 / m) ^ 2) - sqrt(1 - (x(j) / a - 1 / m) ^ 2)) * (y(i) / a - y(j) / a) / ((x(i) / a - x(j) / a) ^ 2 + (y(i) / a - y(j) / a) ^ 2);
            Vi(j) = - (sqrt(1 - (x(j) / a + 1 / m) ^ 2) - sqrt(1 - (x(j) / a - 1 / m) ^ 2)) * (x(i) / a - x(j) / a) / ((x(i) / a - x(j) / a) ^ 2 + (y(i) / a - y(j) / a) ^ 2);
            
        elseif i == j
            
            Ui(j) = 0;
            Vi(j) = 0;
            
        end
        
    end
    
    U(i) = sum(Ui);
    V(i) = sum(Vi);
    
end
    

F = [U; V];

end

