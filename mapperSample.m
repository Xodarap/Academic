% Sample of how to use the modified mapper utility
% Entirely copied from the standard mapper tutorial, except for the last few lines where we find the centroid
% and display it
function mapperSample()
% Generate random points in a circle
X = randn(300, 2);
X = X./(sqrt(sum(X.*X,2))*ones(1, 2));
d = L2_distance(X',X',1);
% Color filter is distance from the first point
eccFilter = d(1, :);

filterSamples = 5;
overlapPct = 50;

% Run mapper
[adja, nodeInfo, levelIdx] = mapper(d, eccFilter, 1/filterSamples, overlapPct);

label{1} = sprintf('Dataset Name   : test');
label{2} = sprintf('Filter Samples : %d', filterSamples);
label{3} = sprintf('Overlap Pct    : %0.2f', overlapPct);

ecc = zeros(length(nodeInfo),1);
for i=1:length(nodeInfo)
    ecc(i) = nodeInfo{i}.filter;
    setSize(i) = length(nodeInfo{i}.set);
end

% Find the centroids
extraNodes = findCentroids(X, nodeInfo, [1 2]);

% print out the result
writeDotFile('/tmp/t1.dot', adja, ecc, setSize, label, ' ', 0, extraNodes);
system('neato -Tpng /tmp/t1.dot -o /tmp/t1.png');
% note that imshow doesn't work in octave
%imshow('/tmp/t1.png')

