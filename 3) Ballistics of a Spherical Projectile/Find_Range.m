function [max_range] = Find_Range(t0, x0, y0, u0, v0) %d, w0, epsilon  % tetta_optimal

global h;

[t, x, y, u, v] = flightPath(t0, x0, y0, u0, v0);


x_q = x(end);
y_q = y(end);


[~, Y] = ode45(@F, [t(end), t(end) -  h], [x(end), y(end), u(end), v(end)]);

x_p = Y(end, 1);
y_p = Y(end, 2);

% дальность полёта
max_range = (x_q * y_p - x_p * y_q) /(y_p - y_q);


end

