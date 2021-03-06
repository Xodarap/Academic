function cs412hw5p1(fn)
disp(sprintf('M\tNoise\tError'));
for m=[1 10 100 500]
	for noiseLevel=[.1 .5 1 5]
		vErr = Vander(fn, m, noiseLevel);
		disp(sprintf('%f\t%f\t%f\t',m, noiseLevel, vErr));
	end
end


function vErr = Vander(fn,m,noiseLevel)
% we use equidistant points in [0,2]
x = linspace(0,2,m);
act = fn(x);
noisy = act + noiseLevel * (rand(1,m) - .5);
% Least Squares w/ Vandermonde's
V = vander(x);
vGuess = V \ noisy';
vVals = polyval(vGuess, x);
vErr = sqrt(m) * norm(abs(act - vVals));


