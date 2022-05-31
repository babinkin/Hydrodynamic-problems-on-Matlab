function f = Liebmann(f, q, error_max)

global m h;

for i = 2 : m - 1
    
    for j = 2 : m - 1
        
        f(i, j) = 0;
        
    end
    
end

error = 1;

while (error > error_max)
    
    error = 0;
    
    for i = 2 : m - 1
        
        for j = 2 : m - 1
            
            f_old = f(i, j);
            f(i, j) = 0.25 * (f(i - 1, j) + f(i + 1, j) + f(i, j - 1) + f(i, j + 1) - h ^ 2 * q(i, j));
            error = error + abs(f(i, j) - f_old);
            
        end
        
    end

end

