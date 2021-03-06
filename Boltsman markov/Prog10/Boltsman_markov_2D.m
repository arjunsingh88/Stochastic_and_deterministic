function[] = Boltsman_markov_2D(x0,y0,Nmc)
t=1;
x(1)= x0;
y(1)= y0;
T0 = 1000;         %initial temprature  the smaller the temprature you get trapped by local minima i.e why we use huge value of temprature
a=-10;
b=10;


% points=100;
% a=linspace(a,b,points);
% for k=1:points
%     %y(k)=myfunction(a(k));
%     y(k)=myfunction1(a(k));
% end
% plot(a,y);
% figure;



for k=1:(Nmc-1)
    %random = rand();
    T(k)=T0*(1-(k/Nmc))^4;
    
    x(k+1)= x(k) + t*(2*rand() - 1);
    y(k+1)= y(k) + t*(2*rand - 1);
    
    probability = min( 1, exp(  -( myfunction2(x(k+1),y(k+1)) - myfunction2(x(k),y(k))  ) / T(k) )  );
    
    if rand >= probability         % We dont accept       
        x(k+1)=x(k);
        y(k+1)=y(k);
    end
    
    if x(k+1)>b                     %To be inside the boundary
        x(k+1)=x(k)-t*rand;
        
     else if x(k+1)<a
      	 x(k+1)=x(k)+t*rand;   
         end
    end
    
     if y(k+1)>b                     %To be inside the boundary
        y(k+1)=y(k)-t*rand;
        
     else if y(k+1)<a
      	 y(k+1)=y(k)+t*rand;   
         end
    end
    
end
plot(x)
figure;
plot(y)
figure;
plot(x,y)

             
        
