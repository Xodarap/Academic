function N = NumIntervals(f1max, f2max, f4max, type)

% simpson's
if type == 1
	h = (10e-8 / (1/2880 * f4max)) ^ 1/4;
elseif type == 2	% trapezoid
	h = (10e-8 / (1/12 * f2max)) ^ 1/2;
elseif type == 3	% midpoint
	h = (10e-8 / (1/24 * f2max)) ^ 1/2;
elseif type == 4 % rectangle
	h = (10e-8 / (1/2 * f1max)) ^ 1/2;
end


N = 1 / h;
