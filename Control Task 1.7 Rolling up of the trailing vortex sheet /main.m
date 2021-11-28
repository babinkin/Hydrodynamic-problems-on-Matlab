clc;
clear;

global a m G0 h;

a = 1;                          % Width of the vortex sheet
m = 40;                       % Number of discrete point vortices
G0 = 1038;                  % Initialy Circulation, m^2/s


h = 1 / (25 * m);          % Time step restriction


x0 = zeros(1, m);

x0(1) = -a +  a / m;

for i = 2 : m
    
    x0(i) = x0(i - 1) + 2 * a / m;
    
end

y0 = zeros(1, m);


[t, z] = RungeKutta(@F, [0, 0.5], [x0, y0]);

x = z(1 : m, 1);
y = z(m + 1 : 2 * m, 2);





