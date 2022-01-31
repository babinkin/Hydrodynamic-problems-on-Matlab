function [psi_new] = liebmannScheme(ksi)

    global m n h error_max j_first;
    
    iter = 0;
    error = 1;
    
    psi_new = zeros(m, n);
    ID = zeros(m, n);
    A = zeros(m, n);
    B = zeros(m, n);
    C = zeros(m, n);
    D = zeros(m, n);

    for i = 1 : m
        
        j_first_new = j_first(i) - 1;

        for j = 1 : j_first_new
            
            psi_new(i, j) = 0;
            
        end
        
    end

    for i = 1 : m
        
        psi_new(i, n) = 1;
        
    end

    for j = 2 : (n - 1)
        
        psi_new(1, j) = 1;
        
    end
    
    for i = 2 : m
        
        for j = j_first(i) : (n - 1)
            
            psi_new(i, j) = ksi;
            
        end
        
    end
    
    for i = 2 : m
        
        for j = j_first(i) : n - 1
            
            ID(i, j) = 0;

            if i == m
                
                ID(i, j) = - 1;
                
            end
            
        end
        
    end

    for i = 9 : 17
        
        j = j_first(i);
        ID(i, j) = 1;
        
    end

    ID(9, 3) = 1;
    ID(13, 6) = 0;
    ID(17, 3) = 1;

    for i = 9 : 17
        
        for j = 2 : 5
            
            if ID(i, j) == 1
                
                A(i, j) = h;
                B(i, j) = h;
                C(i, j) = h;
                D(i, j) = h;

                if i == 9 || i == 10
                    
                    B(i, j) = (13 - i) * h - sqrt(1 - ((j - 1) * h) ^ 2);
                    
                elseif i == 16 || i == 17
                    
                    A(i, j) = (i - 13) * h - sqrt(1 - ((j - 1) * h) ^ 2);
                    
                elseif i >= 10 && i <= 16
                    
                    C(i, j) = (j - 1) * h - sqrt(1 - ((13 - i) * h) ^ 2);
                    
                end
                
            end
            
        end
        
    end
    
   while error > error_max
       
        iter = iter + 1;
        error = 0;

        for i = 2 : m
            
            for j = j_first(i) : (n - 1)
                
                psi_old = psi_new(i, j);

                if ID(i, j) == -1
                    
                    psi_new(i, j) = (2 * psi_new(i - 1, j) +psi_new(i, j - 1) + psi_new(i, j + 1)) / 4;
                    
                elseif ID(i, j) == 0
                    
                    psi_new(i, j) = (psi_new(i - 1, j) +  psi_new(i + 1, j) + psi_new(i, j - 1) + psi_new(i, j + 1)) / 4;
                    
                elseif ID(i, j) == 1

                    psi_new(i, j) = (psi_new(i - 1, j) / (A(i, j) * A(i, j) + B(i, j)) + psi_new(i + 1, j) / (B(i, j) * A(i, j) + B(i, j)) + psi_new(i, j - 1) / (C(i, j) * C(i, j) + D(i, j)) + psi_new(i, j + 1) / (D(i, j) * C(i, j) + D(i, j))) /(1 / (A(i,j) * B(i, j)) + 1 / (C(i, j) * D(i, j)));
               
                end

                error = error + abs(psi_new(i, j) - psi_old);
                
            end
            
        end
        
   end
    
end
  