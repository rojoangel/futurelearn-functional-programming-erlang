-module(wdib).
-export([take/2, taketr/2, taketr2/2]).

% -- take direct recursive
-spec take(integer(), [T]) -> [T].
take(_N,[]) -> [];
take(0,_Xs) -> [];
take(N,[X|Xs]) when N>0-> [X|take(N-1,Xs)].

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
