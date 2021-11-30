clc;
clear;

global m a  h;

a = 1;
m = 40;
h = 1 / (25 * m);

x0 = zeros(1, m);
x0(1) = - a + a / m;

for i = 2 : m
    
    x0(i) = x0(i - 1) + 2 * a / m;
    
end

y0 = zeros(1, m);


[t, z] = RungeKutta(@F, [0, 0.5], [x0 / a, y0 / a]);


x1 = z(1 : m, :);
y1 = z(m + 1 : 2 * m, :);

figure(1);

for i = 1 : length(z)
    
plot(x1(:, i), y1(:, i), '--o');
title(['y(x) at T =', num2str(t(i))]);
xlabel('x');
ylabel('y');
pause(0.01)

end

