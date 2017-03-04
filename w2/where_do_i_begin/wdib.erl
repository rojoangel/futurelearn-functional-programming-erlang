-module(wdib).
-export([take/2, take2/2, taketr/2, taketr2/2, nub/1, bun/1, nubtr/1, palindrome/1]).

% ----
% take
% ----

% -- take direct recursive
-spec take(integer(), [T]) -> [T].
take(_N,[]) -> [];
take(0,_Xs) -> [];
take(N,[X|Xs]) when N>0-> [X|take(N-1,Xs)].

% -- take using sublist
-spec take2(integer(),[T]) -> [T].
take2(N,Xs) -> lists:sublist(Xs,N).

% -- take tail recursive
-spec taketr(integer(),[T]) -> [T].
taketr(N,Xs) -> taketr(N,Xs,0,[]). % call to tail recursion implementation
taketr(N,_Xs,N,Acc) -> Acc;
taketr(_N,[],_M,Acc) -> Acc;
taketr(N,[X|Xs],M,Acc) -> taketr(N,Xs,M+1,Acc++[X]).

% -- take less convoluted tail recursive
-spec taketr2(integer(),[T]) -> [T].
taketr2(N,Xs) -> taketr2(N,Xs,[]). % call to tail recursion implementation
taketr2(0,_Xs,Acc) -> lists:reverse(Acc);
taketr2(_N,[],Acc) -> lists:reverse(Acc);
taketr2(N,[X|Xs],Acc) -> taketr2(N-1, Xs, [X|Acc]).

% ---
% nub
% ---

% -- nub (keeping the 1st occurrence) as resolved in the classroom - using direct recursion after removing X
-spec nub([T]) -> [T].
nub([]) -> [];
nub([X|Xs]) -> [X|nub(removeAll(X,Xs))].

% - removeAll helper function
-spec removeAll(T,[T]) -> [T].
removeAll(_,[]) -> [];
removeAll(X,[X|Xs]) -> removeAll(X,Xs);
removeAll(X,[Y|Xs]) -> [Y|removeAll(X,Xs)].

% - bun (keeping the 2nd occurrence) as resolved in the classroom - using direct recursion and member
-spec bun([T]) -> [T].
bun([]) -> [];
bun([X|Xs]) -> 
    case lists:member(X,Xs) of
        true -> bun(Xs);
        _    -> [X|bun(Xs)]
    end.

% -- nub (keeping the 1st occurrence) tail recursive
-spec nubtr([T]) -> [T].
nubtr(Xs) -> nubtr(Xs,[]).
nubtr([],Acc) -> lists:reverse(Acc);
nubtr([X|Xs],Acc) ->
    case lists:member(X,Acc) of
        true -> nubtr(Xs,Acc);
        _    -> nubtr(Xs, [X|Acc])
    end.

% ----------
% palindrome
% ----------

% - palindrome using composition
palindrome(Xs) -> palin(nocaps(nopunc(Xs))).

% - palin - literal palindrome
palin(Xs) -> Xs == reverse(Xs).

% - reverse in terms of shunt
reverse(Xs) -> shunt(Xs,[]).

% - shunt using direct recursion
shunt([],Ys) -> Ys;
shunt([X|Xs],Ys) -> shunt(Xs,[X|Ys]).

% - nocaps in terms of nocap
nocaps([]) -> [];
nocaps([X|Xs]) -> [nocap(X)|nocaps(Xs)].

% - nocap - uncapitalizes
nocap(X) -> 
    case $A =< X andalso X =< $Z of
        true -> X + 32;
        _    -> X
    end.

% - nopunc
nopunc([]) -> [];
nopunc([X|Xs]) -> 
    case lists:member(X, ",;.:\t\n \'\"") of
        true -> nopunc(Xs);
        _    -> [X|nopunc(Xs)]
    end.
