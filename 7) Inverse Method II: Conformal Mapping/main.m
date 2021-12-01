clc;
clear;

global m n epsilon delta_y;

U = 1;             % Flow velocity, m/s 
a = 1;              % Сircle radius, which on the (x1,y1) coordinate plane, m
b = 0.8;           % Сircle radius, which on the (x2,y2) coordinate plane, m
y1_p = 0.199;  % For point P, m

delta_x = 0.1;
delta_y = 0.1;

x = (-3 : delta_x : 3);
y = (-2.5 : delta_y : 2.5);

m = length(x);
n = length(y);
epsilon = 1e-6;


z = zeros(m, n);
psi = zeros(m,n);
z1 = zeros(m, n);
z2 = zeros(m, n);


x1_p = b - sqrt(a ^ 2 - y1_p ^ 2);
z1_p = x1_p + 1i * y1_p;

for i = 1 : m
    
    for j = 1 : n
        
        z(i, j) = x(i) + 1i * y(j);
        z1(i, j) = (sqrt(z(i, j) ^ 2 - 4 * b ^ 2) + z(i, j)) / 2;
        z2(i, j) = z1(i, j) - z1_p;
        psi(i, j) = 2 * y1_p * log(z2(i, j) / a);
        
    end
    
end


centers = [-1, -0.5, 0, 0.5, 1];

for i = 1 : length(centers)
    
    psi_a = centers(i);
    
    [x_intersection, y_intersection, num_intersections] = SEARCH(x, y, psi, psi_a);
    
end

