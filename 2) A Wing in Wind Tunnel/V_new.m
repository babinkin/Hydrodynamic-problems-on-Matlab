function V1 = V_new(T, V0)
global a omega

V1 = V0 + a * U_new(T) * sin(omega * T);
%V1 = V0;
end