function x = fixedpoint(init, g)
xold = init;
tolerance = 10^-10;
iter = 0;
maxiter = 10000;

while true
	iter++;
	xnew = g(xold);
	if abs(xnew-xold) <= tolerance
		disp(sprintf('Convergence was reached after %d iterations at the value %f', iter, xnew));
		break;
	endif
	
	if iter == 1	%need at least two iterations before we can test divergence
		e1 = xnew - xold;
	elseif (iter > maxiter)
		disp(sprintf('Calculation was terminated after %d iterations at the value %f with error %f', iter, xnew, e1));
		break;
	else
		e0 = e1;
		e1 = xnew - xold;
		if(e0 == 0)
			disp(sprintf('Series went below precision after %d iterations', iter));
			break;
		end
		epsilon = e1 / e0;
		if(epsilon > 1)
			disp(sprintf('Series diverged after %d iterations', iter));
			break;
		end
	end

	xold = xnew;
endwhile

x = xnew;
