function f = Gauss(C, n)

% Initialization
f = zeros(n, 1);

% Renaming of coefficients
for i = 2 : n - 1
    
    C(i, 2) = C(i, 2) * C(i - 1, 2) - C(i, 1) * C(i - 1, 3);
    C(i, 3) = C(i, 3) * C(i - 1, 2);
    C(i, 4) = C(i, 4) * C(i - 1, 2) - C(i, 1) * C(i - 1, 4);
    
end


f(n) = (C(n, 4) * C(n - 1, 2) - C(n, 1) * C(n - 1, 4)) / (C(n, 2) * C(n - 1, 2) - C(n, 1) * C(n - 1, 3));

for j = n - 1 : - 1 : 1
    
    f(j) = (C(j, 4) - C(j, 3) * f(j + 1)) / C(j, 2);
    
end

end

