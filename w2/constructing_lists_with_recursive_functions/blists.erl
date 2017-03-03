-module(blists).
-export([double/1]).

% - double - direct recursion
double([]) -> [];
double([X|Xs]) -> [ 2 * X | double(Xs)].