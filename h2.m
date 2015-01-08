% returns the total manhattan distance between a state and a goal state
function [ numbTiles ] = h2( s, goal )
	 totalDist = 0;
	 for i = 1:9
	     if goal( i ) == 'b'
	     else
	     	for j = 1:9
			if goal( i ) == s( j )
		    		totalDist = totalDist + manDist( j, i );
			end
	     	end
	     end
	 end
	 numbTiles = totalDist;	

% helper function that returns the manhatton distance between two positions
function [ dist ] = manDist( s, goal )
	vertical = abs( ceil( s / 3) - ceil( goal / 3) );
	horizontal = abs( column( s ) - column( goal ) );
	dist = vertical + horizontal;	
end

% helper function that returns which column # the position (ie. val) lies in
function [ colNum ] = column ( val )
	if val == 1 | val == 4 | val == 7
	    colNum = 1;
	elseif val == 2 | val == 5 | val == 8
	    colNum = 2;
	else
	    colNum = 3;
	end
end

end		
