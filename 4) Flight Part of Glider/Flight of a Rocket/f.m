function Right_Part = f(t, y)

global m_c g rho A C_d V_e;

       
    
Right_Part1 = (-(m_c + m_p(t)) * g + m_p(t) * V_e - rho * y(1) * abs(y(1)) * A * C_d / 2) / (m_c + m_p(t));  %velocity
Right_Part2 = y(1); % vertical coordinate

Right_Part = [Right_Part1; Right_Part2];

end