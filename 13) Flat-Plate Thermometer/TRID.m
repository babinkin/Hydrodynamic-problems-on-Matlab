 function [theta] = TRID(f, q, fluid_index)

global n h;

Pr = [6.75; 0.714; 0.044]; % Число Прандтля [вода, воздух, ртуть]

c = zeros(n + 1, 4);
theta = zeros(n + 1, 1); % Безразмерная разница температур

% Calculation of the components of a tridiagonal matrix
    for i = 1 : n
        
        c(i, 1) = 1 - h / 4 * Pr(fluid_index) * f(i);
        c(i, 2) = - 2;
        c(i, 3) = 1 + h / 4 * Pr(fluid_index) * f(i);
        c(i, 4) = - 2 * h ^ 2 * Pr(fluid_index) * q(i) ^ 2;
        
    end

    theta(n + 1) = 0;
    c(1, 3) = c(1, 1) + c(1, 3);
    c(1, 1) = 0;
    c(n, 4) = c(n, 4) - c(n, 3) * theta(n + 1);
    c(n, 3) = 0;

   theta = Gauss(c, n);
   theta(n + 1) = 0;
   
   
end

