function [r adds mults] = myfft(a, w)
mults = 0;
adds = 0;
if nargin < 2
  w = exp(-2 * pi * i / length(a));
end

if ~any(a)
  r = a;
  return;
end

if real(w) == 1
  r = a;
  return;
end

# Note that matlab indexes starting with 1
# So "even" exponents are actually 1, 3, ...
w2 = w ** 2;
mults++;
[s sa sm]  = myfft(a(1:2:end), w2);
[sp spa spm] = myfft(a(2:2:end), w2);
adds += sa + spa;
mults += sm + spm;
n = length(s);
idx = 1:n;
snd = n+1:(2 * n);
r(idx) = s(idx) + (w .^ (idx-1)) .* sp(idx);
r(snd) = s(idx) - (w .^ (idx-1)) .* sp(idx);
adds += 2 * n;
mults += 2 * n;
