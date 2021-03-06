function x = conditionExperiment(A)
n = size(A);
[evec,eval] = eig(A' * A);
norms = zeros(n,1);
% calculate the formula designated as aleph in the assignment for each eig vec
for i=1:n
	norms(i) = norm(A * evec(:,i)) / norm(evec(:,i));
end

disp(sprintf('Max norm:  %e', max(norms)));
disp(sprintf('Min norm:  %e', min(norms)));

% We expect max / min == cond
disp(sprintf('Max / Min: %e', max(norms) / min(norms)));
disp(sprintf('Condition: %e', cond(A)));
