clc;
clear;

M = 21;
N = 10;
h = 1 / (N - 1);
Gr = 1000;
Pr = 6.75;

epsilon = 1e-4;
dt = 0.0025;
t_max = 400;

omega_0 = zeros(M, N);
theta_0 = zeros(M, N);
f_right = zeros(M, N);

alpha = cos(pi / M) + cos(pi / N);
omega_opt = (8 - 4 * (4 - alpha ^ 2) ^ 0.5) / alpha ^ 2;

X = zeros(M, 1);
X(1) = 0;
for i = 2 : M
    
    X(i) = X(i - 1) + h;
    
end

Y = zeros(N, 1);
Y(1) = 0;
for j = 2 : M
    
    Y(j) = Y(j - 1) + h;
    
end

u = zeros(M, N);
v = zeros(M, N);
omega = zeros(M, N);
theta = zeros(M, N);
for i = 1 : M
    
    for j = 1 : N
        
        u(i, j) = 0;
        v(i, j) = 0;

        omega(i, j) = 0;
        theta(i, j) = 0;

        if j == 1
            
            theta(i, j) = 1;
            
        end
        
    end
    
end

psi = zeros(M, N);
for i = 1 : M
    
    for j = 1 : N
        
        psi(i, j) = 0;
    
    end
    
end

psi_temp = zeros(M, N);
t = 0;
    
const = [10, 20, 50, 80, 100, 200, 300, 400];
iter = 0;
figure_num = 1;

while iter <= t_max
    
    for i = 1 : M
        
        for j = 1 : N
            
            f_right(i, j) = - omega(i, j);
            psi_temp(i, j) = 0;
            
            
        end
        
    end
    
    error = 1;

    while error > epsilon
        
        error = 0;
        
        for i = 2 : (M - 1)
            
            for j = 2 : (N - 1)
                
                psi_old = psi_temp(i, j);
                psi_temp(i, j) = psi_temp(i, j) + 0.25 * omega_opt * (psi_temp(i - 1, j) + psi_temp(i + 1, j) + psi_temp(i, j - 1) + psi_temp(i, j + 1) - 4 * psi_temp(i, j) - h ^ 2 * f_right(i, j));
                error = error + abs(psi_temp(i, j) - psi_old);
           
            end
            
        end
        
    end
    
    psi = psi_temp;

    for i = 2 : (M - 1)
        
        for j = 2 : (N - 1)
            
            u(i, j) = (psi(i, j + 1) - psi(i, j - 1)) / (2 * h);
            v(i, j) = - (psi(i + 1, j) - psi(i - 1, j)) / (2 * h);
            v(M, j) = psi(M - 1, j) / h;
            U_f = (u(i + 1, j) + u(i, j)) / 2;
            U_b = (u(i - 1, j) + u(i, j)) / 2;
            V_f = (v(i, j + 1) + v(i, j)) / 2;
            V_b = (v(i, j - 1) + v(i, j)) / 2;
            
            omega_0(i, j) = Torrance(Gr, 1, omega, theta, U_f, U_b, V_f, V_b, h, dt, i, j);
            theta_0(i, j) = Torrance(0, 1/Pr, theta, theta, U_f, U_b, V_f, V_b, h, dt, i, j);
            
            U_b = u(M - 1, j) / 2;
            V_f = (v(M, j + 1) + v(M, j)) / 2;
            V_b = (v(M, j - 1) + v(M, j)) / 2;
            P1 = - 2 * (U_b + abs(U_b)) * theta(M - 1, j) + 2 * (- U_b + abs(U_b)) * theta(M, j);
            P2 = (V_f - abs(V_f)) * theta(M, j + 1) + (V_f + abs(V_f) - V_b + abs(V_b)) * theta(M, j) - (V_b + abs(V_b)) * theta(M, j - 1);
            P4 = 2 * theta(M - 1, j) + theta(M, j + 1) + theta(M, j - 1) - 4 * theta(M, j);
            theta_0(M, j) = theta(M, j) + dt / (2 * h) * (- P1 - P2 + 2 / Pr * P4 / h);
            omega_0(M, j) = 0;
            
            
        end
        
    end

    iter = iter + 1;
    t = t + dt;

    for i = 1 : M
        
        for j = 2 : (N - 1)
            
            omega(i, j) = omega_0(i, j);
            theta(i, j) = theta_0(i, j);
            omega(1, j) = (4 * v(2, j) - v(3, j)) / (2 * h);
            omega(i, 1) = (- 4 * u(i, 2) + u(i, 3)) / (2 * h);
            omega(i, N) = (4 * u(i, N - 1) - u(i, N - 2)) / (2 * h);
            
        end
        
    end

    if figure_num <= length(const)
        
        if iter == const(figure_num)
            
            contour(psi');
            title(['psi at T = ', num2str(t)]);
            xlabel('x');
            ylabel('y');

            figure_num = figure_num + 1;

            if figure_num <= length(const)
                
                figure();
                
            end
            
        end
        
    end
    
end

