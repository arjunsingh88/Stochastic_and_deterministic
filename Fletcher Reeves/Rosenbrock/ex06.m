function[r,k,x,y] =ex06(epsilon,r0)
k=1;
r=r0;
x(1)=r(1);
y(1)=r(2);
p = -1*ex06_grad(r0);
correct=0;
while sqrt(ex06_grad(r)*ex06_grad(r)')>epsilon
    r_old = r;
    t = (ex06_grad(r)*ex06_grad(r)')/(p*ex06_hess(r)*p');
    r = r + t*p;
    
    beta = (ex06_grad(r)*ex06_grad(r)')/(ex06_grad(r_old)*ex06_grad(r_old)');
    p = -1*ex06_grad(r) + beta*p;
    
    if (p*ex06_grad(r)')>=0  %Correction if direction diverge:
        p = -1*ex06_grad(r);
        correct=correct+1;
    end
    k=k+1;
    x(k)= r(1);
    y(k)= r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t no of corrections are = %d\n",correct);
fprintf("\t Minima at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);

%disp(correct)
end