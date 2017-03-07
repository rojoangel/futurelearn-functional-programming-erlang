-module(hofs).
-export([doubleAll/1,evens/1,product/1,zip/2,zip_with/3,zip_with_2/3]).

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

% - recursive zip
%
% 11> hofs:zip([1,3,5,7], [2,4]).
% [{1,2},{3,4}]

zip([],_Ys) -> [];
zip(_Xs,[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}| zip(Xs,Ys)].

% - recursive zip_with
%
% 14> hofs:zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]).
% [3,7]
% 15> hofs:zip_with(fun(X,Y) -> X*Y end, [1,3,5,7], [2,4]).
% [2,12]

zip_with(_F,[],_Ys) -> [];
zip_with(_F,_Xs,[]) -> [];
zip_with(F,[X|Xs],[Y|Ys]) -> [F(X,Y)|zip_with(F,Xs,Ys)].

% - zip_with_2 in terms of zip and lists:map
%
% 18> hofs:zip_with_2(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]).
% [3,7]
% 19> hofs:zip_with_2(fun(X,Y) -> X*Y end, [1,3,5,7], [2,4]).
% [2,12]

zip_with_2(F,Xs,Ys) ->
    lists:map(fun ({X,Y}) -> F(X,Y) end, zip(Xs,Ys)).
