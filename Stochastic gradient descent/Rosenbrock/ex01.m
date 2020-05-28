function[r,x,y,k] = ex01(epsilon,r0)
k=1;
r=r0;
x(1) = r(1);
y(1) = r(2);
while sqrt(ex01_grad(r)* ex01_grad(r)')>epsilon
    t = ex01_grad(r)*ex01_grad(r)'/(ex01_grad(r)*ex01_hess(r)*ex01_grad(r)');
    r= r - t *ex01_grad(r);
    k=k+1;
    x(k)= r(1);
    y(k)= r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t Minima at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);
%plot(x,y,'-o');
%figure;
%comet(x,y);