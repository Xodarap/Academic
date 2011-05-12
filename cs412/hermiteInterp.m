function vals = hermiteInterp(fn, d1, d2, tointerp)

function vals = hermite(x,y,tointerp)
	d = divdif(x,y);
  vals = y(1)*ones(1, length(tointerp));
  for i = 2:length(x)		% i is the iteration (e.g. if i=2, then we're finding d_1 * (x - x_0))
		thisPiece = d(i);
    for j = 1:i-1		% j loops through (x - x_0) * ... * (x - x_i-1)
      thisPiece = thisPiece .* (tointerp-x(j));
    end
    vals = vals + thisPiece; % keep a running total
  end
end
