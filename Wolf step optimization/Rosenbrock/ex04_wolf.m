function[twolf] = ex04_wolf(r,T)
%0 < mi <0.5 < m2 < 1
m1 = 0.1;
m2 = 0.9;
t = T;
tminus = 0;
tplus = 0;
N=1000;
for k=1:N
    v = r - t * ex04_grad(r);
    if ex04_func(v) <= ex04_func(r) + m1 * t * -1 * ex04_grad(r)*ex04_grad(r)' ...
            && (ex04_grad(v) * -1* ex04_grad(r)') >= m2* ex04_grad(r) * -1* ex04_grad(r)'
        twolf = t;
        break;
    elseif ex04_func(v) > ex04_func(r) + m1 * t *  (ex04_grad(r)*(-1* ex04_grad(r))')
            tplus = t;
        elseif ex04_func(v) <= ex04_func(r) + m1 * t *(ex04_grad(r)*(-1* ex04_grad(r))')...
                    &&...
                     (ex04_grad(v) * (-1* ex04_grad(r))') <  m2* -1*(ex04_grad(r) * ex04_grad(r)')
                 tminus = t;
    end
 

    
    if tplus ==0
        t = 2* tminus;
    elseif tplus>0
            t = (tminus + tplus) /2;
    end
end
end
             
            