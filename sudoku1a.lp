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

#show sudoku/3.
