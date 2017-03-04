-module(wdib).
-export([taketr/2, take/2]).

% -- take tail recursive
-spec taketr(integer(),[T]) -> [T].
taketr(N,Xs) -> taketr(N,Xs,0,[]). % call to tail recursion implementation
taketr(N,_Xs,N,Acc) -> Acc;
taketr(_N,[],_M,Acc) -> Acc;
taketr(N,[X|Xs],M,Acc) -> taketr(N,Xs,M+1,Acc++[X]).

% -- take direct recursive
-spec take(integer(), [T]) -> [T].
take(_N,[]) -> [];
take(0,_Xs) -> [];
take(N,[X|Xs]) -> [X|take(N-1,Xs)].
