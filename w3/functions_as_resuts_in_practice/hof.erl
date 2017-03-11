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

twice(F) ->
    compose(F,F).

iterate(0) ->
    dummy;
iterate(N) ->
    dummy.
      
	     

