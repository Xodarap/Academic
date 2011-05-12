function poly = hw3p4(fn,a,b,n)
evalx = linspace(a,b,10 * n);

% Equi-distant
equiX = linspace(a,b,n)';
equiY = fn(equiX);
equiVal = newtonInterp(equiX,equiY,evalx);

% Chebyshev
chebX = chebyshev(a,b,n);
chebY = fn(chebX);
chebVal = newtonInterp(chebX,chebY,evalx);

% Spline
splineVal = spline(equiX, equiY, evalx);

% Find actual values and plot
acty = fn(evalx);
plot(evalx, equiVal, '^', evalx, chebVal, 'o', evalx, splineVal, '*', evalx, acty, '-');
legend('equidistant', 'chebyshev', 'spline', 'actual');
title('Values');
%plot(evalx, chebVal, 'o', evalx, splineVal, '*', evalx, acty, '-');
%legend('chebyshev', 'spline', 'actual');

% plot errors
figure;
plot(evalx, equiVal - acty, '^', evalx, chebVal - acty, 'o', evalx, splineVal - acty, '*');
legend('equidistant', 'chebyshev', 'spline');
title('Errors')

function x = chebyshev(a,b,n)
i = 1:n;
x = ((a+b)/2) .+ (b-a).*cos(i .* pi / (n+1)) ./ 2;

function vals = newtonInterp(x,y,tointerp)
	d = divdif(x,y);
  vals = y(1)*ones(1, length(tointerp));
  for i = 2:length(x)		% i is the iteration (e.g. if i=2, then we're finding d_1 * (x - x_0))
		thisPiece = d(i);
    for j = 1:i-1		% j loops through (x - x_0) * ... * (x - x_i-1)
      thisPiece = thisPiece .* (tointerp-x(j));
    end
    vals = vals + thisPiece; % keep a running total
  end
end
