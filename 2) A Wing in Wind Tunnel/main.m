clc;
clear;

global  rho_f m k g S alpha_0 betta  a omega t_max h U0;

rho_f = 1.22;
m = 3;
k = 980;
g = 9.8;
S = 0.3;
a = 0.2;
omega = 0.5;
alpha_0 = 10 * pi / 180;
betta = (rho_f * g * S ) / (2 * k);
t_max = 20;
h = 0.1;
U0 = 100;

[t1, y1] = Runge_Kutta(@f, [0 t_max], [0 0]);
[t2, y2] = ode45(@f, [0 t_max], [0 0]); 


z1 = y1(:, 1);
v1 = y1(:, 2);
z2 = y2(:, 1);
v2 = y2(:, 2);



figure(1);
plot(t1, z1, 'r--', t2, z2, 'b-');
title('Z(T)');
xlabel('T');
ylabel('Z');
xlim([0 20]);
legend('RungeKutta', 'ode45', 'Location', 'best');

