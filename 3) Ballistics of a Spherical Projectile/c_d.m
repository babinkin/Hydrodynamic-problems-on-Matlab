function liftCoefficient = c_d(w_r)

global d nu ;

Re = w_r * d / nu;

 if Re == 0
        c_d = 0;
    elseif Re <= 1
        c_d = 24 / Re;
    elseif (1 < Re) && (Re <= 400)
        c_d = 24 / Re^(0.646);
    elseif (400 < Re) && (Re <= 3e5)
        c_d = 0.5;
    elseif (3e5 < Re) && (Re <= 2e6)
        c_d = 0.000366 * Re^(0.4275);
    elseif Re > 2e6
        c_d = 0.18;
 end
    liftCoefficient = c_d;

end

