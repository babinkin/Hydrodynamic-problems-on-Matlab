function [t, y] = RungeKutta(F, t_interval, y0)


global h;

t = zeros();

y(:, 1) = y0.';
t(1) = t_interval(1);
n = round((t_interval(2) - t_interval(1)) / h);

for i = 1 : n
    
   t(i + 1) = t(i) + h;
   delta1 = h * F(t(i), y(:, i));
   
   temp = y(:, i) + delta1 / 2;
   delta2 = h * F(t(i), temp);
   
   temp = y(:, i) + delta2 / 2;
   delta3 = h * F(t(i), temp);
    
   temp = y(:, i) + delta3;
   delta4 = h * F(t(i), temp);
   
  delta = (delta1 + 2 * delta2 + 2 * delta3 + delta4) / 6;
  y(:, i + 1) = y(:, i) + delta; 
  
end



end