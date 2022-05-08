function [iter, eta, f, p] = RungeKutta()

global m epsilon q_0 dq_0 eta_max h;

iter = 1; % счетчик итераций
error = -1;

eta = zeros(m, 1); % eta = func(x, y) - переменная самоподобного потока

f = zeros(m, 1); % f
p = zeros(m, 1); % f'
q = zeros(m, 1); % f''

while (error < 0 || error > epsilon)
    
    i = 1;
    q_0 = q_0 + dq_0;
    q(i) = q_0;
    
    while (eta(i) <= eta_max)
        
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
        
        eta(i + 1) = eta(i) + h;
        i = i + 1;
        
    end
    
    % Метод полуинтервала
    error = 1 - p(i); % ошибка
    
    if(error < 0 || error > epsilon)
        
        if(p(i) > 1 && dq_0 > 0) || (p(i) < 1 && dq_0 < 0)
            
            dq_0 = - dq_0 / 2;
            
        end
        
        iter = iter + 1;
        
    end
    
end

end

