%Lift coefficient
function C_l = c_l(V, T)

global alpha_0

U = U_new(T);

alpha = alpha_0 - atan(V / U);

if abs(alpha) <= 18 * pi / 180
        C_l = 2 * pi * alpha;
    else
        C_l = 0;
end
    
end