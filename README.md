# A-Star-Algorithm

This program is run on matlab.

This program runs a 9-tile puzzle solver.
The puzzles are of the form:

1 | 5 | 2
----------
3 | 4 | 6
----------
7 | X | 8
-----------

where X is the empty block. The goal is to slide all of the pieces around to get it to the ordering:

1 | 2 | 3
----------
4 | X | 5
----------
6 | 7 | 8
----------
My solution, using the A* algorithm, finds the shortest path that can be taken by any given occurance of the puzzle to
the goal state.

The A* uses two possible heuristics:

h1: Number of tiles that are out of position.

h2: Manhatton distance. That is, the sum of the number of moves each tile is from its goal-state-position.
For example, the number of moves for the X block to get to its goal state position in the example is 1 (just up one).

h2 is a stronger heuristic because it takes the actual position of the tiles into account, rather than
simple 'is in position' vs 'is NOT in position'.

The output is the optimal path to solve the input puzzle, as well as the length of the path (ie. number of moves), and how
many child nodes were expanded in the process.

Sample input:

[path, pathLen, numbExp] = astar('51263b478', '12345678b', 1)  // == (current state, goal state, heuristic to use (1 or 2) )

Sample Output:

path =

12345678b
1234567b8
123456b78
123b56478
1235b6478
12356b478
12b563478
1b2563478
b12563478
512b63478
5126b3478

pathLen =

    11

numbExp =

    59
