% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define 9x9 grid
num(1..9).
pos(1..9).

% Define 9 subgrids (3x3)
subgrid(1, X, Y) :- pos(X), pos(Y), X <= 3, Y <= 3.
subgrid(2, X, Y) :- pos(X), pos(Y), X <= 3, Y > 3, Y <= 6.
subgrid(3, X, Y) :- pos(X), pos(Y), X <= 3, Y > 6.

subgrid(4, X, Y) :- pos(X), pos(Y), X > 3, X <= 6, Y <= 3.
subgrid(5, X, Y) :- pos(X), pos(Y), X > 3, X <= 6, Y > 3, Y <= 6.
subgrid(6, X, Y) :- pos(X), pos(Y), X > 3, X <= 6, Y > 6.

subgrid(7, X, Y) :- pos(X), pos(Y), X > 6, Y <= 3.
subgrid(8, X, Y) :- pos(X), pos(Y), X > 6, Y > 3, Y <= 6.
subgrid(9, X, Y) :- pos(X), pos(Y), X > 6, Y > 6.

% Each cell contains exactly one number
{ sudoku(X, Y, N) : num(N) } = 1 :- pos(X), pos(Y).

% Each row contains distinct numbers
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

% Each column contains distinct numbers
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

% Each subgrid contains distinct numbers
:- subgrid(G, X1, Y1), subgrid(G, X2, Y2), sudoku(X1, Y1, N), sudoku(X2, Y2, N), (X1, Y1) != (X2, Y2).

% Ensure initial values are respected
sudoku(X, Y, N) :- initial(X, Y, N).

#show sudoku/3.
