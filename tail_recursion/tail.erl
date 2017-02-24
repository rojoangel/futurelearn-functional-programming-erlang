-module(tail).
-export([fib/1]).

fib(0) ->
    0;
fib(1) ->
    1;
fib(N) when N>1 ->
    fib(N-2, 1, 0).    

fib(0, PR, PRPR) ->
    PR + PRPR;
fib(N, PR, PRPR) ->
    fib(N-1, PR + PRPR, PR).