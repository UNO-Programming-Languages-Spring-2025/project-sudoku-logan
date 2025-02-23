% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define domain
num(1..4).
row(1..4).
col(1..4).

% Generate one number per cell
{ sudoku(X,Y,N) : num(N) } = 1 :- row(X), col(Y).

% Row constraint: each number appears exactly once per row
:- row(X), num(N), sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Column constraint: each number appears exactly once per column
:- col(Y), num(N), sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

#show sudoku/3.
