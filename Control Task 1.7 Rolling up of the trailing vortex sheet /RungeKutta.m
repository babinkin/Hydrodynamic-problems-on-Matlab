% Method Runge Kutta second order

function [t, z] = RungeKutta(F, t_interval, z0)


global h;

n = round((t_interval(2) - t_interval(1)) / h);
t = zeros(n + 1, 1);

z = zeros(n + 1, 2);

z(1, 1) = z0(1);  % x
z(1, 2) = z0(2);  % y

t(1) = t_interval(1);

for i = 1 : n
    
   t(i + 1) = t(i) + h;
   
   temp = F(t(i), [z(i, 1), z(i, 2)]);
   delta1x = h * temp(1);
   delta1y = h * temp(2);
   
   temp = F(t(i), [z(i, 1) + delta1x / 2 , z(i, 2) + delta1y / 2]);
   delta2x = h * temp(1);
   delta2y = h * temp(2);
   
   temp = F(t(i), [z(i, 1) + delta2x / 2 , z(i, 2) + delta2y / 2]);
   delta3x = h * temp(1);
   delta3y = h * temp(2);
    
   temp = F(t(i), [z(i, 1) + delta3x, z(i, 2) + delta3y]);
   delta4x = h * temp(1);
   delta4y = h * temp(2);
   
  deltax = (delta1x + 2 * delta2x + 2 *delta3x + delta4x) / 6;
  deltay = (delta1y + 2 * delta2y + 2 *delta3y + delta4y) / 6;
  
   z(i + 1, 1) = z(i, 1) + deltax;
   z(i + 1, 2) = z(i, 2) + deltay;
   
end

end