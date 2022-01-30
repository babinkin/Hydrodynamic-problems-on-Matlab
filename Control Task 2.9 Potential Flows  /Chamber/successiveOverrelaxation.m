function [psi_new] = successiveOverrelaxation(ksi)

    global m n error_max j_last;
    
    iter = 0;
    error = 1;
    
    psi_new = zeros(m, n);

    for j = 1 : m
        
        psi_new(1, j) = 1;
        
    end

    for j = 1 : 9
        
        psi_new(m, j) = 1;
        
    end
    
    
    for i = 2 : m - 1
        
        if i > 7 && i < 22
            
            psi_new(i, 1) = 0;
            
        else
            
            psi_new(i, 1) = 1;
            
        end

        j = j_last(i);
        psi_new(i, j) = 1;
        
    end
    
    
    for i = 2 : m - 1
        
        j_last_new = j_last(i) - 1;

        for j = 2 : j_last_new
            
            psi_new(i,j) = ksi;
            
        end
        
    end
    
    alpha = cos(pi / m) + cos(pi / n);
    omega = (8 - 4 * sqrt(4 - alpha ^ 2)) / alpha ^ 2;
            
    while error > error_max
        
        iter = iter + 1;
        error = 0;
                
                for i = 2 : m - 1
                    
                    j_last_new = j_last(i) - 1;
                    
                    for j = 2 : j_last_new
                        
                        psi_old = psi_new(i, j);
                        psi_new(i, j) = (1 - omega) * psi_new(i, j) + omega * (psi_new(i - 1, j) + psi_new(i + 1, j) + psi_new(i, j - 1) + psi_new(i, j + 1)) / 4;
                        error = error + abs(psi_new(i, j) - psi_old);
                        
                        
                    end
                    
                end
                
                iter = iter + 1;
                
    end
end
  