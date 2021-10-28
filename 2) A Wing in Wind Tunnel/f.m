function F = f(t, y)

global  betta;

Z = y(1);
U = U_new(t);
V = V_new(t, y(2));
cl = c_l(V, t);

F1 = V;
F2 = -(2 * pi) ^ 2 * Z + betta * cl * U * sqrt(U ^ 2 + V ^ 2);

F = [F1; F2];
end