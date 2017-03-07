-module(hofs).
-export([doubleAll/1]).

% - double all
%
% 2> hofs:doubleAll([]).
% []
% 3> hofs:doubleAll([1,2,3,4,5,6,7,8,9]).
% [2,4,6,8,10,12,14,16,18]

doubleAll(Xs) -> 
    lists:map(fun (X) -> 2 * X end, Xs).
