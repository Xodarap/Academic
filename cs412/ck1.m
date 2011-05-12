function ck1()
h(1)=1E-2;
TRUEV=.27027;  % you will need to complete this line
disp(sprintf('h\terror'));
for i=2:15
  h(i)=h(i-1)/4;
  %D=(log(3.7+h(i))-log(3.7))/h(i);
  D=(log(3.7+h(i))-log(3.7-h(i)))/(2*h(i));
  error(i)=TRUEV-D;
  disp(sprintf('%e\t%e', h(i), error(i)));
end   
%format long 
% try to remove the long format line to see the difference
% try to organize better the printout, so that the entries of
% h align with the entries of error

%hint: h=(3.7+h)-3.7, therefore D computes the slope
%of "something".


