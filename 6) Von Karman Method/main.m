clc;
clear;

global U;

% Non dimensional length and speed
U = 1;
a = 1;

% Discretization
n = 10;

% Initialization
r = zeros(n, 1);                     % Vector of right parts

Pj = zeros(1, n + 1);             % Points on the axis OZ
sj = zeros(1, n);                    % Lengths of segments on the axis OZ

phi_i = zeros(n - 1, 1);               % Polar coordinates phi for points on the sphere
ri = zeros(length(phi_i), 1);         % Polar coordinates r for points on the sphere
zi = zeros(length(phi_i), 1);        % Polar coordinates z for points on the sphere

u_r = zeros(length(phi_i), 1);        % Velocity components
u_z = zeros(length(phi_i), 1);       % Velocity components

V = zeros(length(phi_i), 1);        % Velocity magnitudes
c_p = zeros(length(phi_i), 1);       % Nondimensional pressure coefficients

V_exc = zeros(length(phi_i), 1);   % Exact velocity magnitudes
c_p_exc = zeros(length(phi_i), 1);  % Exact nondimensional pressure coefficients

V_error = zeros(length(phi_i), 1);     % Velocity errors
c_p_error = zeros(length(phi_i), 1);   % Nondimensional pressure coefficient errors


% Points on the axis OZ
for i = 1 : length(Pj)
    
    Pj(i) = - 0.8 * a + (i - 1) * (1.6 * a) / 10;
    
end

% Lengths of segments on the axis OZ
for j = 1 : length(sj)
    
    sj(j) = Pj(j + 1) - Pj(j);
    
end

 % Polar coordinates r, phi and z for points on the sphere
for i = 1 : length(phi_i)
    
    phi_i(i) = (10 - i) * pi / 10;
    ri(i) = a * sin(phi_i(i));
    zi(i) = a * cos(phi_i(i));
    r(i) = ri(i) ^ 2 / 2;
    
end

% Matrix of the coefficients
delta_d = delta_dij(zi, ri, Pj);
d = [delta_d; sj];

% Method of the inverse matrix of coefficients
Q = d \ r; % Q = inv(d) * r

% Velocity components
for i = 1 : length(phi_i)
    
    u_r(i) = U_r(ri(i), zi(i), Pj, Q);
    u_z(i) = U_z(ri(i), zi(i), Pj, Q);
    
end

% Approximate c_p and V
for i = 1 : length(phi_i)
   
    c_p(i) = 1 - (u_r(i) / U) ^ 2 - (u_z(i) / U) ^ 2;
    V(i) = sqrt(u_r(i) ^ 2 + u_z(i) ^ 2);
    
    
end

% Exact c_p and V
for i = 1 : length(phi_i)
   
    V_exc(i) = (3 / 2) * U * ri(i) / a;
    c_p_exc(i) = 1 - (9 / 4) * (ri(i) / a) ^ 2;
   
end

% Errors
for i = 1 : length(phi_i)
   
    V_error(i) = round(abs(V(i) - V_exc(i)), 6);
    c_p_error(i) = round(abs(c_p(i) - c_p_exc(i)), 6);
    
end

data_table = table(V,V_error,c_p,c_p_error);
disp(data_table);

figure(1);

plot(phi_i, c_p, ' - ro', phi_i, c_p_exc, ' - b.');
title('C_p(z)');
xlabel('z');
ylabel('C_p');
legend('Approximate solution','Exact solution', 'Location', 'best')

figure(2);

plot(phi_i, V, ' - ro', phi_i, V_exc, ' - b.');
title('V(z)');
xlabel('z');
ylabel ('V');
legend('Approximate solution','Exact solution', 'Location', 'best')






