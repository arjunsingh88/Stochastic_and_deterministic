function[] = Boltsman_markov_44(r0,Nmc)
w=1;
t=1;
r = r0;
x(1)= r(1);
y(1)= r(2);
T0 = 1000;         %initial temprature  the smaller the temprature you get trapped by local minima i.e why we use huge value of temprature
good_point=r0;
best_value=myfunction4(r0);


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
        
        probability = min( 1, exp(  -( myfunction4(r) - myfunction4(r_old) ) / T(k) )  );
        
        if myfunction4(r) < myfunction4(r_old) &&  myfunction4(r) < best_value
            good_point = r;
            best_value = myfunction4(r);
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
contour(X, Y, 10+ X.*sin(w*pi*X) - Y.*sin(w*pi*Y), [0,0.1,0.5,1,2,5,10,20,30]); 

[a b]=meshgrid(-5:0.01:5, -5:0.01:5);

c= 10+ a.*sin(w*pi*a) - b.*sin(w*pi*b);
figure;
meshc(a,b,c)

    
  