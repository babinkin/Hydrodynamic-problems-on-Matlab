clc;
clear;

m = 21; % количество интервалов разбиения пространства между пластинами
h = 0.05; % длина одного интервала разбиения
R = 0.25; % безразмерный параметр, регулирующий устойчивость вычислительной схемы, Problem 3.8: R > 0.5
nu = 1e-6; % кинематическая вязкость для воды
tau = (R * h ^ 2) / nu; % шаг по времени
U_0 = 1.0; % скорость движения верхней пластины
t_max = 125000; % Верхняя граница времени расчета
omega = 0.001; % Частота колебания

U_old = zeros(m,1);  % U[i][j]
U_new = zeros(m,1); % U[i][j + 1]

y = zeros(m,1); % узлы интервалов разбиения

% Заполняем массив y
for i = 2 : m - 1
    
    y(i) = y(i - 1) + h;
    
end

% Начальное условие
for i = 1 : m - 1
    
    U_old(i) = 0;
    
end

U_old(m) = U_0;


control_point = 1; 

marks = '+osdv'; % обозначения на графиках
t_legend = zeros(5, 1); % значения в точке в пяти разных временных отметках
time_point = 1;

hold on;
for t = tau : tau : t_max 
    
    control_point = control_point + 1;
    
    for i = 2 : m - 1
        
        U_new(i) = U_old(i) + R * (U_old(i - 1) - 2 * U_old(i) + U_old(i + 1)); % Явный метод решения параболического уравнения
        
    end
    
   % U_old(m) = U_0 * sin(omega * t); %Problem 3.10
    U_old(1 : m - 1) = U_new(1 : m - 1);
    
    if(time_point <= 5 && mod(control_point - 1, 40) == 0)
       
       plot(U_old, y, marks(time_point));
       t_legend(time_point) = t;
       time_point = time_point + 1;
       
    end
      
end
hold off;


title('Velocity distribution at different times (in seconds)')
xlabel('Velocity (m/s)')
ylabel('Height (m)')
box on;
grid on;
set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1])
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])
axis([0 1 0 1]);
legend(['T = ' num2str(t_legend(1))],['T = ' num2str(t_legend(2))],['T = ' num2str(t_legend(3))],['T = ' num2str(t_legend(4))],['T = ' num2str(t_legend(5))])


