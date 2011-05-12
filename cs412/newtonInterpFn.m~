function newtonInterpFn
x = [1 2 3 4];
y = [1 4 9 16];
tointerp = 1.5;
d = divdif(x,y);
d
v = newtVal(tointerp, x, d, 3)


function v = newtVal(z,x,d,i)
if i == 1
	v = d(1);
else
	v = newtVal(z,x,d,i-1) + d(i+1) * basis(z,x,i);
end

function v = basis(z,x,i)
if i == 1
	v = 1;
else
	v = basis(z,x,i-1) * (z - x(i-1));
end


