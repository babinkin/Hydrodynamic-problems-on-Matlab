clc;
clear;

global a m G0;

a = 1;                          % Width of the vortex sheet
m = 40;                       % Number of discrete point vortices
G0 = 1038;                % Initialy Circulation, m^2/s

dT = 1 / (25 * m);          % Time step restriction

x0 = zeros(1, m);
x0(1) = -a +  a / m;

for i = 2 : m
    
    x0(i) = x0(i - 1) + 2 * a / m;
    
end