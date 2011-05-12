function a = vandermonde(x,f, errRange)
% variant of vandermonde interpolation demo

n=length(x); 
J=[n-1:-1:0]';
V=zeros(n);
V=x'(:,ones(1,n)).^(J(:,ones(1,n))');
F = zeros(n,1);
for i=1:n
	F(i) = f(x(i));
end

a=V\F;
p=polyval(a,errRange);
Ferr = zeros(length(errRange),1);
for i=1:length(errRange)
	Ferr(i) = f(errRange(i));
end

% plot some results
plot(errRange,p,'-b');
hold on
plot(errRange,Ferr,'*r');
hold off

step = (max(errRange) - min(errRange))/length(errRange);
errTotal = sum(abs(Ferr-p')) * step;

printf('Total error: %f\n',errTotal);


