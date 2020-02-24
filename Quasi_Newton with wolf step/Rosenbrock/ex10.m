function[r,k,x,y] = ex10(r0,epsilon,T)
k=1;
r = r0;
x(1) = r(1);
y(1) = r(2);
theta = eye(2);  %identity matrix

while sqrt(ex10_grad(r)*ex10_grad(r)')>epsilon
    r_old = r;
    dk = -ex10_grad(r)*theta';
    tk = ex10_wolf(r,T,theta);
    %dk = -(inv(ex08_hess(r))* ex10_grad(r)')'; % for newton with wolfes
    
    r = r + tk*dk;
   % r = r + dk;  % for quasi newton without wolfes
    delta = r-r_old;
    sigma = ex10_grad(r) - ex10_grad(r_old);
    theta = theta + ( ( (delta') * delta ) / ( delta * (sigma') ) )  - (( theta * (sigma') * sigma * theta)/(sigma * theta *(sigma')));
    k=k+1;
	x(k)=r(1);
	y(k)=r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t Minima at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);
end
