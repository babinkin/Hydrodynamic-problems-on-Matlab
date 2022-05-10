clc;
clear;

global h n q_0;

n = 100; % размер векторов
eta_max = 10;
h = eta_max / n; % шаг
q_0 = 0.3320572; % f''(0)

% Метод Рунге-Кутты
[eta, f, p, q] = RungeKutta();

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
