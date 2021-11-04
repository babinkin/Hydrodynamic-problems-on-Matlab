function [t, z] = RungeKutta(F, t_interval, z0)  

% z - матрица, где 1 столбец - x; 2 столбец - y; 3 столбец - U; 4 столбец - V
% t_interval = [t0, t_end]
% z0 = [x0, y0, U0, V0]
% F1(z,t); F2(z,t), z = (x, y, U, V)

    global h;
    
    n = round((t_interval(2) - t_interval(1)) / h);
    z = zeros(n+1, 4);
    t = zeros(n+1, 1);
   
    t(1) = t_interval(1);
    z(1, 1) = z0(1);
    z(1, 2) = z0(2);
    z(1, 3) = z0(3);
    z(1, 4) = z0(4);


for i = 1 : n
    
     t(i + 1) = t(i) + h;
     
     tempx = z(i, 3);
     delta1x = h *  tempx;
     
     tempy = z(i, 4);
     delta1y = h * tempy;
     
     tempU = F([z(i, 1), z(i, 2), tempx, tempy], t(i));
     delta1U = h * tempU(3);
     
     tempV = F([z(i, 1), z(i, 2), tempx, tempy], t(i));
     delta1V = h * tempV(4);
    
     tempx = z(i, 3) + 0.5 * delta1U;
     delta2x = h * tempx;
     
     tempy = z(i, 4) + 0.5 * delta1V;
     delta2y = h * tempy;
     
     tempU = F([z(i, 1) + 0.5 * delta1x ,z(i, 2) + 0.5 * delta1y, tempx, tempy], t(i));
     delta2U = h * tempU(3);
     
     tempV = F([z(i, 1) + 0.5 * delta1x ,z(i, 2) + 0.5 * delta1y, tempx, tempy], t(i));
     delta2V = h * tempV(4);
     
     tempx = z(i, 3) + 0.5 * delta2U;
     delta3x = h * tempx;
     
     tempy = z(i, 4) + 0.5 * delta2V;
     delta3y = h * tempy;
     
     tempU = F([z(i, 1) + 0.5 * delta2x, z(i, 2) + 0.5 * delta2y, tempx, tempy], t(i));
     delta3U = h * tempU(3);
     
     tempV = F([z(i, 1) + 0.5 * delta2x, z(i, 2) + 0.5 * delta2y, tempx, tempy], t(i));
     delta3V = h * tempV(4);
     
     tempx = z(i, 3) + delta3U;
     delta4x = h * tempx;
     
     tempy = z(i, 4) + delta3V;
     delta4y = h * tempy;
     
     tempU = F([z(i, 1) + delta3x, z(i, 2) + delta3y, tempx, tempy], t(i));
     delta4U = h * tempU(3);
     
     tempV = F([z(i, 1) + delta3x, z(i, 2) + delta3y, tempx, tempy], t(i));
     delta4V = h * tempV(4);
   
   
     z(i + 1, 1) = z(i, 1) + (delta1x + 2 * delta2x + 2 * delta3x + delta4x) / 6;
     z(i + 1, 2) = z(i, 2) + (delta1y + 2 * delta2y + 2 * delta3y + delta4y) / 6;
     z(i + 1, 3) = z(i, 3) + (delta1U + 2 * delta2U + 2 * delta3U + delta4U) / 6;
     z(i + 1, 4) = z(i, 4) + (delta1V + 2 * delta2V + 2 * delta3V + delta4V) / 6;
     
  
   
end

    end

