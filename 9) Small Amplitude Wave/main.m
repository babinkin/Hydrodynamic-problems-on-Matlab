clc;
clear;

a = 340;
m = 51;
n = 116;
h = 0.02;
tau = h / a;

x = zeros(m, 1);
x(1) = 0;

for i = 2 : m
    
    x(i) = x(i - 1) + h;
    
end

f = zeros(m, 1);
g = zeros(m, 1);

for i = 1 : m
    
    f(i) = 0;
    g(i) = 0;
    
    if i >= 11 && i <= 31
        
        f(i) = sin(5 * pi *((i - 1) * h - 0.2));
        
    end
    
end

u = zeros(m, n);

for i = 1 : m
    
    u(i, 1) = f(i);
    
end

for j = 2 : n
    
    u(1, j) = 0;
    
end


for i = 2 : m - 1
    
    u(i, 2) = (f(i - 1) + f(i + 1)) / 2 + tau * g(i);
    
end

u(m, 2) = f(m - 1) + tau * g(m);


% Leapfrog scheme
for j = 2 : n - 1
    
    for i = 2 : m - 1
        
        u(i, j + 1) = u(i - 1, j) + u(i + 1, j) - u(i, j - 1);
        
    end
    
    u(m, j + 1) = 2 * u(m - 1, j) - u(m, j - 1);
    
end

iter = 1;

for i = 1 : 5 : n

    subplot(6, 4, iter);
    plot(x, u(:,i));
    xlim([0, 1]);
    ylim([-1, 1]);
    title(['Time = ', int2str(i - 1), ' \cdot \tau = ', num2str((i - 1) * tau),  ' seconds']);

    iter = iter + 1;
    
end
