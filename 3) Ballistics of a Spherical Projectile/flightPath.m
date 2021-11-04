function [T, X, Y, U, V] = flightPath(T0, X0, Y0, U0, V0)

global h;
i = 1;

T(i) = T0;
X(i) = X0;
Y(i) = Y0;
U(i) = U0;
V(i) = V0;

while Y(i) >= 0
    
[t, y] = RungeKutta(@F, [T(i), T(i) + h], [X(i), Y(i), U(i), V(i)]);
i = i + 1;

T(i) = t(end);
X(i) = y(end, 1);
Y(i) = y(end, 2);
U(i) = y(end, 3);
V(i) = y(end, 4);


end


end


