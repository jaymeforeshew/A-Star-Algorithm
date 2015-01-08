function [path, pathLen, numbExp] = astar( state, goal, hrstc )
% g(n) = moves so far
% h(n) = h1 or h2, depending on hrstc

availableStates = [];	% open list of structures
numVisited = 0;	% number of states visited (to be kept at <= 2000)
	
parentState.state = state;
parentState.g = 0;
if hrstc == 2
    parentState.h = h2( parentState.state, goal );
else 
    parentState.h = h1( parentState.state, goal );
end
parentState.f = parentState.g + parentState.h;
parentState.path = [];
availableStates = [ availableStates parentState ];	

while ~(isempty(availableStates))
    if numVisited >= 2000
	'No solution exists: CUTOFF exceeded!'
	path = [];
	pathLen = 0;
	numbExp = numVisited;
	break;
    end

	% find node with lowest f(n)
	minIndex = find( min( [ availableStates.f ] ) == [ availableStates.f ] );
	minIndex = minIndex( 1 );
	parentState = availableStates( minIndex );
	    
	% if state == goal, success
	if parentState.state == goal
		path = [ parentState.state ; parentState.path ];
		pathLen = size( path );
		pathLen = pathLen(1);
		numbExp = numVisited;
		break; % we found the goal state
	end
	     
	% generate neighbours 
	myNeighbours = neighbour( parentState.state );
	neighbourSize = size( myNeighbours );
	numVisited = numVisited + 1; 
	% add new neighbours to list of available states 
	for i = 1: neighbourSize(1)
		childState.state = myNeighbours( i:i, 1:9 ); 
		childState.g = parentState.g + 1;
		if hrstc == 2
		    childState.h = h2( childState.state, goal );
		else
		    childState.h = h1( childState.state, goal );
		end
		childState.f = childState.g + childState.h;
		if numVisited == 1
		    childState.path = [];
		else
		    childState.path = [ parentState.state ; parentState.path ];
		end
		availableStates = [ availableStates  childState ];   
	end
	% remove current node from availableStates
	availableStates( minIndex ) = [];
end  

end
