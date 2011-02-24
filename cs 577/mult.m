function pr = mult(x, y)
n = length(x);
n2 =  n / 2;

if n == 1
  pr = x(1) * y(1);
  return;
end

al = x(1:n2);
ar = x(n2+1:end);
bl = y(1:n2);
br = y(n2+1:end);

a = mult(al, bl);               
b = mult(al, br);              
c = mult(ar, bl);              
d = mult(ar, br);              
  
pr = (a * (10 ** n)) + (b + c) * (10 ** n2) + d;

function y = odd(x)
y = (floor(x / 2) ~= (x / 2))





