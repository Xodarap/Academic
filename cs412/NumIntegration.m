function val = NumIntegration(fn, numPts, method)

if method == 1
	val = Simpsons(fn, numPts);
elseif method == 2
	val = Midpoint(fn, numPts);
elseif method == 3
	val = Trapezoid(fn, numPts);
end

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

function total = Trapezoid(fn, numIntervals)
x = linspace(0,1,numIntervals+1);
width = 1 / numIntervals;
f = fn(x);
total = f(1) + f(numIntervals+1) + 2 * sum(f(2:numIntervals));
total *= width / 2;
