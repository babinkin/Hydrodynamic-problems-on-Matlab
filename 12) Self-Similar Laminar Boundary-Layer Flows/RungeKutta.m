% Runge-Kutta 4-th order function
function [t, y] = RungeKutta(t_interval, y0)

    global h;
    
    n = (t_interval(2) - t_interval(1)) / h;
   
    y = zeros(n + 1, 3);
    t = zeros(n + 1, 1);
    
    t(1) = t_interval(1);
    
    y(1, 1) = y0(1); % f
    y(1, 2) = y0(2); % p
    y(1, 3) = y0(3); % q

for i = 1 : n
     
    t(i + 1) = t(i) + h;
    
    k1 = y(i, 2);
    delta1_f = h * k1;
    
    k2 = y(i, 3);
    delta1_p = h * k2;
    
    k3 = y(i, 1) * y(i, 3);
    delta1_q = - 0.5 * h * k3;
    
    k1 = y(i, 2) + 0.5 *  delta1_p;
    delta2_f = h * k1;
    
    k2 = y(i, 3) + 0.5 *  delta1_q;
    delta2_p = h * k2;
    
    k3 = (y(i, 1) + 0.5 *  delta1_f) * (y(i, 3) + 0.5 *  delta1_q);
    delta2_q = - 0.5 * h * k3;
    
    k1 = y(i, 2) + 0.5 *  delta2_p;
    delta3_f = h * k1;
    
    k2 = y(i, 3) + 0.5 *  delta2_q;
    delta3_p = h * k2;
    
    k3 = (y(i, 1) + 0.5 *  delta2_f) * (y(i, 3) + 0.5 *  delta2_q);
    delta3_q = - 0.5 * h * k3;
    
    k1 = y(i, 2) + delta3_p;
    delta4_f = h * k1;
    
    k2 = y(i,1) + delta3_v;
    delta4_p = h * k2;
    
    k3 = f(t(i), k1);
    delta4_q = h * k3(1);
    
    y(i + 1, 1) = y(i, 1) + (delta1_q + 2 * delta2_v + 2 * delta3_v + delta4_v) / 6;
    y(i + 1, 2) = y(i, 2) + (delta1_f + 2 * delta2_z + 2 * delta3_z + delta4_z ) / 6;
   
end

end