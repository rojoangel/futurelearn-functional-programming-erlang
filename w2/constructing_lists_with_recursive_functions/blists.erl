-module(blists).
-export([double/1, evens/1]).

% - double - direct recursion
double([]) -> [];
double([X|Xs]) -> [ 2 * X | double(Xs)].

% - evens - direct recursion
even(N) when (N rem 2) == 0 -> true;
even(_) -> false.

evens([]) -> [];
evens([X|Xs]) -> 
    case even(X) of
        true -> [X|evens(Xs)];
        _ -> evens(Xs)
    end.
