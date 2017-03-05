-module(cfol).
-export([join/2]).

% - join in terms of shunt & reverse
-spec join([T],[T]) -> [T].
join(Xs,Ys) -> shunt(reverse(Xs),Ys).

-spec reverse([T]) -> [T].
reverse(Xs) -> shunt(Xs,[]).

-spec shunt([T],[T]) -> [T].
shunt([],Ys) -> Ys;
shunt([X|Xs],Ys) -> shunt(Xs,[X|Ys]).
