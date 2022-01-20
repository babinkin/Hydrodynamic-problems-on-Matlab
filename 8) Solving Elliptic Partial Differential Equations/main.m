clc;
clear;

global h m n k psi_0 error_max;

h = 0.25;
m = 25;
n = 17;
k = 100;
error_max = 1e-3;

x_max = 3;
x_min = -3;

y_max = 2;
y_min = -2;

ksi = zeros(m, n);
ksi_0 = 100;

psi_0 = 1;
psi_a = [0.05, 0.2, 0.5, 1, 1.5];

x = (x_min : h : x_max);
y = (y_min : h : y_max);

x0 = 1;
y0 = 1;

x0_vortex = (x0 - x_min) / h + 1;
y0_vortex = (y0 - y_min) / h + 1;

ksi(x0_vortex,y0_vortex) = ksi_0;

for i = 1:m
    
    for j = 1:n
        
        ksi(i,j) = 0;
        
    end
    
end

x_vortex = (x0 - x_min) / h + 1;
y_vortex = (y0 - y_min) / h + 1;

ksi(x_vortex,y_vortex) = ksi_0;

% psi = liebmannScheme(ksi);
% psi = richardsonScheme(ksi);
psi = successiveOverrelaxation(ksi);

markers_psi_a = ['o', '+', '*', '.', 'x', '_'];

hold on;

for i = 1 : length(psi_a)
    
   [x_intersection, y_intersection, num_intersections] = SEARCH2(x, y, psi, psi_a(i));
    
   plot(x_intersection(1 : num_intersections), y_intersection(1 : num_intersections), markers_psi_a(i));
    
end

hold off;

title('Streamlines of a vortex bounded by a rectangular wall');
xlabel('X');
ylabel('Y');
legend([repmat('\Psi = ', length(psi_a), 1), num2str(psi_a(:))]);