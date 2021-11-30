clc;
clear;

% Nondimensional interval of axisymmetric distribution of sources
R_min = 1; 
R_max = 4;

% Discretization of space
n = 30;
h = (R_max - R_min) / n; 

% Initialization
R = zeros(n, 1);
Phi_exc = zeros(n, 1);
U_exc = zeros(n, 1);
C = zeros(n, 4);
U = zeros(n, 1);

% Coefficients by alpha = 9; betta = -24
A = @(R) 1 / R;
B = @(R) 0 * R;
D = @(R) 9 * R;

% Calculation of the components of a tridiagonal matrix
for i = 1 : n
    
    R(i) = R_min + i * h;
    
    C(i, 1) = 1 - h * A(R(i)) / 2;
    C(i, 2) = - 2 + h ^ 2 * B(R(i));
    C(i, 3) = 1 + 0.5 * h * A(R(i));
    C(i, 4) = h ^ 2 * D(R(i));
    
end

% Calculation of the exact solution
for i = 1 : n
    
    Phi_exc(i) = R(i) ^ 3 - 24 * log(R(i));
    U_exc(i) = 3 * R(i) ^ 2 - 24 / R(i);

end

% Phi at the ends of the interval
Phi_left = 1;
Phi_right = 64 - 24 * log(4);

%Simplification
C(1, 4) = C(1, 4) - C(1, 1) * Phi_left;
C(n, 4) = C(n, 4) - C(n, 3) * Phi_right;
C(1, 1) = 0;
C(n, 3) = 0;

% Approximate calculation of Phi
Phi = Gauss(C, n);

% Approximate calculation of Velocity
for i = 2 : n - 1
    
    U(1) = (Phi(2) - Phi_left) / (2 * h);
    U(n) = (Phi_right - Phi(n - 1)) / (2 * h);
    U(i) = (Phi(i + 1) - Phi(i - 1)) / (2 * h);
    
end


% Calculation errors
Phi_error = round(abs(Phi - Phi_exc) / 100, 3);
U_error = round(abs(U - U_exc) / 100, 3);


disp('Error by Phi:');
disp(Phi_error);

disp('Error by U:');
disp(U_error);


figure(1);

plot(R, U, ' - ro', R, U_exc, ' - bo');
title('U(R)');
xlabel('R');
ylabel('U');
legend('Approximate solution','Exact solution', 'Location', 'best')

figure(2);

plot(R, Phi, ' - ro', R, Phi_exc, ' - bo');
title('\Phi(Ri)');
xlabel('R');
ylabel ('\Phi');
legend('Approximate solution','Exact solution', 'Location', 'best')

