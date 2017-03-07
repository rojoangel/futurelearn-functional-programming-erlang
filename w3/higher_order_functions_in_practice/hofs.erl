-module(hofs).
-export([doubleAll/1,evens/1,product/1]).

% - double all
%
% 2> hofs:doubleAll([]).
% []
% 3> hofs:doubleAll([1,2,3,4,5,6,7,8,9]).
% [2,4,6,8,10,12,14,16,18]

doubleAll(Xs) -> 
    lists:map(fun (X) -> 2 * X end, Xs).

% - evens
%
% 5> hofs:evens([]).
% []
% 6> hofs:evens([1,2,3,4,5,6,7,8,9]).
% [2,4,6,8]

evens(Xs) -> 
    lists:filter(fun (X) -> X rem 2 == 0 end,Xs).

% - product
%
% 8> hofs:product([]).
% 1
% 9> hofs:product([1,2,3,4,5,6,7,8,9]).
% 362880

product(Xs) ->
    lists:foldr(fun (X,Y) -> X * Y end , 1, Xs).
