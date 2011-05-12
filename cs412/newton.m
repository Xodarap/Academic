function x = newton(f, fprime, x, tol)

maxIter = 1000;

for i=1:maxIter
	x = x - f(x) / fprime(x);
	if abs(f(x)) < tol
		printf('Convergence reached after %d iterations at %f\n', i, x);
		return;
	end
end

printf('Convergence not reached after %d iterations. Best guess: %f\n', i, x);
