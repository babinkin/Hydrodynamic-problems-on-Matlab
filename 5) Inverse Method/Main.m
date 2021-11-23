clc;
clear;

global m n delta_y epsilon L;

epsilon = 1e-6;

delta_x = 0.1;
delta_y = 0.1;

x = (-3 : delta_x : 3);
y = (-2 : delta_y : 2);


m = length(x);
n = length(y);

L = 1;

psi = zeros(m,n);


for i = 1 : m
    
    for j = 1 : n
        
        %psi(i, j) = F(x(i), y(j), '5 Doublets, egg-shaped body parallel to OX');
        %psi(i, j) = F(x(i), y(j), '5 Doublets egg-shaped body at an angle a = 30 degrees');
        %psi(i, j) = F(x(i), y(j),  'A uniform stream and a source');
        %psi(i, j) = F(x(i), y(j),  'A uniform stream and a sink');
        %psi(i, j) = F(x(i), y(j),  'A source on the negative x-axis and a doublet at the origin of the coordinate system');
        %psi(i, j) = F(x(i), y(j), 'A horizontal uniform stream and two doublets of equal strengths on the x-axis separated by a distance d');
        %psi(i, j) = F(x(i), y(j), 'Combination of a vortex of circulation G and symmetry vortex');
        %psi(i, j) = F(x(i), y(j), 'Uniform stream, doublet and its image with respect y =0');
        
    end
    
end


hold on;
markers = ['d', 'o', 's', 'v', '^'];

centers = [-1, -0.5, 0, 0.5, 1];

for i = 1 : length(centers)
    
    psi_a = centers(i);
    
    [x_intersection, y_intersection, num_intersections] = SEARCH(x, y, psi, psi_a);
    
    plot(x_intersection(1 : num_intersections),y_intersection(1 : num_intersections), markers(i), 'MarkerSize' , 2)
    
    
    
end