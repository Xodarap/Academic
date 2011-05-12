% data is of the following form:
% 	x1			x2			x3		...
%		f(x1)		f(X2)		f(x3)	...
%		f'(x1)	f'(x2)	f'(x3)...
% n = cols(data)
function herm = hermite(n, data)

% coefficient matrix, where the nth row represents the polynomial for
% the nth interval. Coefficients are listed from highest to lowest
% [so coeffs(:,1) is for t^3]
coeffs = zeros(n-1, 4);
for i=1:(n-1)
	dd = hermiteDivDif(data(:,i:i+1));
	l = data(1,i); r = data(1,i+1);	%endpoints of this piece

	% lengthy algebraic manipulations have revealed that an expansion of
	%	the polynomial yields these coefficients. 
	% an is the coefficient of t^n
	a0 = dd(1,1) - dd(1,2) * l + dd(1,3) * (l .^ 2) - dd(1,4) * (l .^2 )* r;
	a1 = dd(1,2) - 2 * dd(1,3) * l + dd(1,4) * l ^2 + 2 * dd(1,4) * l * r;
	a2 = dd(1,3) - 2 * dd(1,4) * l - dd(1,4) * r;
	a3 = dd(1,4);
	coeffs(i,:) = [a3 a2 a1 a0];
end

herm = mkpp(data(1,:), coeffs);

% Calculates the divided differences table with Hermite's method
% Expects:
%		 [l 		r]
%		 [f(l) 	f(r)] 
%		 [f'(l) f'(r)]
function dd = hermiteDivDif(d)
denom = d(1,1) - d(1,2);
dd = zeros(4);
% column 1
% Repeat f(l) and f(r) twice
dd(:,1) = [d(2,1) d(2,1) d(2,2) d(2,2)]';

% column 2
dd(1,2) = d(3,1);	% dd(1,2) = f'(l)
dd(2,2) = (dd(2,1) - dd(3,1)) / (denom);
dd(3,2) = d(3,2);	% dd(3,2) = f'(r)

% column 3
dd(1,3) = (dd(1,2) - dd(2,2)) / (denom);
dd(2,3) = (dd(2,2) - dd(3,2)) / (denom);

% column 4
dd(1,4) = (dd(1,3) - dd(2,3)) / (denom);
