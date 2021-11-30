function F = F(~, z)

global m;

x = z(1 : length(z) / 2, 1);
y = z(length(z) / 2 + 1 : length(z), 1); 

n = length(x);
U = zeros(n, 1);
V = zeros(n, 1);

Ui = zeros(n, 1);
Vi = zeros(n, 1);

G = zeros(length(x),1);

for i = 1 : length(x)
    
       G(i) = real(sqrt(1 - (x(i) + 1 / m) ^ 2) - sqrt(1 - (x(i) - 1 / m) ^ 2));
    
end 

for i = 1 : n
    
    for j = 1 : n
        
      if i ~= j
            
            Ui(j) = G(j) * (y(i) - y(j)) / ((x(i) - x(j)) ^ 2 + (y(i) - y(j)) ^ 2);
            Vi(j) = G(j) * (x(i) - x(j)) / ((x(i) - x(j)) ^ 2 + (y(i) - y(j)) ^ 2);
           
      elseif i == j
            
          Ui(j) = 0;
          Vi(j) = 0;
      
      end 
       
    end
    
    U(i) = sum(Ui);
    V(i) = - sum(Vi);
    
end


F = [U; V];

end

