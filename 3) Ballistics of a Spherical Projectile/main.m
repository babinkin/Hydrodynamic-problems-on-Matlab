clc;
clear;

global rho_ratio d nu g h Uf Vf w0;

rho_f = 1.22 ; %1.22 для воздуха, 0 для вакуума  
rho = 8000; % сталь
rho_ratio = rho_f / rho;

h = 0.1;
d = 0.05;
nu = 1.49e-5;
g = 9.8;
t0 = 0;
tmax = 100; % до момента падения снаряда на землю

tetta30 = 30 * pi / 180; % угол между начальной скоростью и OX
w0 = 50; %начальная скорость

w0_u30 = w0 * cos(tetta30);
w0_v30 = w0 * sin(tetta30);

Uf = 0;
Vf = 0;

%Расчёт для тетта = 30
[t1, z1] = RungeKutta(@F, [t0 tmax], [0 0 w0_u30 w0_v30]);
x1 = z1(:, 1);
y1 = z1(:, 2);
U1 =  z1(:, 3);
V1 =  z1(:, 4);



%Расчёт для тетта = 45
tetta45 = 45 * pi / 180; 
w0_u45 = w0 * cos(tetta45);
w0_v45 = w0 * sin(tetta45);

[t2, z2] = RungeKutta(@F, [t0 tmax], [0 0 w0_u45 w0_v45]);
x2 = z2(:, 1);
y2 = z2(:, 2);
U2 =  z2(:, 3);
V2 =  z2(:, 4);


%Расчёт для тетта = 60
tetta60 = 60 * pi / 180; 
w0_u60 = w0 * cos(tetta60);
w0_v60 = w0 * sin(tetta60);

[t3, z3] = RungeKutta(@F, [t0 tmax], [0 0 w0_u60 w0_v60]);
x3 = z3(:, 1);
y3 = z3(:, 2);
U3 =  z3(:, 3);
V3 =  z3(:, 4);



figure(1)
 plot(x1, y1, 'r -',x2, y2, 'b -',x3, y3, 'g -');
title('y(x)');
xlabel('x');
ylabel('y');
xlim([0 300]);
ylim([0 100]);
legend('tetta = 30','tetta = 45','tetta = 60', 'Location', 'best');