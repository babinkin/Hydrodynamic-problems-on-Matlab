function [eta, f, p, q] = RungeKutta()

global h n q_0;

eta = zeros(n + 1, 1); % функция от x,y

f = zeros(n + 1, 1); % f
p = zeros(n + 1, 1); % f'
q = zeros(n + 1, 1); % f''

q(1) = q_0;

for i = 2 : n + 1
    
    delta1_f = h * p(i - 1);
    delta1_p = h * q(i - 1);
    delta1_q = - 0.5 * h * f(i - 1) * q(i - 1);
        
    delta2_f = h * (p(i - 1) + delta1_p / 2);
    delta2_p = h * (q(i - 1) + delta1_q / 2);
    delta2_q = - 0.5 * h * (f(i - 1) + delta1_f / 2) * (q(i - 1) + delta1_q / 2);
        
    delta3_f = h * (p(i - 1) + delta2_p / 2);
    delta3_p = h * (q(i - 1) + delta2_q / 2);
    delta3_q = - 0.5 * h * (f(i - 1) + delta2_f / 2) * (q(i - 1) + delta2_q / 2);
        
    delta4_f = h * (p(i - 1) + delta3_p);
    delta4_p = h * (q(i - 1) + delta3_q);
    delta4_q = - 0.5 * h * (f(i - 1) + delta3_f) * (q(i - 1) + delta3_q);
        
    f(i) = f(i - 1) + (delta1_f + 2 *delta2_f + 2 *delta3_f + delta4_f) / 6;
    p(i) = p(i - 1) + (delta1_p + 2 *delta2_p + 2 *delta3_p + delta4_p) / 6;
    q(i) = q(i - 1) + (delta1_q + 2 *delta2_q + 2 *delta3_q + delta4_q) / 6;
        
    eta(i) = eta(i - 1) + h;
    
end

end

