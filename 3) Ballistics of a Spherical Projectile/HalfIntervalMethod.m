function [x_r_max,theta_optimal] = HalfIntervalMethod(t0, epsilon)

global w0;

theta_old = 0 ;
delta = 10;

while abs(delta) >= epsilon
    theta_new = theta_old  + delta;
 
    w0_u_theta_old = w0 * cos(theta_old * pi / 180);
    w0_v_theta_old  = w0 * sin(theta_old * pi / 180);
    w0_u_theta_new = w0 * cos(theta_new * pi / 180);
    w0_v_theta_new  = w0 * sin(theta_new * pi /180);
   
    x_r_theta_old = Find_Range(t0, 0, 0, w0_u_theta_old,  w0_v_theta_old);
    x_r_theta_new =  Find_Range(t0, 0, 0,  w0_u_theta_new, w0_v_theta_new);
   
    
    if (x_r_theta_old >= x_r_theta_new)
        delta = - delta / 2;
    else
        theta_old = theta_new;
    end
    

end

 if (x_r_theta_old >= x_r_theta_new)
     x_r_max = x_r_theta_old;
     theta_optimal = theta_old;
 else
     x_r_max = x_r_theta_new;
     theta_optimal = theta_new;
 end


end

