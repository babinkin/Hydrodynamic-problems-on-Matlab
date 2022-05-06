clc;
clear;

global m epsilon q_0 dq_0 eta_max h z_max;

m = 120; % размер векторов
epsilon = 1e-6; % точность решения
q_0 = 1; % предпалагаем
dq_0 = 0.2; % предпалагаем, > 0
eta_max = 10;  % ограничение на eta
h = 0.1; % шаг
n = 120; % количество точек v на графике
v = zeros(m, 1); % безразмерная компонента скорости 



% Комбинация метода Рунге-Кутты и метода полуинтервалов
[iter, eta, f, p] = RungeKutta(); 

disp(['Number of Runge-Kutta iterations : ' num2str(iter)])

for i = 1 : n
    
    v(i) = 0.5 * (eta(i) * p(i) - f(i));
    
end

figure(1)
plot(p, eta, 'o', v, eta, '+')
title('Distribution of dimensionless velocity components: Runge-Kutta')
legend('u-component','v-component')
xlabel('Dimensionless velocity');
ylabel('ETA');
grid on;
axis([0 1 0 5]);
set(gca,'ytick',[1, 2, 3, 4, 5]);
axis square



% Модификация этого метода

v = zeros(m, 1); % безразмерная компонента скорости 

z_max = 4;

[iter, f, p, z] = ModifiedRungeKutta(); 

k = sqrt(max(p));
f1 = f / k;
p1 = p / (k ^ 2);
eta = z * k;

disp(['Number of Modified Runge-Kutta iterations :' num2str(iter)])

for i = 1 : n
    
    v(i) = 0.5 * (eta(i) * p1(i) - f1(i));
    
end

figure(2)
plot(p1, eta, 'o', v, eta, '+')
title('Distribution of dimensionless velocity components: Problem 3.1')
legend('u-component','v-component')
xlabel('Dimensionless velocity');
ylabel('ETA');
grid on;
axis([0 1 0 5]);
set(gca,'ytick',[1, 2, 3, 4, 5]);
axis square

   
% Falkner and Skan

v = zeros(m, 1); % безразмерная компонента скорости 
q_0 = 1; % предпалагаем
dq_0 = 0.2; % предпалагаем, > 0

m_p = 0.5; %0, 0.5, 1, -0.05, -0.09
beta = 2 * m_p / (m_p + 1);

[iter, eta, f, p] = FalknerScan(beta); 

disp(['Number of Falkner and Skan method iterations :' num2str(iter)])

for i = 1 : n
    
    v(i) = 0.5 * (eta(i) * p(i) - f(i));
    
end

figure(3)
plot(p, eta, 'o', v, eta, '+')
title('Distribution of dimensionless velocity components: Falkner and Skan method')
legend('u-component','v-component')
xlabel('Dimensionless velocity');
ylabel('ETA');
grid on;
axis([0 5 0 5]);
set(gca,'ytick',[1, 2, 3, 4, 5]);
axis square
