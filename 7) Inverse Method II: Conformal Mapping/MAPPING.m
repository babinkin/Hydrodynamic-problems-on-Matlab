function [x_mapping, y_mapping, num_mapping] = MAPPING(x_new, y_new, num, x_min, x_max, y_min, y_max)

    global a b z1_p;

    x_mapping = zeros(num);
    y_mapping = zeros(num);
    
    num_mapping = 0;
    
    for i = 1 : num
        
        z1 = x_new(i) + 1i * y_new(i);
        z2 = z1 - z1_p;
        
        R = abs(z2);
        
        if R >= 0.99 * a
            
            z = z1 + b ^ 2 / z1;
            x = real(z);
            y = imag(z);
            
        end
        

        if x >= x_min || x <= x_max || y >= y_min || y <= y_max
            
            num_mapping = num_mapping + 1;
            x_mapping(num_mapping) = x;
            y_mapping(num_mapping) = y;
            
        end
        
    end

end