clc;
clear;

global m n k h error_max j_first;

m = 25;
n = 9;
k = 200;
h = 0.25;
error_max = 1e-3;
ksi = 0.5;

j_first = zeros(m, 1);

for i = 1 : m
    
    j_first(i) = 2;
    
    if i >= 11 && i <= 15
        
        j_first(i) = 5;
        
    end
    
end

j_first(10) = 4;
j_first(13) = 6;
j_first(16) = 4;

x = zeros(m, 1);
x(1) = 0;

for i = 2 : m
    
    x(i) = x(i - 1) + h;
    
end

y = zeros(n, 1);
y(1) = 0;

for j = 2 : n
    
    y(j) = y(j - 1) + h;
    
end


psi = liebmannScheme(ksi);

psi_a = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

figure(1)
hold on;

for i = 1 : length(psi_a)
    
    [x_intersection, y_intersection, num_intersections]= SEARCH2(x, y,psi, psi_a(i));
    
    plot(x_intersection(1:num_intersections), y_intersection(1:num_intersections), 'o');
    plot(x_intersection(1:num_intersections), -y_intersection(1:num_intersections), 'o');
    
end

hold off;
title('Chanel flow past a circular cylinder');
xlabel('X');
ylabel('Y');
legend([repmat('\Psi = ', length(psi_a), 1), num2str(psi_a(:))]);
