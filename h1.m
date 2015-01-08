% function h1 takes in a state and a goal and the result is the number of tiles that are
% out of position

function [ numbTiles ] = h1( s, goal )
	counter = 0;
	for i=1:9
	    if goal( i ) == 'b'
	    elseif ~( s( i ) == goal( i ) )
		counter = counter + 1;
	    end
	end
	numbTiles = counter;	
end  
