function dij = delta_dij(z, r, z_j)

m = length(z);
n = length(z_j);
dij = zeros(m,n-1);

for i = 1 : m
   
    for j = 1 : n - 1
        
        dij(i, j) = sqrt(r(i) ^ 2 + (z(i) - z_j(j)) ^ 2)- sqrt(r(i) ^ 2 + (z(i) - z_j(j + 1)) ^ 2);
        
    end
    
end

end

