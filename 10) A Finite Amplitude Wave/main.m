clc;
clear;

m  = 101;
n  = 56;
h = 0.02;

u = zeros(m, n + 1);
a = zeros(m, n + 1);

a_0 = 340;
gamma = 1.4;
tau = 0.5 * h / a_0;
RATIO = tau / h;
COEFF = (gamma - 1) / 2;

x = zeros(m, 1);
x(1) = 0;

for i = 2 : m
    
    x(i) = x(i-1) + h;
    
end


for i = 1 : m
    
    u(i, 1) = 0;
    
   if i > 1 && i <= 13
       
       u(i, 1) =  a_0 / 2 * (i - 1) / 12;  
   
   elseif i > 13 && i <= 39 
       
       u(i, 1) =  a_0 / 2 * (26 - i) / 13;
   
   elseif i > 39 && i <= 51
       
       u(i, 1) = a_0 / 2 * (i - 51) / 12;
   
   end
   
   a(i, 1) = a_0 + COEFF * u(i, 1);
   
end

for j = 1 : n
    
   u(1, j + 1) = 0;
   a(m, j + 1) =  a_0;
   
end

% Courant-Isaacson-Rees scheme
for  j = 1 : n
    
  temp1 = RATIO * (u(1, j) + a(1, j));
  temp2 = RATIO * (u(1, j) - a(1, j));
  
  if abs(temp1) <= 1 && abs(temp2) <= 1
      
      u_B = u(1, j) - temp2 * (u(2, j) - u(1, j));
      a_B = a(1, j) - temp2 * (a(2, j) - a(1, j));
      
      a(1, j + 1) = a_B - COEFF * u_B;
      
      for i = 2 : m - 1 
          
            temp1 = RATIO * (u(i, j) + a(i, j));
            temp2 = RATIO * (u(i, j) - a(i, j));
            
            if abs(temp1) <= 1 && abs(temp2) <= 1
                
                u_A = u(i, j) + temp1 * (u(i - 1, j) - u(i, j));
                a_A = a(i, j) + temp1 * (a(i - 1, j) - a(i, j));
                u_B = u(i, j) - temp2 * (u(i + 1, j) - u(i, j));
                a_B = a(i, j) - temp2 * (a(i + 1, j) - a(i, j));
                
                u(i, j + 1) = 0.5 * ((u_A + u_B) + (a_A - a_B) / COEFF);
                a(i, j + 1) = 0.5 * (COEFF * (u_A - u_B) + (a_A + a_B));
                
            else
                
                break;
                
            end
            
      end
          
           temp1 = RATIO * (u(m, j) + a(m, j));
           temp2 = RATIO * (u(m, j) - a(m, j));
            
            if abs(temp1) <= 1 && abs(temp2) <= 1 
                
                u_A = u(m, j) + temp1 * (u(m - 1, j) - u(m, j));
                a_A = a(m, j) + temp1 * (a(m - 1, j) - a(m, j));
                
                u(m, j + 1) = u_A + (a_A - a_0) / COEFF;
                
            else
                
                break;
                
            end

  else
            
      break;
      
  end
  
end

iter = 1;

for i = 1 : 5 : n 

    subplot(6, 2, iter);
    plot(x, u(:, i));
    
    xlim([0, 2]);
    ylim([-150, 150]);
    
    title(['Time = ', int2str(i - 1), ' \cdot \tau = ', num2str((i - 1) * tau),  ' seconds']);

    iter = iter + 1;
    
end
