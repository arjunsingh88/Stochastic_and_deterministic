function[hes] = ex09_hess(r)
hes(1,1)= 12*r(1)^2 + 4*r(2) -42;
hes(1,2)= 4*r(1) + 4*r(2);
hes(2,1)= 4*r(1) + 4*r(2);
hes(2,2)= 4*r(1) + 12*r(2)^2 -26;
end