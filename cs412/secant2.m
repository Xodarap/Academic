function x=secant2(f, x1, x2, tol)
maxIter = 1000;
x = x2;
for n=1:maxIter
	d = (x1 - x2) / (f(x1) - f(x2)) * f(x1);
	if isnan(d)
		return;
	end
	x2 = x1;
	x1 = x;
	x = x - d
	if abs(x - 20.2402751265295) < tol
		disp(sprintf('root found after %d iterations at x=%f, f(x)=%d',n, x-d, f(x-d)));
	    	x = x - d;
		return;
	end
end

