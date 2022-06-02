clc;
clear;

Re = 5772;
N = 100;
alpha = 1.02;

% Схема Чебышева
x = cos(pi * (0 : N) / N)'; 
c = [2; ones(N - 1, 1); 2] .* (-1) .^ (0 : N)';
X = repmat(x, 1, N + 1);
dX = X - X';                  
D  = (c * (1 ./ c)') ./ (dX + (eye(N + 1)));    
D  = D - diag(sum(D.'));        

I = eye(N + 1);
A = (D ^ 4 - 2 * D ^ 2 * alpha ^ 2 + I * alpha ^ 4) / (Re * alpha) - 2i * I - 1i * diag(1 - x(1 : N + 1) .^ 2) * (D ^ 2 - I * alpha ^ 2);
B = (D ^ 2 - I * alpha ^ 2);
A(N + 1, :) = 0;
A(N, :) = D(N + 1, :);
A(1, :) = 0;
A(2, :) = D(1, :);
A(1, 1) = 1;
A(N + 1,N + 1) = 1;
B(N + 1, :) = 0;
B(N, :) = 0;
B(1, :) = 0;
B(2, :) = 0;
eigen_values = eig(A, B);
eigen_values = eigen_values(3 : N - 2, 1);

figure(1)
plot(eigen_values, '.', 'markersize', 12);
grid on;
axis([-1 0.2 -1 0]);
axis square;
xlabel('\lambda_R');
ylabel('\lambda_I');
title(['Re = '   num2str(Re) ', (\lambda_R)_{max} = ' num2str(max(real(eigen_values)),'%15.11f')]), drawnow

N = 16;

y = cos(pi * (0 : N) / N)'; 
c = [2; ones(N - 1, 1); 2] .* (-1) .^ (0 : N)';
Y = repmat(y, 1, N + 1);
dY = Y - Y';                  
D  = (c * (1 ./ c)') ./ (dY + (eye(N + 1)));    
D  = D - diag(sum(D.'));     

I = eye(N + 1);
A = D ^ 2 + I * pi;
A(N + 1, :) = 0;             
A(1, :) = 0;
A(1, 1) = 1;
A(N + 1, N + 1) = 1;
C(1 : N + 1) = pi * diag(I);
C(1) = 1;
C(N + 1) = 0;
u = A \ C';
  
figure(2)
plot(y, u, '.', 'markersize', 14)
hold on;

syms u(y) 
eqation = diff(u, y, 2) == - pi * u + pi;
condition = [u(-1) == 0, u(1) == 1];
u_exact(y) = dsolve(eqation, condition);

fplot(u_exact, [-1 1]);
xlabel('y');
ylabel('u');
title(texlabel('u" + pi*u = pi'));
legend('Chebyshev' ,'Exact');




