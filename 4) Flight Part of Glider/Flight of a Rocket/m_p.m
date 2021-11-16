function instantaneousMass = m_p(t)

global m_p_0;
   

    if (t >= 1 && t <= 4)
    
    instantaneousMass = m_p_0 ;

    elseif (t > 4 || t < 1) 
    
   instantaneousMass = m_p_0 - 25 / 8 * m_p_0 ;
    

   
    end

end