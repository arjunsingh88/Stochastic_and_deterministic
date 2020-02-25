function[hes] = ex08_hess(r)
hes(1,1) = (12*(r(1)^2)) - 4*r(2) + 2;
hes(1,2) = -4*r(1);
hes(2,1) = -4*r(1);
hes(2,2) = 2;
end