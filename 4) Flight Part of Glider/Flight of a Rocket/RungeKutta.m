% Runge-Kutta 4-th order function
function [t, y] = RungeKutta(f, t_interval, y0)

    global h;
    
    n = (t_interval(2) - t_interval(1)) / h;
    y = zeros(n+1, 2);
    t = zeros(n+1, 1);
    t(1) = t_interval(1);
    y(1, 1) = y0(1);
    y(1, 2) = y0(2);

for i = 1 : n
     
    t(i+1) = t(i) + h;
    
    k1 = y(i,1);
    delta1_z = h * k1;
    
    k2 = f(t(i),k1);
    delta1_v = h * k2(1);
    
    k1 = y(i,1) + 0.5 *  delta1_v;
    delta2_z = h * k1;
    
    k2 = f(t(i), k1);
    delta2_v = h * k2(1);
    
    k1 = y(i,1) + 0.5 *  delta2_v;
    delta3_z = h * k1;
    
    k2 = f(t(i), k1);
    delta3_v = h * k2(1);
    
    k1 = y(i,1) + delta3_v;
    delta4_z = h * k1;
    
    k2 = f(t(i), k1);
    delta4_v = h * k2(1);
    
    y(i + 1, 1) = y(i, 1) + (delta1_v + 2 * delta2_v + 2 * delta3_v + delta4_v) / 6;
    y(i + 1, 2) = y(i, 2) + (delta1_z + 2 * delta2_z + 2 * delta3_z + delta4_z ) / 6;
   
end

end