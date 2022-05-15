clc;
clear;

global h n q_0;

n = 100; % размер векторов
eta_max = 10;
h = eta_max / n; % шаг
q_0 = 0.3320572; % f''(0)

% Метод Рунге-Кутты
[eta, f, p, q] = RungeKutta();

figure(1)
for i = 1 : 3
    
    theta = TRID(f, q, i);
    
    plot(eta, theta, '-')
    hold on

end

title('Temperature Profiles')
legend('water' ,'air' ,'mercury')
xlabel('ETA');
ylabel('THETA');
grid on;

% Problem 3.4
figure(2)
for i = 1 : 3
    
    theta = TRID(f, q, i);
    H = theta + p.*p - 1; % Общая энергия в погран.слое
    plot(eta, H, '-')
    hold on

end

title('Problem 3.4')
legend('water' ,'air' ,'mercury')
xlabel('ETA');
ylabel('H');
grid on;

% Problem 3.5

R_a = 2;
R_min = 1; 
R_max = R_a;

n = 50;
h = (R_max - R_min) / n; 

R = zeros(n, 1);
V_exac = zeros(n, 1);
C = zeros(n, 4);

A = @(R) 1 / R;
B = @(R) - 1 / (R * R);
D = @(R) 0;

for i = 1 : n
    
    R(i) = R_min + i * h;
    
    C(i, 1) = 1 - h * A(R(i)) / 2;
    C(i, 2) = - 2 + h ^ 2 * B(R(i));
    C(i, 3) = 1 + 0.5 * h * A(R(i));
    C(i, 4) = h ^ 2 * D(R(i));
    
end

% Calculation of the exact solution
for i = 1 : n
    
    V_exac(i) =  R_a / (1 + R_a ^ 2) * (R(i) / R_a + R_a / R(i));

end

V_left = 1;
V_right = 0.8;

%Simplification
C(1, 4) = C(1, 4) - C(1, 1) * V_left;
C(n, 4) = C(n, 4) - C(n, 3) * V_right;
C(1, 1) = 0;
C(n, 3) = 0;

% Approximate calculation
V = Gauss(C, n);

% Calculation errors
V_error = round(abs(V - V_exac) / 100, 3);

disp('Error by U:');
disp(V_error);

figure(3);
plot(R, V, ' - or', R, V_exac, ' - b');
title('Problem 3.5');
xlabel('R');
ylabel('U');
legend('Approximate solution','Exact solution', 'Location', 'best')




