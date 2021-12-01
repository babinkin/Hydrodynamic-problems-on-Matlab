% Intersection search function
% x, y - coordinates
% psi - stream function
%psi_a = -1, -0.5, 0, 0.5, 1


function [x_intersection, y_intersection, num_intersections] = SEARCH(x, y, psi, psi_a)

global m n delta_y epsilon;

num_intersections = 0;
x_intersection = zeros(100, 1);
y_intersection = zeros(100, 1);


for i = 1 : m
    
    j = 1;
    
    while j < n
        
        P = psi(i, j) - psi_a;
        
        if abs(P) <= epsilon
            
            num_intersections = num_intersections + 1;
            x_intersection(num_intersections) = x(i);
            y_intersection(num_intersections) = y(j);
            
        else
            
            while j < n
                
                j = j + 1;
                
                Q = psi(i, j) - psi_a;
                
                if P * Q > 0
                    
                    P = Q;
                    
                else
                    
                     num_intersections = num_intersections + 1;
                     x_intersection(num_intersections) = x(i);
                     y_intersection(num_intersections) = y(j) - abs(Q) * delta_y / (abs(P) + abs(Q));
                     P = psi(i, j) - psi_a;
                     
                end
                
            end
            
        end
        
  j = j + 1;
        
    end
    
end

end

