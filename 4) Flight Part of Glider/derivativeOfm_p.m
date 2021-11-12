function [dm_p] = derivativeOfm_p(t)

global m_p_0;

if (t >= 1 || t <= 4)
    dm_p = m_p_0 / 4;
elseif (t >=0 || t < 1) 
    dm_p =;
elseif
end
end

