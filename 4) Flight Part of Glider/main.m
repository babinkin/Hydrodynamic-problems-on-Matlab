clc;
clear;

global m_p_0;

g = 9.8;                  % gravitational acceleration
rho = 1.23;             % air density
A = 0.1;                 % max cross-sectional area
m_c = 500 / g;        % mass of rocket casing
V_e = 360;             % exhaust speed
C_d = 0.15;            % drag coefficient
m_p_0 = 1000 / g;   % initial mass of the propellant at t = 0