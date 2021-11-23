function psi = F(x, y, case_name)

global epsilon L;

switch case_name
    
    case '5 Doublets, egg-shaped body parallel to OX'
        
        c = [0.15, 0.3, 0.2, 0.1, 0.05];
        d = [-1, -0.5, 0, 0.5, 1];
        
        psi = y;
        
        for i = 1: length(d)
            
            psi = psi - c(i) * y / ((x - epsilon - d(i)) ^ 2 + y ^ 2);
            
        end
        
        
    case '5 Doublets egg-shaped body at an angle a = 30 degrees'
        
       psi = (y * cos(30 * pi / 180) - x * sin(30 * pi / 180)) - 0.3 * y / ((x - epsilon) ^ 2 + y ^ 2);
        
    case 'A uniform stream and a source'
        
        psi = y - L / (2 * pi) * atan((y - epsilon) / (x));
        
    case 'A uniform stream and a sink'
        
        psi = y + L / (2 * pi) * atan((y - epsilon) / (x));
        
    case 'A source on the negative x-axis and a doublet at the origin of the coordinate system'
        
        k = 1.5;
        
        psi = L / (2 * pi) * atan((y - epsilon )/(x + 1)) - k / (2 * pi) * y / ((x - epsilon) ^ 2 + y ^ 2);
        
    case 'A horizontal uniform stream and two doublets of equal strengths on the x-axis separated by a distance d'
        
        d = 2;
        k = 1.5;
        
        psi = y - k / (2 * pi) * y / ((x - epsilon) ^ 2 + y ^ 2) - k / (2 * pi) * y / ((x - d - epsilon) ^ 2 + y ^ 2);
        
     case 'Combination of a vortex of circulation G and symmetry vortex'
            
         d = 1;
         G = 4;

         psi = G / (2 * pi) * 0.5 * log(x ^ 2 + (y - d - epsilon) ^ 2) - G / (2 * pi) * 0.5 * log(x ^ 2 + (y + d - epsilon) ^ 2);
    case 'Uniform stream, doublet and its image with respect y =0'
            
         psi = y - 3 / (2 * pi) * (y / ((x - epsilon) ^ 2 + (y - 1) ^ 2) + y / ((x - epsilon) ^ 2 + (y + 1) ^ 2));

end

