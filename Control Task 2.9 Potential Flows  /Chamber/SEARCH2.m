function [x_intersection, y_intersection, num_intersections] = SEARCH2(x, y, psi, psi_a)

global m n k h j_last;
    
    x_intersection = zeros(k, 1);
    y_intersection = zeros(k, 1);

    num_intersections = 0;
    epsilon = 1e-5;

    for i = 1 : m
        
        j = 1;
        
        while j < j_last(i)
            
            P = psi(i,j) - psi_a;
            
            if abs(P) <= epsilon
                
                num_intersections = num_intersections + 1;
                x_intersection(num_intersections) = x(i);
                y_intersection(num_intersections) = y(j);
                
            else
                
                while j < j_last(i)
                    
                    j = j + 1;
                    
                    Q = psi(i,j) - psi_a;
                    
                    if P * Q > 0
                        
                        P = Q;
                        
                    else
     
                        num_intersections = num_intersections + 1;
                        x_intersection(num_intersections) = x(i);
                        y_intersection(num_intersections) = y(j) - h * abs(Q) / (abs(P) + abs(Q));
                        P = psi(i,j) - psi_a;
                        
                    end
                    
                end
                
            end
            
            j = j + 1;
            
        end
        
    end
    
    for j = 1 : n
        
        i = 1;
        
        while i <= m && j < j_last(i)
            
            P = psi(i, j) - psi_a;
            
            if abs(P) <= epsilon
                
                num_intersections = num_intersections + 1;
                x_intersection(num_intersections) = x(i);
                y_intersection(num_intersections) = y(j);
                
            else
             
                while i < m && j < j_last(i)
                    
                    i = i + 1;
                    
                    Q = psi(i, j) - psi_a;
                    
                    if P * Q > 0
                        
                        P = Q;
                        
                    else

                        num_intersections = num_intersections + 1;
                        
                        x_intersection(num_intersections) = x(i) - h * abs(Q) / (abs(P) + abs(Q));
                        y_intersection(num_intersections) = y(j);
                        P = psi(i,j) - psi_a;
                        
                    end
                    
                end
                
            end
            
            i = i + 1;
            
        end
        
    end

end