-module(tail).
-export([fib/1, perfect/1]).

fib(N) ->
    fib(N, 1, 0).    

fib(0, _Cur, Pr) ->
    Pr;
fib(N, Cur, Pr) ->
    fib(N-1, Cur + Pr, Cur).

perfect(1) ->
    true;
perfect(N) when N>1 ->
    perfect(N, 1, 0).

perfect(N, N, Sum) ->
    N == Sum;
perfect(N, Current, Sum) when N rem Current == 0 ->
    perfect(N, Current+1, Current + Sum);
perfect(N, Current, Sum)->
    perfect(N, Current+1, Sum).