function[twolf] = ex11_wolf(r,T,theta)
m1= 0.1;
m2=0.9;
N=1000;
t=T;
tminus = 0;
tplus = 0;
dk = -ex11_grad(r)*theta';

for k=1:N
    v = r + t * dk;
    
    if ( ex11_func(v) <= ex11_func(r) + m1 * t * ex11_grad(r)*dk') ...
            && ( (ex11_grad(v) * dk') >= m2* ex11_grad(r) * dk' )
        twolf = t;
        break;
        
    elseif ex11_func(v) > (ex11_func(r) + m1 * t * ex11_grad(r)*dk')
            tplus = t;
            
        elseif ex11_func(v) <= (ex11_func(r) + m1 * t *ex11_grad(r)*dk')...
                    &&...
                     (ex11_grad(v) * dk') <  m2* ex11_grad(r)*dk'
                 tminus = t;
    end
 

    
    if tplus ==0
        t = 2* tminus;
    elseif tplus>0
            t = (tminus + tplus) /2;
    end
end
end
