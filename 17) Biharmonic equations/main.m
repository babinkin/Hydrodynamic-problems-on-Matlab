clc;
clear;

global m h;

m = 11;
h = 1 / (m - 1); 

psi = zeros(m, m); 
zeta = zeros(m, m); 

epsilon = 0.001;
error_zeta = 1;
error_psi = 1;
iter = 0;

psi_0 = zeros(m, m);
zeta_0 = zeros(m, m);
f = zeros(m, m);

X = zeros(m, 1);
Y = zeros(m, 1);
X(1) = 0;
Y(1) = 0;

for i = 2 : m
    
    X(i) = X(i - 1) + h;
    Y(i) = Y(i - 1) + h;
    
end

while (error_zeta > epsilon || error_psi > epsilon)
    
    iter = iter + 1;
    
    for j = 2 : m - 1
        
        zeta(1, j) = (- psi(2, j + 1) + 8 / 3 * psi(2, j) - psi(2, j - 1) - 2 / 3 * psi(3, j)) / h ^ 2;
        zeta(m, j) = (- psi(m - 1, j + 1) + 8 / 3 * psi(m - 1, j) - psi(m - 1, j - 1) - 2 / 3 * psi(m - 2, j)) / h ^ 2;
        
    end
    
    for i = 2 : m - 1
        
        zeta(i, 1) = (- psi(i + 1, 2) + 8 / 3 * psi(i, 2) - psi(i - 1, 2) - 2 / 3 * psi(i, 3)) / h ^ 2;
        zeta(i, m) = (- psi(i + 1, m - 1) + 8 / 3 * psi(i, m - 1) - psi(i - 1, m - 1) - 2 / 3 * psi(i, m - 2)) / h ^ 2 - 2 / (3 * h);
        
    end

    for i = 1 : m
        
        for j = 1 : m
            
            f(i, j) = 0;
            zeta_0(i, j) = zeta(i, j);
            
        end
        
    end
    
    [zeta] = Liebmann(zeta, f, epsilon);
    
    for i = 1 : m
        
        for j = 1 : m
            
            error_zeta = abs(zeta(i, j) - zeta_0(i, j));
            
        end
        
    end

    for i = 2 : m - 1
        
        for j = 2 : m - 1
            
            f(i, j) = - zeta(i, j);
            psi_0(i, j) = psi(i, j);
            
        end
        
    end
    
    [psi] = Liebmann(psi, f, epsilon);
    
    for i = 2 : m - 1
        
        for j = 2 : m - 1
            
            error_psi = abs(psi(i, j) - psi_0(i, j));
            
        end
        
    end

end

const = [-0.09; -0.075; -0.06; -0.045; -0.03; -0.015; 0];
marks = ['+', 'o', 's', 'd', 'v', '^', 'x'];

hold on;
for i = 1 : length(const)
    
    [x, y, z] = SEARCH(X, Y, psi, const(i));
    plot(x(1 : z), y(1 : z), marks(i))
    
end
hold off;
box on;
axis square;
title('Stream function plot')
xlabel('x')
ylabel('y')
legend(['PSI=' num2str(const(1))],['PSI=' num2str(const(2))],['PSI=' num2str(const(3))],['PSI=' num2str(const(4))],['PSI=' num2str(const(5))],['PSI=' num2str(const(6))],['PSI=' num2str(const(7))])

