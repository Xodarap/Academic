function x=wilkinson(t)
first = (ones(1,20) .* t) - (1:20);
x = prod(first) - (10^-8) * (t^19);
