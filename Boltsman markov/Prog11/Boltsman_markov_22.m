function[] = Boltsman_markov_22(r0,Nmc)
t=1;
r = r0;
x(1)= r(1);
y(1)= r(2);
T0 = 1000;         %initial temprature  the smaller the temprature you get trapped by local minima i.e why we use huge value of temprature
good_point=r0;
best_value=myfunction3(r0);


for k=1:(Nmc-1)
    %random = rand();
    T(k)=T0*(1-(k/Nmc))^4;
    r_old = r;
    
    
    if r == good_point    % we choose the next randomly
        r=r+t*[2*rand-1,2*rand-1]; 
    else  %direction to the good point with probaility = 2/3
        if rand < (2/3)
            r = r + t*((good_point-r)/norm(good_point-r));
        else
            r = r + t*[2*rand-1,2*rand-1];
        end
        
        probability = min( 1, exp(  -( myfunction3(r) - myfunction3(r_old) ) / T(k) )  );
        
        if myfunction3(r) < myfunction3(r_old) &&  myfunction3(r) < best_value
            good_point = r;
            best_value = myfunction3(r);
        else
            if rand > probability
                r= r_old;
            end
        end
    end
    
    
if r(1)> 5
    r(1) = 5-rand*t;
end
if r(1) < -5
        r(1) = 5+rand*t;
end
    

if r(2)> 5
    r(2) = 5-rand*t;
end
if r(2) < -5
        r(2) = 5+rand*t;
end

  
x(k+1) = r(1);  
y(k+1)= r(2);
end
figure;
plot(x)
figure;
plot(y)
figure;
plot(x,y)
hold on

[X Y]=meshgrid(-5:0.01:5, -5:0.01:5);
contour(X, Y,20+ X.^2 + Y.^2 - 10* cos(pi*X)-10*cos(pi*Y), [0,0.1,0.5,1,2,5,10,20,30]); 

[a b]=meshgrid(-5:0.01:5, -5:0.01:5);
c= 20+ a.^2 + b.^2 - 10* cos(pi*a)-10*cos(pi*b);
figure;
meshc(a,b,c)
    
  