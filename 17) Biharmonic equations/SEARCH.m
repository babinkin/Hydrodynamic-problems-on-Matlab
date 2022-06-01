function [x, y, z] = SEARCH(X, Y, psi, psi_a)

global m h;

x = zeros(10, 1);
y = zeros(10, 1);

k = 0;

for i = 1 : m
    
    j = 1;
    
    while (j <= m)
        
        P = psi(i, j) - psi_a;
        
        if (abs(P) <= 0.0001)
            
            k = k + 1;
            x(k) = X(i);
            y(k) = Y(j);
            
        else
            
            while (j < m)
                
                j = j + 1;
                Q = psi(i, j) - psi_a;
                
                if (P * Q > 0)
                    
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    x(k) = X(i);
                    y(k) = Y(j) - h * abs(Q) / (abs(P) + abs(Q));
                    P = psi(i, j) - psi_a;
                    
                end
                
            end
            
        end
        
        j = j + 1;
        
    end
    
end

for j = 1 : m
    
    i = 1;
    
    while (i <= m && j < m)
        
        P = psi(i, j) - psi_a;
        
        if (abs(P) <= 0.0001)
            
            k = k + 1;
            x(k) = X(i);
            y(k) = Y(j);
            
        else
            
            while (i < m && j < m)
                
                i = i + 1;
                Q = psi(i, j) - psi_a;
                
                if (P * Q > 0)
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    x(k) = X(i) - h * abs(Q) / (abs(P) + abs(Q));
                    y(k) = Y(j);
                    P = psi(i, j) - psi_a;
                    
                end
                
            end
            
        end
        
        i = i + 1;
        
    end
    
end

z = k;

end

