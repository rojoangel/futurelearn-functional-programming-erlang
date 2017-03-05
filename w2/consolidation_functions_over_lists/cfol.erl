-module(cfol).
-export([join/2,concat/1,member/2,quicksort/1,insertionsort/1,mergesort/1]).

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

% - quicksort in terms of pivot
-spec quicksort([T]) -> [T].
quicksort([]) -> [];
quicksort([X|Xs]) -> 
    {Smaller,Greater} = pivot(X,Xs),
    quicksort(Smaller) ++ [X] ++ quicksort(Greater).

% - pivot tail recursive
-spec pivot(T,[T]) ->{[T],[T]}.
pivot(X,Xs) -> pivot(X,Xs,[],[]).
pivot(_X,[],Smaller,Greater) -> {Smaller,Greater};
pivot(X,[Y|Xs],Smaller,Greater) -> 
    case Y < X of
        true -> pivot(X,Xs,[Y|Smaller],Greater);
        _    -> pivot(X,Xs,Smaller,[Y|Greater])
    end.

% - insertion sort using direct recursion in terms of insert
-spec insertionsort([T]) -> [T].
insertionsort([]) -> [];
insertionsort([X|Xs]) -> insert(X,insertionsort(Xs)).

% - insert using direct recursion
-spec insert(T,[T]) -> [T].
insert(X,[]) -> [X];
insert(X,[Y|Ys]=Yss) -> 
    case X < Y of
        true -> [X|Yss];
        _    -> [Y|insert(X,Ys)]
    end.
% - merge sort using direct recursion in terms of merge
-spec mergesort([T]) -> [T].
mergesort([]) -> [];
mergesort([X]) -> [X];
mergesort(Xs) -> 
    HalfLength = length(Xs) div 2,
    {Ys,Zs} = lists:split(HalfLength,Xs),
    merge(mergesort(Ys),mergesort(Zs)).

% - merge tail recursive
-spec merge([T],[T]) -> [T].
merge(Xs,Ys) -> merge(Xs,Ys,[]).
merge([],Ys,Acc) -> Acc ++ Ys;
merge(Xs,[],Acc) -> Acc ++ Xs;
merge([X|Xs]=Xss,[Y|Ys]=Yss,Acc) ->
    case X > Y of
        true -> merge(Xss,Ys,Acc++[Y]);
        _    -> merge(Xs,Yss,Acc++[X])
    end.