% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define a 4x4 grid
num(1..4).

% Ensure that pre-filled numbers remain unchanged
sudoku(X, Y, N) :- initial(X, Y, N).

% Every cell (X,Y) contains exactly one number
{ sudoku(X, Y, N) : num(N) } = 1 :- num(X), num(Y).

% Each row contains distinct numbers
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

% Each column contains distinct numbers
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

% Define subgrid assignment with proper domain constraints
subgrid(X, Y, 1) :- num(X), num(Y), X <= 2, Y <= 2.
subgrid(X, Y, 2) :- num(X), num(Y), X <= 2, Y > 2.
subgrid(X, Y, 3) :- num(X), num(Y), X > 2, Y <= 2.
subgrid(X, Y, 4) :- num(X), num(Y), X > 2, Y > 2.

% Ensure each subgrid contains distinct numbers
:- subgrid(X1, Y1, G), subgrid(X2, Y2, G), sudoku(X1, Y1, N), sudoku(X2, Y2, N), (X1, Y1) != (X2, Y2).

#show sudoku/3.
