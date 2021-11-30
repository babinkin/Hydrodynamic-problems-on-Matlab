function Uz = U_z(r, z, z_j, Q)

global U;

n = length(Q);
Uz = 0;

for j = 1 : n
    
    Uz = Uz + Q(j) * (1 / sqrt(r ^ 2 + (z - z_j(j + 1)) ^ 2) - 1 / sqrt(r ^ 2 + (z - z_j(j)) ^ 2));
    
end

Uz = (Uz + 1) * U;

end

