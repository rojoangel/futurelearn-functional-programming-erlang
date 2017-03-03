-module(blists).
-export([double/1, evens/1, median/1]).

% - double - direct recursion
double([]) -> [];
double([X|Xs]) -> [ 2 * X | double(Xs)].

% - evens - direct recursion
even(N) when (N rem 2) == 0 -> true;
even(_) -> false.

evens([]) -> [];
evens([X|Xs]) -> 
    case even(X) of
        true -> [X|evens(Xs)];
        _ -> evens(Xs)
    end.

% - median - direct recursion

partition(X,Ys) -> partition(X,Ys,[],[]). % call to tail recursive partition
partition(_,[],Less,Greater) -> {Less, Greater}; % - tail recursive partition
partition(X,[Y|Ys],Less,Greater) -> 
    case Y < X of
        true -> partition(X,Ys,[Y|Less],Greater);
        _    -> partition(X,Ys,Less,[Y|Greater])
    end.

sort([]) -> []; % - quicksort
sort([X|Xs]) -> 
    {Less, Greater} = partition(X,Xs),
    sort(Less) ++ [X] ++ sort(Greater).

nth([_|_]=Xs,I) -> nth(Xs,I,0). % call to tail recursive nth
nth([X|Xs],I,N) -> 
    case I =:= N of
        true -> X;
        _    -> nth(Xs,I,N+1)
    end.

list_length(Xs) -> list_length(Xs,0). % call to tail recursive length
list_length([],Length) -> Length; % - tail recursive length
list_length([_|Xs],Length) -> list_length(Xs, Length + 1).

median(Xs) ->
    SortedXs = sort(Xs),
    LengthXs = list_length(Xs),
    MidPositionXs = LengthXs div 2,
    case LengthXs rem 2 of
        0 -> (nth(SortedXs,MidPositionXs-1) + nth(SortedXs,MidPositionXs)) / 2;
        _ -> nth(SortedXs,MidPositionXs)
    end.
