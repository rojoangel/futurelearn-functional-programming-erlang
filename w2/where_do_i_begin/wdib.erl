-module(wdib).
-export([take/2]).

% -- take tail recursive
take(N,Xs) -> take(N,Xs,0,[]). % call to tail recursion implementation
take(N,_Xs,N,Acc) -> Acc;
take(_N,[],_M,Acc) -> Acc;
take(N,[X|Xs],M,Acc) -> take(N,Xs,M+1,Acc++[X]).