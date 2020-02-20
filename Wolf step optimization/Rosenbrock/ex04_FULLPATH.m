function[] = ex04_FULLPATH(epsilon,r0)

X_cord=[10 10 1 1 0 0 2 2 -1 -1];
Y_cord=[2 2 -1 -1 0 0 2 2 1 1];
T = [1 10 1 0.1 1 0.1 1 100 1 0.1];
for i=1:length(X_cord)
    [~,~,x,y] = ex04([X_cord(i),Y_cord(i)],0.001,T(i));
    plot(x,y,'-o');
    hold on
end    
xlabel('X');
ylabel('Y');
hold on;
[X Y]=meshgrid(-8:0.01:8, -8:0.01:8);
% disp(X)
contour(X,Y,((X.^2)-Y).^2 + ((X-1).^2),[0,0.1,0.5,1,2,5,10,20,30]);
% text(-2.8,2.5,'minimum')
title('Convergence of the Algorithm for rosenbrock with Wolves step')
set(gca,'Color',[1 0 0])
set(gca,'Color',[1 1 1])
[a b] = meshgrid(-2:0.01:2, -3:0.01:3);
c = ((a.^2)-b).^2 + (a-1).^2;
figure ;
mesh(a,b,c)
end