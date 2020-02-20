function[r,x,y,k] = ex02(epsilon,r0)
k=1;
r=r0;
x(1)=r(1);
y(1)=r(2);
while sqrt(ex02_grad(r)*ex02_grad(r)')>epsilon
    t = ex02_grad(r)*ex02_grad(r)'/(ex02_grad(r)*ex02_hess(r)*ex02_grad(r)');
    r = r - t*ex02_grad(r);
    k=k+1;
    x(k)=r(1);
    y(k)=r(2);
    min_point_x = x(k);
    min_point_y = y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t Minima at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);
%plot(x,y,'-o');
%figure;
%comet(x,y);