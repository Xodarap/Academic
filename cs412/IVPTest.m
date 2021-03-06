% Sample code snippet comparing three methods of solving IVPs:
% Runge-Kutta 4, Adams-Bashforth-Moulton and Milne-Simpson
%
% Usage: Just run IVPTest(). It will run each method with varying values of
% 	h and print statistics about each method. The function we're trying to evaluate
% 	is exp(-2t) * y - y^2
function IVPTest()

fn = @(t,y) exp(-2 * t) .* y - y .^2;
t0 = 1; y0 = .5; tn = 2;
rk4iters = testFn(str2func('RK4'), fn,  t0, tn, y0, 1, .348849);
abiters = testFn(str2func('AdamsBashforth'), fn,  t0, tn, y0, .5, 0.372838);
msiters = testFn(str2func('MilneSimpson'), fn,  t0, tn, y0, .5, 0.348848);

% Runs a method until it converges to a value less than 1e-6
% Prints out stats at each iteration
function iters = testFn(estFn, fn, t0, tn, y0, coeff, act)
fprintf('Function: %s\n', func2str(estFn));
fprintf('h\tValue\terror\terrRatio\n');
last = 0; epsilon = 1e-6; iters = 0;
lastErr = 1;
for iters=1:10
	h = (2 ^-iters) * coeff;
	y = estFn(fn, h, t0, tn, y0);
	err = act - y(end);
	fprintf('2^-%d\t%f\t%f\t%f\n',iters, y(end), err, err / lastErr);
	if (y(end) - last(end)) < epsilon
		break;
	end
	last = y;
	lastErr = err;
end
end

% Runge-Kutta degree 4 method
function y = RK4(fn, h, t0, tmax, y0)
coeff = (h / 6) * [1 2 2 1];
maxItr = (tmax - t0) / h;
y = zeros(maxItr,1);
y(1) = y0; i = 1;
t = t0:h:tmax;
for i = 1:maxItr
	f = incrementF(fn, h, t(i), y(i));
	y(i+1) = y(i) + dot(f, coeff);
end

% Finds f_k(1)...f_k(4) for RK4 at 
% t_k, y_k
function f = incrementF(fn, h, t, y)
f(1) = fn(t,y);
f(2) = fn(t + h/2, y + (h/2) * f(1));
f(3) = fn(t + h/2, y + (h/2) * f(2));
f(4) = fn(t + h, y + h * f(3));

function  y = AdamsBashforth(fn, h, t0, tmax, y0)
predCoeff = (h / 24) * [-9 37 -59 55];
corrCoeff = (h / 24) * [1 -5 19 9];
maxItr = (tmax - t0) / h;
y = zeros(1,maxItr);
t = t0;
% Get initial 4 values from RK4
y(1:4) = RK4(fn, h, t0, t0+ 3*h, y0);
f = fn(t0:h:t0+3*h, y(1:4));

for k=4:maxItr
	% Predict y(k+1)
	pred = y(k) + dot(predCoeff,f);
	f = [f(2:4) fn(t, pred)];
	% Use Adams-Moulton to correct our prediction
	y(k+1) = y(k) + dot(corrCoeff, f);
	f(4) = fn(t, y(k+1));
end

function y = MilneSimpson(fn, h, t0, tmax, y0)
predCoeff = (4 * h / 3) * [2 -1 2];
corrCoeff = (h / 3) * [1 4 1];
maxItr = (tmax - t0) / h;
y = zeros(1,maxItr);
t = t0; predOld = 0;
% Get initial 4 values from RK4
y(1:4) = RK4(fn, h, t0, t0+3*h, y0);
f = fn(t0:h:t0+3*h, y(1:4));

for k=4:maxItr
	% Predict
	pred = y(k-3) + dot(predCoeff, f(2:4));
	% Modify
	mod = pred + (28 / 29) * (y(k-1) - predOld);
	t += h;
	f = [f(2:4) fn(t, mod)];
	% Correct
	y(k+1) = y(k-1) + dot(corrCoeff, f(2:4));
	f(4) = fn(t, y(k+1));
	predOld = pred;
end

