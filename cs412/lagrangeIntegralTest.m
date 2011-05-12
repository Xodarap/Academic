function lagrangeIntegralTest()

t0 = 1/6 * (3 + sqrt(3));	% zeros
t1 = 1/6 * (3 - sqrt(3));
% analytic integrals of lagrange polynomials
I0 = @(x) (x^2 / 2 - t1 * x) / (t0 - t1);
I1 = @(x) (x^2 / 2 - t0 * x) / (t1 - t0);
% numeric values of integrating the lagrange polynomials
w0 = I0(1) - I0(0);
w1 = I1(1) - I1(0);

% To validate, we generate random polynomials of
% varying degrees, and check their error.
fprintf('deg\tact\test\terr\n');
for degree=0:4
	for iter=1:5
		[fn coeffs] = genPoly(degree);
		% We find the "correct" answer by using Simpson's quadrature
		% with accuracy 1e-8
		actual = quad(fn, 0, 1, 1e-8);
		est = fn(t0) * w0 + fn(t1) * w1;
		fprintf('%d\t%.2f\t%.2f\t%e\n', degree, actual, est, abs(actual-est));
	end
end

fprintf('fn\t\tme\tmid\tsimps\n');
fns{1} = @(x) exp(x);
fns{2} = @(x) (x + 1) .^ -1;
fns{3} = @(x) sin(x);
for i=1:3	
	actual = quad(fns{i}, 0, 1, 1e-8);
	est = fns{i}(t0) * w0 + fns{i}(t1) * w1;
	midest = Midpoint(fns{i}, 2);
	simpest= Simpsons(fns{i}, 1);
	fprintf('%s\t%.4f\t%.4f\t%.4f\n', func2str(fns{i}), ...
																		abs(actual-est), ...
																		abs(actual-midest),...
																		abs(actual-simpest));
end

% Generates a random polynomial of a given degree (<= 4)
function [fn coeffs] = genPoly(degree)
coeffs = [zeros(1, 4-degree) rand(1, degree+1)];
fn = @(x) dot([x.^4 x.^3 x.^2 x 1], coeffs);

%
%% ========== Numerical integration methods from the previous homework =================== %%
%

function total = Simpsons(fn, numPts)
% Sub-intervals for Simpson's method is kind of weird. 
% Each sub-interval has the two end points, and the middle point.
% The end points are shared, but the middle ones aren't.
% So if you request n sub intervals, we will evaluate the
% function at 2n+1 points.
numEvalPoints = 2*numPts+1;

x = linspace(0,1,numEvalPoints);
f = fn(x);
total = 0;

% We evaluate at (1,2,3), then (3,4,5) etc.
for i=3:2:numEvalPoints
	total += f(i-2) + 4*f(i-1) + f(i);
end

% 1/numPts = h
total *= (1/numPts) / 6;

function total = Midpoint(fn, numIntervals)
% If you request n intervals, we will evaluate it at n points,
% however, they will be offset. So we want to calculate the width,
% then find half of that, which will be the offset
width = 1 / numIntervals;
offset = width / 2;
x = offset:width:1;
f = fn(x);
total = 0;

for i=1:length(x)
	total += f(i) * width;
end

