function[] = ex09_FULLPATH(epsilon,r0)
X_cord=[-2 -5 -3 0 2 4   5   1];
Y_cord=[2  10 -3 0 3 10 -10 -1];

    for i=1:length(X_cord)
        [~,~,x,y] = ex09(0.001,[X_cord(i),Y_cord(i)]);
        plot(x,y,'-o');
        hold on
    end    
xlabel('X');
ylabel('Y');
hold on;
[X Y]=meshgrid(-5:0.01:5, -5:0.01:5);
% disp(X)
contour(X, Y, (X.^2+Y-11).^2 + (X+Y.^2-7).^2, [0,0.1,0.5,1,2,5,10,20,30,60,100,200,300,400,500,700]);
% text(-2.8,2.5,'minimum')
title('Convergence of the algorithm Newton, optimal for Himmelblow')
set(gca,'Color',[1 0 0])
set(gca,'Color',[1 1 1])
[a b]=meshgrid(-5:0.01:5, -5:0.01:5);
c = (a.^2 + b - 11).^2 + (a + b.^2 - 7).^2;
figure ;
mesh(a,b,c)
end




