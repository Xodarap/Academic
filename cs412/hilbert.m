function h = hilbert(n)
i = 1:n; j=1:n;
for j=1:n
	h(i,j) = 1 ./ (i + j - 1);
end


