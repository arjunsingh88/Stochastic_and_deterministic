function[] = ex03_FULLPATH2(epsilon,r0)

    X_cord=[0 -5  0 -4];
    Y_cord=[0 -5 -6  0];

    for i=1:length(X_cord)
        [~,x,y,~] = ex03(0.001,[X_cord(i),Y_cord(i)]);
        plot(x,y,'-o');
        hold on
    end    
xlabel('X');
ylabel('Y');
hold on;
[X Y]=meshgrid(-6:0.01:1,-10:0.01:2);
% disp(X)
contour(X, Y, ( 6*X.^2-4*X.*Y+3*Y.^2+4*sqrt(5)*(X+2*Y)+22 ), [-25,-20,-10,-5,0,5,10]);
% text(1.1,1,'minimum')
title('convergence of the algorithm, optimal for Quadratic Eq')
set(gca,'Color',[1 0 0])
set(gca,'Color',[1 1 1])
[a b] = meshgrid(-10:0.01:5, -10:0.01:5);;
c = 6*(a.^2) - 4*a.*b + 3*(b.^2)+ (4*sqrt(5)*(a + 2*b)) + 22;
figure ;
mesh(a,b,c)
end