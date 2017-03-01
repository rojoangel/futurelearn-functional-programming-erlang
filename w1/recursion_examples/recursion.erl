-module(recursion).
-export([fib/1, pieces2d/1, pieces3d/1, pieces/2]).

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
% pieces2d(0) -> 1;
% pieces2d(1) -> 2;
% pieces2d(2) -> 4; 
% pieces2d(3) -> 7; 
% pieces2d(4) -> 11;
% pieces2d(5) -> 16;
% pieces2d(6) -> 22;

pieces2d(0) ->
    1;
pieces2d(N) when N>0 ->
    pieces2d(N-1) + N.

%% from http://www.math.toronto.edu/mccann/assignments/199S/cuttingplanes.pdf
% pieces3d(0) -> 1;
% pieces3d(1) -> 2;
% pieces3d(2) -> 4; 
% pieces3d(3) -> 8; 
% pieces3d(4) -> 15;
% pieces3d(5) -> 26;
% pieces3d(6) -> 42;

pieces3d(0) ->
    1;
pieces3d(N) when N>0 ->
    pieces3d(N-1) + pieces2d(N-1).

pieces(0,_) ->
    1;
pieces(N,1)->
    N+1;
pieces(N,D) ->
    pieces(N-1,D) + pieces(N-1,D-1).
