function F = F(z, ~)

global rho_ratio d g Uf Vf;


U = z(3);
V = z(4);

w_r = sqrt((Uf - U) ^ 2 + (Vf - V) ^ 2);


    
  
    Fx = 3 * rho_ratio / (4 * d) * c_d(w_r) * (Uf - z(3)) * w_r / (1 + 0.5 * rho_ratio);
    Fy = (- (1 - rho_ratio) * g + 3 * rho_ratio / (4 * d) * c_d(w_r) * (Vf - z(4)) * w_r) / (1 + 0.5 * rho_ratio);
    F = [U;V;Fx;Fy];
end

