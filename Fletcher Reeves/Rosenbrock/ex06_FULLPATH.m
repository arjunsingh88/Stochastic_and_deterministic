function[] = p03_FULLPATH(epsilon,r0)


X_cord=[1 1 -2];
Y_cord=[2 0 -1];

for i=1:length(X_cord)
    [~,~,x,y] = ex06(0.001,[X_cord(i),Y_cord(i)]);
    plot(x,y,'-o');
    hold on
end    
xlabel('X');
ylabel('Y');
[X Y]=meshgrid(-3:0.01:3, -3:0.01:3);
% disp(X)
contour(X, Y, (X.^2-Y).^2 + (X-1).^2, [0,0.1,0.5,1,2,5,10,20,30]); 
% text(1.1,1,'minimum')
title('convergence of the algorithm, optimal for Rosenbrock (fletcher- Reeves)')
set(gca,'Color',[1 1 0])
set(gca,'Color',[1 1 1])
[a b]=meshgrid(-0.5:0.01:2, -0.5:0.01:2);
c = (a.^2 - b).^2 + (a - 1).^2;
figure ;
mesh(a,b,c)
end
