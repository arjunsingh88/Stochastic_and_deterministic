function[r,k,x,y] = ex04(r0,epsilon,T)
r=r0;
k=1;
x(1) = r(1);
y(1) = r(2);

while sqrt(ex04_grad(r)*ex04_grad(r)') > epsilon
    t= ex04_wolf(r,T);
    r = r - t * ex04_grad(r);
    k=k+1;
    x(k)=r(1);
    y(k)=r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t Minima at X,Y = %f, %f in %d steps \n\n",min_point_x,min_point_y,k);
plot(x,y,'-o');
end