-module(recursion).
-export([fib/1, pieces/1]).

fib(0) -> 
    0;
fib(1) ->
    1;
fib(N) when N>1 ->
    fib(N-1) + fib(N-2).

% fib(4)
% fib(3) + fib(2)
% (fib(2) + fib(1)) + (fib (1) + fib(0))
% ((fib(1) + fib(0)) + fib (1)) + (fib(1) + fib(0))
% ((1 + 0) +1) + (1 +0)
% 3

%% from http://www.math.toronto.edu/mccann/assignments/199S/cuttingplanes.pdf
% pieces(0) -> 1;
% pieces(1) -> 2;
% pieces(2) -> 4; 
% pieces(3) -> 7; 
% pieces(4) -> 11;
% pieces(5) -> 16;
% pieces(6) -> 22;

pieces(0) ->
    1;
pieces(N) when N>0 ->
    pieces(N-1) + N.
