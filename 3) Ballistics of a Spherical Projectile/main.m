clc;
clear;

global rho_ratio d nu g h Uf Vf w0 tetta;

rho_f = 1.22 ; %воздух
rho = 8000; % сталь
rho_ratio = rho_f / rho;

h = 0.1;
d = 0.05;
nu = 1.49e-5;
g = 9.8;
t0 = 0;
tmax = 100; % до момента падения снаряда на землю

tetta = 30 * pi / 180; %45, 60
w0 = 50; %начальная скорость

w0_u = w0 * cos(tetta);
w0_v = w0 * sin(tetta);

Uf = 0;
Vf = 0;

[t1, z1] = RungeKutta(@F, [t0 tmax], [0 0 w0_u w0_v]);
%[t2, z2] = ode45(@F, [t0 tmax], [0 0 w0_u w0_v ]);

x = z1(:, 1);
y = z1(:, 2);
U =  z1(:, 3);
V =  z1(:, 4);

%x2 = z2(:, 1);
%y2 = z2(:, 2);

% figure(1)
%  plot(t1, z1, 'r --'  , t2, z2, 'b-' );
% title('y(x)');
% xlabel('x');
% ylabel('y');
% xlim([0 300]);
% ylim([0 100]);
% legend('RungeKutta2d', 'ode45', 'Location', 'best');

figure(1)
 plot(x, y, 'r --');
title('y(x)');
xlabel('x');
ylabel('y');
xlim([0 200]);
ylim([0 100]);
legend('RungeKutta2d', 'Location', 'best');