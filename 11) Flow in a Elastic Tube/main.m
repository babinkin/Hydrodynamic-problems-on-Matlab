clc;
clear;

x_min = 0;
x_max = 40;
n_x = 100;
delta_x = (x_max - x_min) / (n_x - 1);
x = linspace(x_min, x_max, n_x);

Courant = 1;
t_end = 4;
n = 1;
t(n) = 0;

u = zeros(n_x,1);
u_0 = 10;

for i = 1 : n_x
          
           if x(i) <= 20
               
               u(i, 1) = u_0;
               
           else
               
               u(i, 1) = 0;
               
           end
end

    u_matrix(:) = u(:, n);
    dt = Courant * delta_x / max(u(:, n));
    
while t(n) <= t_end 
    
    t(n + 1)= t(n) + dt;

       for i = 2 : n_x - 1
           
           u_matrix(i) = u(i, n) - dt / (2 * delta_x) * 0.5 * (u(i + 1, n) ^ 2 - u(i, n) ^ 2);
           u(i, n + 1) = 0.5 * (u(i, n) + u_matrix(i) - dt / (2 * delta_x) * (u_matrix(i) ^ 2 - u_matrix(i - 1) ^ 2));
           u(1, n) = u_0;
           
       end
       
       u(n_x, n + 1) = 0;
       
       u_max = linspace(1,n_x,1);
       
       for i = 1 : n_x
           
           u_max(i) = u(i,n);
           
       end
       
       n = n + 1;
       
       dt = Courant * delta_x / max(u_max);

end

plot(x, u(:, 1), '-or', x, u(:, 50), ' -*k', x, u(:, 100), ' --b');
title(['MacCormack explicit scheme for the nonlinear convection equation; C = 1.0, C = ', num2str(Courant)]);
xlim([0, 45]);
ylim([0, 12]);
xlabel('x');
ylabel('u');