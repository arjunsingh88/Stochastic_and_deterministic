function[hes] = ex03_hess(r)
hes(1,1) = 12;
hes(1,2) = -4;
hes(2,1) = -4;
hes(2,2) = 6;
end