function polymult(x, y)
n = length(x);
w = exp(2 * pi * i / n);
y = fft([2 2 2 2], );
polyval(y, 3)
polyval([2 2 2 2], 3)
% omega is nth root of 1
function y = fft(x, w)
% octave can't quite do this arithmetic perfectly,
% so we say to stop when it's "close enough"
if (real(w) == 1)
	y = polyval(x, 1);
	return;
end
n = length(x);
% note that matlab indexes start with 1
even = x(1:2:n);
odd = x(2:2:n);
s = fft(even, w^2);
sp = fft(odd, w^2);

for j=1:(n/2)
	y(j) = s(j) + (w^j) * sp(j);
	y(j+n/2) = s(j) - (w^j) * sp(j);
end

