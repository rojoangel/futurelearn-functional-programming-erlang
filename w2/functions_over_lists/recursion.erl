-module(recursion).
-export([product/1]).

% direct recursion
product([]) -> 1;
product([X|Xs]) -> X * product(Xs).
