-module(hof).
-export([add/1,times/1,compose/2,id/1,compose_all/1,twice/1,iterate/1]).

add(X) ->
    fun(Y) -> X+Y end.

times(X) ->
    fun(Y) ->
	     X*Y end.

compose(F,G) ->
    fun(X) -> G(F(X)) end.

id(X) ->
    X.

% 38> MultAndAdd = hof:compose_all([fun(X) -> 2 + X end,fun(X) -> 2 * X end]).
% #Fun<hof.2.34271578>
% 39> MultAndAdd(12).
% 28
% 40> Identity = hof:compose_all([]).
% #Fun<hof.4.34271578>
% 41> Identity(12).
% 12
% 42> Nothing = hof:compose_all([fun (X) -> X*2 end, fun(X) -> X div 2 end]).
% #Fun<hof.2.34271578>
% 43> Nothing(12).
% 12
% 44> MultDivAdd = hof:compose_all([fun (X) -> X*2 end, fun (X) -> X div 2 end, fun (X) -> X + 2 end]).
% #Fun<hof.2.34271578>
% 45> MultDivAdd(12).
% 14
compose_all(Xs) ->
    lists:foldr(fun compose/2,fun id/1, Xs).

% 47> TwiceBy3 = hof:twice(fun (X) -> 3*X end).
% #Fun<hof.2.30422063>
% 48> TwiceBy3(2).
% 18
% 49> FourTimesBy3 = hof:twice(hof:twice(fun (X) -> 3 * X end)).
% #Fun<hof.2.30422063>
% 50> FourTimesBy3(2).
% 162
twice(F) ->
    compose(F,F).

% 55> ((hof:iterate(0)) (fun (X) -> 2*X end)) (19).
% 19
% 56> ((hof:iterate(1)) (fun (X) -> 2*X end)) (19).
% 38
% 57> ((hof:iterate(2)) (fun (X) -> 2*X end)) (19).
% 76
% 58> ((hof:iterate(3)) (fun (X) -> 2*X end)) (19).
% 152
iterate(N) ->
    fun (F) ->
        iterate(N,F,fun id/1)
    end.

iterate(0,_F,Acc) ->
        Acc;
iterate(N,F,Acc) ->
iterate(N-1,F,compose(F,Acc)).
