clc;
clear;

global m n h;

h = 0.05; % Шаг по пространству
m = 1 / h + 1; % Количество вертикальных линий расчетной сетки
n = 1 / h + 1; % Количество горизонтальных линий расчетной сетки

u = zeros(m, m + 1); % Скорость

% Граничные условия для конечно-разностной схемы:
for i = 1 : m
    
    u(i, 1) = 0;
    
    for j = 1 : n
        
        u(1, j) = 0;
        u(m, j) = 0;
        
    end
    
end


for i = 2 : m - 1
    
    for j = 2 : n
        
        u(i, j) = 0.04;
        
    end
    
end

error = 1; % невязка

alpha = cos(pi / m) + cos(pi / n);
omega = (8 - 4 *sqrt(4 - alpha ^ 2)) / alpha ^ 2; % Оптимальное значение параметра релаксации

while (error > 0.001)
    
    error = 0;
    
    for i = 2 : m - 1
        
        for j = 2 : n
            
            u_old = u(i, j);
            
            if (j == n)
                
                u(i, j + 1) = u(i, j - 1);
                
            end
            
            u(i, j) = (1 - omega) * u(i, j) + omega / 4 *(h ^ 2 + u(i - 1, j) + u(i + 1, j) + u(i, j - 1) + u(i, j + 1));
            error = error + abs(u(i, j) - u_old);
            
        end
        
    end
    
end

volume_rate = 0;

for i = 2 : m - 1
    
    for j = 2 : n - 1
        
        volume_rate = volume_rate + u(i, j) * h ^ 2;
        
    end
    
end

for i = 2 : m - 1
    
    volume_rate = volume_rate + (u(i, 1) + u(i, n)) * h ^ 2 / 2;
    
    for j = 2 : n - 1
        
        volume_rate = volume_rate + (u(1, j) + u(m, j)) * h ^ 2 / 2;
        
    end
    
end

volume_rate = volume_rate + (u(1, 1) + u(1, n) + u(m, 1) + u(m, n)) * h ^ 2 / 4;


X = zeros(m);
Y = zeros(m);

X(1) = 0;
Y(1) = 0;

for i = 2 : m
    
    X(i) = X(i - 1) + h;
    
end

for j = 2 : n
    
    Y(j) = Y(j - 1) + h;
    
end

const = [0; 0.018; 0.036; 0.054; 0.072; 0.090; 0.108]; % Отметки скоростей
marks = ['x', 'o', 's', 'd', 'v', '^', '+']; % Обозначения на графике

figure(1)
hold on;
for i = 1 : length(const)
    
    [x, y, z] = SEARCH(X, Y, u, const(i));
    plot(x(1 : z), y(1 : z), marks(i))
    
end
hold off;

title('Velocity distribution across an open channel of square cross section')
xlabel('x')
ylabel('y')
legend(['v = ' num2str(const(1))],['v = ' num2str(const(2))],['v = ' num2str(const(3))],['v = ' num2str(const(4))],['v = ' num2str(const(5))],['v = ' num2str(const(6))],['v = ' num2str(const(7))])
axis([0 1 0 1]);
set(gca,'YTick',[0 1])
set(gca,'XTick',[0 1])
box on;
