clc;
clear;

global A B h; 

h = 0.1; %time step
tm = 10; %end computation time


%Non-dimension coefficients A and B
%A = c_l * rho * w0 ^ 2 * S / 2 / m / g;
A = 1.5; 

%B = c_d / c_l;
B = 0.06;

W0 = 1; %initial velocity
tetta_vertical =  -90 * pi / 180; %angle between W and OX for verical motion

U0_verical = W0 * cos(tetta_vertical); 
V0_vertical = W0 * sin(tetta_vertical);

tetta_upsideDown = 180 * pi / 180; %angle between W and OX for upside down motion

U0_upsideDown= W0 * cos(tetta_upsideDown);
V0_upsideDown = W0 * sin(tetta_upsideDown);


 [t1, y1] = RungeKutta(@F, [0, tm], [0, 0, U0_verical, V0_vertical]);
 [t2, y2] = RungeKutta(@F, [0, tm], [0, 0, U0_upsideDown, V0_upsideDown]);

X_vertical = y1( :,1);
Y_vertical = y1(:, 2);
U_vertical = y1(:, 3);
V_vertical = y1(:, 4);

X_upsideDown = y2( :,1);
Y_upsideDown = y2(:, 2);
U_upsideDown = y2(:, 3);
V_upsideDown = y2(:, 4);

%Вывод траектории полёта
figure(1)
 plot(X_vertical, Y_vertical, 'r -',X_upsideDown, Y_upsideDown, 'b --');
title('y(x)');
xlabel('x');
ylabel('y');
xlim([-1 5]);
ylim([-2 1]);
legend('Vertical flight','Upside down flight', 'Location', 'best');


