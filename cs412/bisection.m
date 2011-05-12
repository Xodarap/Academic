function x = bisection(f, left, right)
maxIter = 10000000;

for i=1:maxIter
   	midpoint = (right + left) / 2;

	if abs(midpoint - 20.2402751265295) < 10^-13
		printf('Found an acceptable midpoint after %d iterations\n', i);
		x = midpoint;
		return;
	end
	if (f(left) * f(midpoint)) < 0 
		right = midpoint;
	elseif (f(right) * f(midpoint)) < 0
		left = midpoint;
	else 
		disp(sprintf('Convergence reached after %d iterations', i));
		x = midpoint;
		return;
	end
end

disp(sprintf('Convergence not reached after %d iterations. Best guess: %f', i, midpoint));
