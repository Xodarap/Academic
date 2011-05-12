function d = divdif(x,y)
% create divided differences table
% notation of d:
% 	d(x,y) = f[x, ... ,y]
% only the first row is returned
n=length(y);
d = diag(y);  % diagonals = y

for m = 1:n			% m is how far apart i and j are (i.e. what column of the table we're on)
  for i = 1:n-m	% i is the row of the table that we're on. Since the table is only defined for up to n-m, that's how far we go
    j = i+m;		
		% f[i, ..., j] = (f[i+1, ..., j] - f[i, ..., j-1]) / (j - i)
		d(i,j) = (d(i+1,j) - d(i,j-1)) / (x(j) - x(i));
	end
end

d = d(1,:)';  % we only care about the first row

