function [psi_new] = liebmannScheme(ksi)

    global m n h psi_0 error_max;
    
    iter = 1;
    error = 1;
    
    psi_new = zeros(m, n);
    psi_old = zeros(m, n);
    

    for i = 1 : m
        
        psi_new(i,1) = 0;
        psi_new(i,n) = 0;
        
    end

    for j = 2 : n - 1
        
        psi_new(1, j) = 0;
        psi_new(m, j) = 0;
        
    end
    
    
    for i = 2 : m - 1
        
        for j = 2 : n - 1
            
            psi_new(i, j) = psi_0;
            
        end
        
    end
    
    while error > error_max
        
        iter = iter + 1;
        error = 0;
                
                for i = 2 : m - 1
                    
                    for j = 2 : n - 1
                        
                        psi_new(i, j) = (psi_new(i - 1, j) + psi_old(i + 1, j) + psi_new(i, j - 1) + psi_old(i, j + 1) + h ^ 2 * ksi(i, j)) / 4;
                        error = error + abs(psi_new(i, j) - psi_old(i, j));
                        psi_old(i, j) = psi_new(i, j);
                        
                    end
                    
                end
                
                iter = iter + 1;
                
    end

end
  