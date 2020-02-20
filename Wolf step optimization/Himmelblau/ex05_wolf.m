function[twolf] = ex05_wolf(r,T)
%0 < mi <0.5 < m2 < 1
m1 = 0.1;
m2 = 0.9;
t = T;
tminus = 0;
tplus = 0;
N=1000;
for k=1:N
    v = r - t * ex05_grad(r);
    if ex05_func(v) <= ex05_func(r) + m1 * t * -1 * ex05_grad(r)*ex05_grad(r)' ...
            && (ex05_grad(v) * -1* ex05_grad(r)') >= m2* ex05_grad(r) * -1* ex05_grad(r)'
        twolf = t;
        break;
    elseif ex05_func(v) > ex05_func(r) + m1 * t *  (ex05_grad(r)*(-1* ex05_grad(r))')
            tplus = t;
        elseif ex05_func(v) <= ex05_func(r) + m1 * t *(ex05_grad(r)*(-1* ex05_grad(r))')...
                    &&...
                     (ex05_grad(v) * (-1* ex05_grad(r))') <  m2* -1*(ex05_grad(r) * ex05_grad(r)')
                 tminus = t;
    end
 

    
    if tplus ==0
        t = 2* tminus;
    elseif tplus>0
            t = (tminus + tplus) /2;
    end
end
end
             
            