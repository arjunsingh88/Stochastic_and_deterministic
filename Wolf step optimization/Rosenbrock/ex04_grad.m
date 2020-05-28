function[vec] = ex04_grad(r)
vec(1) = 4*r(1)*(r(1)^2 - r(2)) + 2*(r(1)-1);
vec(2) = -2*(r(1)^2 -r(2));
end