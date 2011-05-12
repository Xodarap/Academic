function x = secantrecursive(f, xnminus1, xnminus2, idx)
if idx == 1
	x = xnminus1;
elseif idx == 2
	x = xnminus1 - f(xnminus1)*(xnminus1 - xnminus2) / (f(xnminus1) - f(xnminus2));
else
	newxminus1 = secantrecursive(f, xnminus1, xnminus2, idx - 1);
	newxminus2 = secantrecursive(f, xnminus1, xnminus2, idx - 2);
	x = newxminus1 - f(newxminus1)*(newxminus1 - newxminus2) / (f(newxminus1) - f(newxminus2));
end

