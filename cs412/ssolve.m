function x = ssolve(a, b, n)
if n < 3
	disp("not defined for matrices smaller than 3x3");
end
% setup lhs
lhs = eye(n);
lhs(1,2) = a;
lhs(n,:) = ones(1,n) * b;
lhs(n,n) = 1;

% setup rhs
rhs = zeros(n,1);
for itr=1:n
	rhs(itr) = itr;
end
rhs(n-1) =0;

% actually solve it
% we just left-multply both sides by lhs^-1
x = pinv(lhs) * rhs;	

% keep ourselves honest
assert(lhs * x, rhs, .1);