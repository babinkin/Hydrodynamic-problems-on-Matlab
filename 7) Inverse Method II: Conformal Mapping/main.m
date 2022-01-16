clc;
clear;

global m n k delta_y1 a b z1_p ;

U = 1;             % Flow velocity, m/s 
a = 1;              % Сircle radius, which on the (x1,y1) coordinate plane, m
b = 0.8;           % Сircle radius, which on the (x2,y2) coordinate plane, m

y1_p = 0.199; % For point P, m

x_max = 3.5;
x_min = -3.5;

y_max = 3;
y_min = -3;

x1_max = 3.5;
x1_min = -3.5;

y1_max = 3;
y1_min = -3;

delta_x1 = 0.05;
delta_y1 = 0.05;

m = (x1_max - x1_min) / delta_x1 + 1;
n = (y1_max - y1_min) / delta_y1 + 1;
k = 200;

x = zeros(k, 1);
y = zeros(k, 2);
psi = zeros(m, n);
psi_a = zeros(10, 1);
psi_a(1) = -2;
phi = zeros(k, 1);
c_p = zeros(k, 1);

x1_p = b - sqrt(a ^ 2 - y1_p ^ 2);
z1_p = x1_p + i * y1_p;


x1 = zeros(m, 1);
x1(1) = x1_min;

for  i = 2 : m
    
    x1(i) = x1(i - 1) + delta_y1;
    
end

y1 = zeros(n, 1);
y1(1) = y1_min;

for i = 2 : n
    
    y1(i) = y1(i - 1) + delta_y1;
    
end


for i = 1 : m
    
    for j = 1 : n
        
        z1 = x1(i) + 1i * y1(j);
        z2 = z1 - z1_p;
        psi(i,j) = U * imag(z2 + a ^ 2 / z2 + 1i * 2 * y1_p * log(z2 / a));
        
    end
    
end


[x_intersection, y_intersection, num_intersections] = SEARCH(x1, y1, psi, psi_a(1));

[x_mapping, y_mapping, num_mapping] = MAPPING(x_intersection, y_intersection, num_intersections, x_min, x_max, y_min, y_max);


figure(1);
plot(x_mapping(1 : num_mapping), y_mapping(1 : num_mapping), '.b');
xlim([x_min, x_max]);
ylim([y_min, y_max]);
title('Flow around a Joukowski airfoil');
xlabel('X-AXIS');
ylabel('Y-AXIS');



hold on;

for i = 2 : length(psi_a)
    
    psi_a(i) = psi_a(i - 1) + 0.5;
    
    [x_intersection, y_intersection, num_intersections] = SEARCH(x1, y1, psi, psi_a(i));
    
    [x_mapping, y_mapping, num_mapping] = MAPPING(x_intersection, y_intersection, num_intersections, x_min, x_max, y_min, y_max);
    
    plot(x_mapping(1 : num_mapping), y_mapping(1 : num_mapping), '.b');
    
end

hold off;



d_phi = pi / 100;

for i = 1 : k
    
    if i > 1
        
        phi(i) = phi(i - 1) + d_phi;
        
    else
        
        phi(i) = 0;
        
    end

    z2 = a * exp(1i * phi(i));
    z1 = z2 + z1_p;
    
    z = z1 + b ^ 2 / z1;
    
    x(i) = real(z);
    y(i) = imag(z);
    
    V = U * abs((1 - (a / z2) ^ 2 + 1i * 2 * y1_p / z2) / (1 - (b / z1) ^ 2));
    c_p(i) = 1 - (V / U) ^ 2;
    
end


figure(2);
plot(x, c_p, '.b');
xlim([-1.7, 1.6]);
ylim([-2.1, 1]);
title('Pressure distribution');
xlabel('X-AXIS');
ylabel('CP: Pressure coefficient');