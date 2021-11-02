clc;
clear;

global rho_ratio d nu g h;

rho_f = 1.22 ; %воздух
rho = 8000; % сталь
rho_ratio = rho_f / rho;

h = 0.1;
d = 0.05;
nu = 1.49e-5;
g = 9.8;
t0 = 0;
tmax = 10;

tetta = 30 * pi / 180; %45, 60
w0 = 50; %начальная скорость

w0_u = w0 * cos(tetta);
w0_v = w0 * sin(tetta);

[t1, z1] = RungeKutta(@F1, @F2, [t0 tmax], [0 0 w0_u w0_v]);
[t2, z2] = ode45(@ode_func, [t0 tmax], [0 0 w0_u w0_v]);

x1 = z1(:, 1);
y1 = z1(:, 2);
x2 = z2(:, 1);
y2 = z2(:, 2);

figure(1)
plot(t1, z1, 'r --', t2, z2, 'b-');
title('y(x)');
xlabel('x');
ylabel('y');
xlim([0 300]);
ylim([0 100]);
legend('RungeKutta2d', 'ode45', 'Location', 'best');