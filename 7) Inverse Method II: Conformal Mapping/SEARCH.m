% Intersection search function
% x, y - coordinates
% psi - stream function
%psi_a = -1, -0.5, 0, 0.5, 1


function [x_intersection, y_intersection, num_intersections] = SEARCH(x, y, psi, psi_a)

global m n k delta_y1;
    
    x_intersection = zeros(k, 1);
    y_intersection = zeros(k, 1);

    num_intersections = 0;
    epsilon = 1e-5;

    for i = 1 : m
        
        j = 1;
        
        while j < n
            
            P = psi(i,j) - psi_a;
            
            if abs(P) <= epsilon
                
                num_intersections = num_intersections + 1;
                x_intersection(num_intersections) = x(i);
                y_intersection(num_intersections) = y(j);
                
            else
                
                while j < n
                    
                    j = j + 1;
                    
                    Q = psi(i,j) - psi_a;
                    
                    if P * Q > 0
                        
                        P = Q;
                        
                    else
     
                        num_intersections = num_intersections + 1;
                        x_intersection(num_intersections) = x(i);
                        y_intersection(num_intersections) = y(j) - delta_y1 * abs(Q) / (abs(P) + abs(Q));
                        P = psi(i,j) - psi_a;
                        
                    end
                    
                end
                
            end
            
            j = j + 1;
            
        end
        
    end

end


