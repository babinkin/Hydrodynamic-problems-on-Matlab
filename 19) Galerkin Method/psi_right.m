function [PSIF] = psi_right(x, y)

global A1 A2 A3 A4 B1 B2 B3 B4;

R = (x ^ 2 + y ^ 2) ^ 0.5;

if (R <= 1)
    
    PSIF = 0;
    
else
    
    zeta = x / R;
    PSIF = (R ^ 2 / 2 + A1 / R + A2 / R ^ 2 + A3 / R ^ 3 + A4 / R ^ 4) * (1 - zeta ^ 2) + (B1 / R + B2 / R ^ 2 + B3 / R ^ 3 + B4 / R ^ 4) * zeta * (1 - zeta ^ 2);
    
end

end
