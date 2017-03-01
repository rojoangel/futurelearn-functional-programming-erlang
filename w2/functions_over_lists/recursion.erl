-module(recursion).
-export([product/1, tail_product/1, maximum/1, tail_maximum/1]).

% direct recursion
product([]) -> 1;
product([X|Xs]) -> X * product(Xs).

% tail recursion
tail_product(Xs) -> tail_product(Xs, 1).
tail_product([],P) -> P;
tail_product([X|Xs],P)-> tail_product(Xs, X*P).

% direct recursion
maximum([X]) -> X;
maximum([X|Xs]) -> max(X, maximum(Xs)).

% tail recursion
tail_maximum([X|Xs]) -> tail_maximum(Xs, X).
tail_maximum([],Max) -> Max;
tail_maximum([X|Xs], Max) -> tail_maximum(Xs, max(X,Max)).
