% Evaluates the various types of interpolants used in this hw
function evalHerm(a, b, n, f, fprime)
chebyRange = chebyshev(a,b,n);
equalRange = linspace(a,b,n);
equalPP = hermite(length(equalRange), [equalRange; f(equalRange); fprime(equalRange)]);
chebyPP = hermite(length(chebyRange), [chebyRange; f(chebyRange); fprime(chebyRange)]);

evalRange = linspace(a, b, 10 * n);

equalVals = evalPP(equalPP, evalRange);
chebyVals = evalPP(chebyPP, evalRange);
splineVals = spline(equalRange, f(equalRange), evalRange);
actualVals = f(evalRange);

% some rough summation of the error
h = (b - a) / (10 * n);
eqErr = h * sum(abs(actualVals - equalVals));
chebErr = h * sum(abs(actualVals - chebyVals));
spErr = h * sum(abs(actualVals - splineVals));

plot(evalRange, actualVals - equalVals, '-b', ...
 			evalRange, actualVals - chebyVals, '-g', ...
			evalRange, actualVals - splineVals, '-r');
legend(sprintf('Hermite - Equidistant: %f', eqErr), ...
								sprintf('Hermite - Chebyshev: %f', chebErr), ...
								sprintf('Spline: %f', spErr));

% Evaluates the pp made in hermite.m
function y = evalPP(pp, range)
y = zeros(1,length(range));
for i=1:length(range)
	xi = range(i);
	idx = lookup(pp.x(2:pp.n), xi) + 1;
	y(1,i) = dot([xi^3 xi^2 xi 1], pp.P(idx,:));
end

% from last hw
function x = chebyshev(a,b,n)
i = 1:n;
x = ((a+b)/2) .+ (b-a).*cos(i .* pi / (n+1)) ./ 2;
