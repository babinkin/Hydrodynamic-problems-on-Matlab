function P = Torrance(A, B, P, Q, U_f, U_b, V_f, V_b, H, dT, i, j)

P1 = (U_f - abs(U_f)) * P(i + 1, j) + (U_f + abs(U_f) - U_b + abs(U_b)) * P(i, j) - (U_b + abs(U_b)) * P(i - 1,j);
P2 = (V_f - abs(V_f)) * P(i, j + 1) + (V_f + abs(V_f) - V_b + abs(V_b)) * P(i, j) - (V_b + abs(V_b)) * P(i, j - 1);
P3 = Q(i + 1, j) - Q(i - 1, j);
P4 = P(i + 1, j) + P(i - 1, j) + P(i, j + 1) + P(i, j - 1) - 4 * P(i, j);

P = P(i, j) + dT / (2 * H) * (- P1 - P2 + A * P3 + 2 * B * P4 / H);

end