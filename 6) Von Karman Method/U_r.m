function Ur = U_r(r, z, z_j, Q)

global U;

n = length(Q);
Ur = 0;

for j = 1 : n
    
    Ur = Ur - (U * Q(j) / r) * ((z - z_j(j + 1)) / sqrt(r ^ 2 + (z - z_j(j + 1)) ^ 2) - (z - z_j(j)) / sqrt(r ^ 2 + (z - z_j(j)) ^ 2));
    
end

end

