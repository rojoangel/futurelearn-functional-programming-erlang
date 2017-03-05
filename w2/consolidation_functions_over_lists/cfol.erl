-module(cfol).
-export([join/2,concat/1,member/2]).

% - join in terms of shunt & reverse
-spec join([T],[T]) -> [T].
join(Xs,Ys) -> shunt(reverse(Xs),Ys).

-spec reverse([T]) -> [T].
reverse(Xs) -> shunt(Xs,[]).

-spec shunt([T],[T]) -> [T].
shunt([],Ys) -> Ys;
shunt([X|Xs],Ys) -> shunt(Xs,[X|Ys]).

% - concat - tail recursion
-spec concat([T]) -> [T].
concat(Xs) -> concat(Xs,[]).
concat([],Acc) -> Acc;
concat([X|Xs],Acc) -> concat(Xs,join(Acc,X)).

% - member - direct recursion
-spec member(T,[T]) -> boolean().
member(_X,[]) -> false;
member(X,[X|_Xs]) -> true;
member(X,[_Y|Xs]) -> member(X,Xs).
