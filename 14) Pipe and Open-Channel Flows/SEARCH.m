function [x_intersection,y_intersection,num_intersection] = SEARCH(x, y, v, v_a)

global m n h;

x_intersection = zeros(200, 1);
y_intersection = zeros(200, 1);

k = 0;

for i = 1 : m
    
    j = 1;
    
    while (j <= n)
        
        P = v(i, j) - v_a;
        
        if (abs(P) <= 0.0001)
            
            k = k + 1;
            x_intersection(k) = x(i);
            y_intersection(k) = y(j);
            
        else
            
            while (j < n)
                
                j = j + 1;
                Q = v(i, j) - v_a;
                
                if (P * Q > 0)
                    
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    x_intersection(k) = x(i);
                    y_intersection(k) = y(j) - h * abs(Q) / (abs(P) + abs(Q));
                    P = v(i,j) - v_a;
                    
                end
                
            end
            
        end
        
        j = j + 1;
        
    end
    
end

for j = 1 : n
    i = 1;
    
    while (i <= m && j < n)
        
        P = v(i, j) - v_a;
        
        if (abs(P) <= 0.0001)
            
            k = k + 1;
            x_intersection(k) = x(i);
            y_intersection(k) = y(j);
            
        else
            
            while (i < m && j < n)
                
                i = i + 1;
                Q = v(i, j) - v_a;
                
                if (P * Q > 0)
                    
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    x_intersection(k) = x(i) - h * abs(Q) / (abs(P) + abs(Q));
                    y_intersection(k) = y(j);
                    P = v(i, j) - v_a;
                    
                end
                
            end
            
        end
        
        i = i + 1;
        
    end
    
end

num_intersection = k;

end

