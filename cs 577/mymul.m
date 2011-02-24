function prod = mymul(x,y)

x = fliplr(x);
y = fliplr(y);
minLength = 2 ^ ceil(log2(length(x) + length(y)));
xval = myfft([x zeros(1, minLength-length(x))]); #fft(x, minLength); #fft([x zeros(1, minLength - length(x))])';
yval = myfft([y zeros(1, minLength - length(y))]);
zval = xval .* yval;
prodvec = ifft(zval);
prod = fliplr(prodvec);
# pows = 0:(length(prodvec)-1);
# base = 10 .^ pows;
# prod = dot(prodvec, base)
