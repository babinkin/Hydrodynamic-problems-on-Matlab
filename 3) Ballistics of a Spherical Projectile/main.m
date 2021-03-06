clc;
clear;

global rho d nu g h Uf Vf w0; %rho for 1.8; rho_ratio for other

rho_f = 1.22 ; %1.22 air, 0 for vacuum
rho = 8000; % steel
%rho_ratio = rho_f / rho;

h = 0.1;
d = 0.3; % 0.05, 0.01, 0.09, 0.3
nu = 1.49e-5;
g = 9.8;
t0 = 0;
w0 = 800; %initial velocity; 50, for 1.8: 800
Uf = 20; % 0, 20, -20 wind velocity
Vf = 0;


%Calculation for tetta = 30
 tetta30 = 30 * pi / 180; % угол между начальной скоростью и OX
 w0_u30 = w0 * cos(tetta30);
 w0_v30 = w0 * sin(tetta30);

 [t1, x1, y1, U1, V1] = flightPath(t0, 0, 0, w0_u30, w0_v30);


 %Calculation for tetta  = 45
tetta45 = 45 * pi / 180; 
w0_u45 = w0 * cos(tetta45);
w0_v45 = w0 * sin(tetta45);

 [t2, x2, y2, U2, V2] = flightPath(t0, 0, 0, w0_u45, w0_v45);


%Calculation for tetta = 60
tetta60 = 60 * pi / 180; 
w0_u60 = w0 * cos(tetta60);
w0_v60 = w0 * sin(tetta60);

 [t3, x3, y3, U3, V3] = flightPath(t0, 0, 0, w0_u60, w0_v60);


 %Вывод траектории полёта
figure(1)
 plot(x1, y1, 'r -',x2, y2, 'b -',x3, y3, 'g -');
title('y(x)');
xlabel('x');
ylabel('y');
xlim([0 14000]); %300, for 1.8: 14000
ylim([-10 10000]); %100, for 1.8: 10000
legend('tetta = 30','tetta = 45','tetta = 60', 'Location', 'best');


%Вывод дальности полёта
disp('Дальность полёта при tetta = 30:');
x_r_30 = Find_Range(t0, 0, 0, w0_u30, w0_v30);
disp(x_r_30);

disp('Дальность полёта при tetta = 45:');
x_r_45 = Find_Range(t0, 0, 0, w0_u45, w0_v45);
disp(x_r_45);

disp('Дальность полёта при tetta = 60:');
x_r_60 =Find_Range(t0, 0, 0, w0_u60, w0_v60);
disp(x_r_60);


%Вывод максимальной дальности полёта
[x_r_max, theta_optimal] = HalfIntervalMethod(t0,1e-5);
disp('Максимальная дальность полёта:');
disp(x_r_max);

%Вывод оптимального угла
disp('Достигается при угле tetta ');
disp(theta_optimal);
