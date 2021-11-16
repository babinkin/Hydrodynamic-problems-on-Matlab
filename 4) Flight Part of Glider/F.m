function F = F(~, z)

global A B ; 



U = z(3);
V = z(4);

    Fx = - A * (U ^ 2 + V ^ 2) ^ (1 / 2) * (B * U + V);
    Fy = -1 + A * (U ^ 2 + V ^ 2) ^ (1 / 2) * (U - B * V) ;
    F = [U;V;Fx;Fy];
end

