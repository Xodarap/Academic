% writeDotFile(fileName, G, colorParam, sizeParam, extraLabel, nodeLabels)
% writeDotFile   writes a graph represented by a binary adjacency matrix 
%                in the DOT format for use with Graphviz.
% 
% INPUT:
% fileName - string containing location of output file
% G - Adjacency matrix for the UNDIRECED graph
% colorParam - A numNodes x 1 array dictating the color of each node
% sizeParam  - A numNodes x 1 array dictating the size of each node
% extraLabel - A cell array of string labels pasted at the 
%              bottom left of the graph. OPTIONAL
% nodeLabels - A cell array of size numNodes x 1 of label of each node.
%              OPTIONAL
% labelType  - what nodeLabels is:
%		0/null - just a list of labels
%		1 - the ith label specifies labels for those at filter value i
%		2 - Same as 1, but adds the size in parentheses after the label
% extraNodes - A numNodes x n array listing additional information about each node
%
% OUTPUT:
% The graph is written in the graphviz format at the location of fileName
%
%    BEGIN COPYRIGHT NOTICE
%
%    Mapper code -- (c) 2007-2009 Gurjeet Singh
%
%    This code is provided as is, with no guarantees except that 
%    bugs are almost surely present.
%
%    Comments and bug reports are welcome.  Email to 
%    gurjeet@stanford.edu. 
%    I would also appreciate hearing about how you used this code, 
%    improvements that you have made to it, or translations into other
%    languages.    
%
%    You are free to modify, extend or distribute this code, as long 
%    as this copyright notice is included whole and unchanged.  
%
%    END COPYRIGHT NOTICE
%
%    Modifications 2010 Ben West. Ben hereby disclaims all copyright interest in this program.
function writeDotFile(fileName, G, colorParam, sizeParam, extraLabel, nodeLabels, labelType, extraNodes)

nlPresent = 1;
xtraPresent = 1;

if(nargin < 4)
    error('fileName, G, colorParam, sizeParam are required..');
elseif(nargin < 5)
    extraLabel{1} = '';
	xtraPresent = 0;
    nlPresent = 0;
elseif(nargin < 6)
	xtraPresent = 0;
    nlPresent = 0;
elseif(nargin < 8)
	xtraPresent = 0;
end

numNodes = max(size(G));
cparam = colorParam;
sparam = sizeParam;

if(nlPresent == 1 && nargin < 7)
    if(length(nodeLabels) ~= numNodes)
        error('Number of elements in nodeLabels must be equal to the number of nodes.');
    end
end


%% color coordination
figure;
colorMat = colormap();
close;
numColors = length(colorMat);
colx = min(colorParam):(max(colorParam)-min(colorParam))/(numColors - 1):max(colorParam);
rgbColors = interp1(colx, colorMat, colorParam);
hsvColors = rgb2hsv(rgbColors);

%% Size thingy
sizeParam = 0.1 + sizeParam/max(sizeParam);

%% Print the graph to string
str = sprintf('Graph "G" {\n');
for i=1:numNodes

	% If it's a lighter node color, use dark text; else use light text
	if ((hsvColors(i,3)) > 0.95)
		fontcolor='black';
	else
		fontcolor='white';
	end
	
	% Print differently, depending on how they want the labels
    if(nlPresent == 0)
        str = sprintf('%s node%d [label="%d", color="%0.15f %0.15f %0.15f",style=filled, shape=circle, width=%0.2f, fontcolor=%s];\n', str, i, sparam(i), hsvColors(i,1), hsvColors(i,2), hsvColors(i,3), sizeParam(i), fontcolor);
    else
	if (labelType == 0)
		label = int2str(sparam(i));
	elseif(labelType == 1)
		label = nodeLabels{i};
	else
		label = nodeLabels{colorParam(i)};
		if( labelType > 2)
			label = sprintf('%s\\l(%d)', label, sparam(i));
		end
	end
	str = sprintf('%s node%d [label="%s", color="%0.15f %0.15f %0.15f",style=filled, shape=circle, width=%0.2f, fontcolor=%s];\n', str, i, label, hsvColors(i,1), hsvColors(i,2), hsvColors(i,3), sizeParam(i),fontcolor);
    end

	% Print the label nodes, if they want them
	if(xtraPresent == 1)
		label = "";
		for j=1:length(extraNodes(i,:))
			label = sprintf('%s%.2f\\l', label, extraNodes(i,j));
		end
		str = sprintf('%s xtranode%d [label="%s", shape=record]\n', str, i, label);
		str = sprintf('%s xtranode%d -- node%d;\n', str, i, i);
	end
end

for i=1:numNodes
    connNodes = find(G(i,:) == 1);
    G(connNodes, i) = 0;
    for j=1:length(connNodes)
        str = sprintf('%s node%d -- node%d ;\n', str, i, connNodes(j));
    end
end

str = sprintf('%s label = "Filter Range = [%.2f-%.2f]\\lSize Range   = [%.2f-%.2f]\\l',...
	str, min(cparam), max(cparam), min(sparam), max(sparam));
  
for i=1:length(extraLabel)
    str = sprintf('%s%s\\l', str, extraLabel{i});
end
str = sprintf('%s";\n', str);

str = sprintf('%s labelloc="b";\nlabeljust="l";\n', str);

str = sprintf('%s center = 1;\n rankdir=LR;\n overlap=scale;\n', str);

str = sprintf('%s }', str);

%% Save the graph to file
fid = fopen(fileName, 'w');
fprintf(fid, '%s', str);
fclose(fid);
