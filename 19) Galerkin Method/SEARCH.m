function [X, Y, Psi] = SEARCH(x, y, psi, psi_a)

global M N h;

X = zeros(100, 1);
Y = zeros(100, 1);

k = 0;

for i = 1 : M
    
    j = 1;
    
    while (j <= N)
        
        P = psi(i, j) - psi_a;
        
        if (abs(P) <= 0.0001)
            
            k = k + 1;
            X(k) = x(i);
            Y(k) = y(j);
            
        else
            
            while (j < N)
                
                j = j + 1;
                Q = psi(i, j) - psi_a;
                
                if (P * Q > 0)
                    
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    X(k) = x(i);
                    Y(k) = y(j) - h * abs(Q) / (abs(P) + abs(Q));
                    P = psi(i, j) - psi_a;
                    
                end
                
            end
            
        end
        
        j = j + 1;
        
    end
    
end

for j = 1 : N
    
    i = 1;
    
    while (i <= M && j < N)
        
        P = psi(i, j) - psi_a;
        
        if (abs(P) <= 0.0001)
            k = k + 1;
            X(k) = x(i);
            Y(k) = y(j);
            
        else
            
            while (i < M && j < N)
                
                i = i + 1;
                Q = psi(i, j) - psi_a;
                
                if (P*Q > 0)
                    P = Q;
                    
                else
                    
                    k = k + 1;
                    X(k) = x(i) - h * abs(Q) / (abs(P) + abs(Q));
                    Y(k) = y(j);
                    P = psi(i, j) - psi_a;
                    
                end
                
            end
            
        end
        
        i = i + 1;
        
    end
    
end

Psi = k;
