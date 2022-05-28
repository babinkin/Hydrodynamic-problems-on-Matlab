clc;
clear;

n = 20; % количество интервалов разбиения 
R = 0.4; % безразмерный параметр, регулирующий устойчивость вычислительной схемы
t_max = 1; % верхняя граница времени расчета
h = 1 / n; % шаг по пространству
tau = R * h ^ 2; % шаг по времени

W = zeros(n + 1, 1); % Безразмерная разница скоростей
u = zeros(n + 1, 1); % Скорость
u_s = zeros(n + 1, 1); % Особое решение уравнения движения, удовлетворяющее граничным условиям
y = zeros(n + 1, 1); % Безразмерная координата
C = zeros(n + 1, 4); % Коэфициенты

% Определяем y(i)
for i = 2 : n + 1
    
    y(i) = y(i - 1) + h;
    
end

% Граничные условия
for i = 1 : n + 1
    
    u_s(i) = 1 - y(i) ^ 2;
    W(i) = u_s(i);
    u(i) = 0;
    
end


time_point = 1;
t_legend = zeros(6,1);
marks = ['x', 'o', 's', 'd', 'v', '^'];

control_point = 1;

hold on;
plot(u, y, marks(time_point));
t_legend(time_point) = 0;
time_point = time_point + 1;

for t = tau : tau : t_max
    
    for i = 1 : n
        
        C(i, 1) = R;
        C(i, 2) = - 1 - 2 * R;
        C(i, 3) = R;
        C(i, 4) = - W(i);
        
    end
 
    C(1, 3) = C(1, 1) + C(1, 3);
    C(1, 1) = 0;
    C(n, 4) = C(n, 4) - C(n, 3) * W(n + 1);
    C(n, 3) = 0;
    
    control_point = control_point + 1;
    W = TRID(C, n);
    W(n+1) = 1 - y(n + 1) ^ 2;
    
    for i = 1 : n
        
        u(i) = u_s(i) - W(i);
       
    end

    
    if (mod(control_point - 1, 200) == 0 && time_point <= length(t_legend) - 1)
        
        plot(u, y, marks(time_point));
        t_legend(time_point) = t;
        time_point = time_point + 1;
        
    end
    
end

plot(u, y, marks(time_point));
hold off;

title('Velocity profiles')
box on;
grid on;
axis([0 1 0 1]);
set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Dimensionless velocity');
ylabel('Dimensionless height');
legend(['T = ' num2str(t_legend(1))],['T = ' num2str(t_legend(2))],['T = ' num2str(t_legend(3))],['T = ' num2str(t_legend(4))],['T = ' num2str(t_legend(5))],'steady state')
