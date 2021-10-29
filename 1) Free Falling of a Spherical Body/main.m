clc;
clear;


global A B C d nu h;
rho = 1540;
rho_f = 1260;
rho_ratio = rho_f / rho;
g = 9.8;
nu = 1e-3;
d = 0.01;
h = 0.01;
t_m = 0.5;

% Coefficients
A = 1  + 0.5 * rho_ratio;
B = (1 - rho_ratio) * g;
C = 3 * rho_ratio / (4 * d);


[t1, y1] = Runge_Kutta(@f, [0 t_m], [0 0]); 
[t2, y2] = ode45(@f, [0 t_m], [0 0]); 
[t3, y3] = ode23(@f, [0 t_m], [0 0]);


figure(1);
plot(t1, y1(:, 1), 'r-', t2, y2(:, 1), 'b--', t3, y3(:, 1), 'g.');
title('v(t)');
xlabel('t, s');
ylabel('v, m/s');
xlim([0 t_m]);
legend('RungeKutta','ode45', 'ode23', 'Location', 'best')

figure(2);
plot(t1, y1(:, 2), 'r-', t2, y2(:, 2), 'b--', t3, y3(:, 2), 'g.');
title('z(t)');
xlabel('t, s');
ylabel('z, m');
xlim([0 t_m]);
legend('RungeKutta','ode45', 'ode23', 'Location', 'best')