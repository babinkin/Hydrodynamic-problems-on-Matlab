clc;
clear;

global m_p_0 m_c h g rho A V_e C_d;

g = 9.8;                  % gravitational acceleration
rho = 1.23;             % air density
A = 0.1;                 % max cross-sectional area
m_c = 500 / g;        % mass of rocket casing
V_e = 360;             % exhaust speed
C_d = 0.15;            % drag coefficient
m_p_0 = 1000 / g;   % initial mass of the propellant at t = 0
h = 0.1;                  % delta t
tm = 7;

[t1, z1] = RungeKutta(@f, [0 tm], [5000 0]);

[t2, z2] = ode45(@f, [0 tm], [5000 0]); 

figure(1);
plot(t1, z1(:, 1), 'r-', t2, z2(:, 1), 'b--');
title('v(t)');
xlabel('t, s');
ylabel('v, m/s');
legend('RungeKutta','ode45', 'Location', 'best')

figure(2);
plot(t1, z1(:, 2), 'r-', t2, z2(:, 2), 'b--');
title('z(t)');
xlabel('t, s');
ylabel('z, m');
legend('RungeKutta','ode45', 'Location', 'best')


