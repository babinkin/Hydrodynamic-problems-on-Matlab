function Right_Part = f(~, y)

global A B C d nu;

Re = y(1) * d / nu;

if Re == 0
        c_d = 0;
        
    elseif (Re > 0) && (Re <= 1)
        c_d = 24 / Re;
        
    elseif (Re > 1) && (Re <= 400)
        c_d = 24 / Re^(0.646);
        
    elseif (Re > 400) && (Re <= 3e5)
        c_d = 0.5;
        
    elseif (Re > 3e5) && (Re <= 2e6)
        c_d = 0.000366 * Re^(0.4275);
        
    elseif Re > 2e6
        c_d = 0.18;
end
    
Right_Part1 = (B - C * y(1) * abs(y(1)) * c_d) / A;
Right_Part2 = y(1);

Right_Part = [Right_Part1; Right_Part2];

end
