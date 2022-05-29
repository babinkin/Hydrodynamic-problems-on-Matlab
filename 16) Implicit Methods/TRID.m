function F = TRID(C, n)

for i = 2 : n - 1
    
    C(i, 2) = C(i, 2) * C(i - 1, 2) - C(i, 1) * C(i - 1, 3);
    C(i, 3) = C(i, 3) * C(i - 1, 2);
    C(i, 4) = C(i, 4) * C(i - 1, 2) - C(i, 1) * C(i - 1, 4);
    
end

F(n) = (C(n, 4) * C(n - 1, 2) - C(n, 1) * C(n - 1, 4)) / (C(n, 2) * C(n - 1, 2) - C(n, 1) * C(n - 1, 3));

for i = 1 : n - 1
    
    j = n - i;
    F(j) = (C(j, 4) - C(j, 3) * F(j + 1)) / C(j, 2);
    
end

end

