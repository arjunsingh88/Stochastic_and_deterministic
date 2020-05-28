function[twolf] = ex10_wolf(r,T,theta)
%0 < mi <0.5 < m2 < 1
m1 = 0.1;
m2 = 0.9;
t = T;
tminus = 0;
tplus = 0;
N=1000;
dk = -ex10_grad(r)*theta';
for k=1:N
    
    v = r + t * dk;
    if ( ex10_func(v) <= ex10_func(r) + m1 * t * ex10_grad(r)*dk') ...
            && ( (ex10_grad(v) * dk') >= m2* ex10_grad(r) * dk' )
        twolf = t;
        break;
    elseif ex10_func(v) > (ex10_func(r) + m1 * t * ex10_grad(r)*dk')
            tplus = t;
        elseif ex10_func(v) <= (ex10_func(r) + m1 * t *ex10_grad(r)*dk')...
                    &&...
                     (ex10_grad(v) * dk') <  m2* ex10_grad(r)*dk'
                 tminus = t;
    end
 

    
    if tplus ==0
        t = 2* tminus;
    elseif tplus>0
            t = (tminus + tplus) /2;
    end
end
end
             
            