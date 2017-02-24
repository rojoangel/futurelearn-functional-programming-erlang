-module(tail).
-export([fib/1, perfect/1]).

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

perfect(1) -> 
    true;
perfect(N) when N>1 ->
    perfect(N, N-1, 0).

perfect(N, 0, Sum) ->
    N == Sum;
perfect(N, Current, Sum) when N rem Current == 0 ->
    perfect(N, Current-1, Current + Sum);
perfect(N, Current, Sum)->
    perfect(N, Current-1, Sum).