function [i, f, p, z] = ModifiedRungeKutta()

global m h z_max;

i = 1; % счетчик итераций

f = zeros(m, 1); % g
p = zeros(m, 1); % g'
q = zeros(m, 1); % g''
z = zeros(m, 1);

q(1) = 1;

while (z(i) <= z_max)
    
        % Метод Рунге-Кутта 4-го порядка
        delta1_f = h * p(i);
        delta1_p = h * q(i);
        delta1_q = - 0.5 * h * f(i) * q(i);
        
        delta2_f = h * (p(i) + delta1_p / 2);
        delta2_p = h * (q(i) + delta1_q / 2);
        delta2_q = - 0.5 * h * (f(i) + delta1_f / 2) * (q(i) + delta1_q / 2);
        
        delta3_f = h * (p(i) + delta2_p / 2);
        delta3_p = h * (q(i) + delta2_q / 2);
        delta3_q = - 0.5 * h * (f(i) + delta2_f / 2) * (q(i) + delta2_q / 2);
        
        delta4_f = h * (p(i) + delta3_p);
        delta4_p = h * (q(i) + delta3_q);
        delta4_q = - 0.5 * h * (f(i) + delta3_f) * (q(i) + delta3_q);
        
        f(i + 1) = f(i) + (delta1_f + 2 * delta2_f + 2 * delta3_f + delta4_f) / 6;
        p(i + 1) = p(i) + (delta1_p + 2 * delta2_p + 2 * delta3_p + delta4_p) / 6;
        q(i + 1) = q(i) + (delta1_q + 2 * delta2_q + 2 * delta3_q + delta4_q) / 6;
        
        z(i + 1) = z(i) + h;
        i = i + 1;
        
end
    
end

