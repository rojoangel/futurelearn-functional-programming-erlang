-module(blists).
-export([double/1, doubletr/1, evens/1, evenstr/1, median/1, modes/1]).

% - double - direct recursion
double([]) -> [];
double([X|Xs]) -> [ 2 * X | double(Xs)].

% - double - tail recursion
doubletr(Xs) -> doubletr(Xs,[]). % call to tail recursive doubletr
doubletr([], Doubles) -> Doubles;
doubletr([X|Xs], Doubles) -> doubletr(Xs, Doubles ++ [2 * X]).

% - even helper function
even(N) when (N rem 2) == 0 -> true;
even(_) -> false.

% - evens - direct recursion
evens([]) -> [];
evens([X|Xs]) -> 
    case even(X) of
        true -> [X|evens(Xs)];
        _ -> evens(Xs)
    end.

% - evens - tail recursion
evenstr(Xs) -> evenstr(Xs,[]). % call to tail recursive evenstr
evenstr([], Evens) -> Evens;
evenstr([X|Xs], Evens) -> 
    case even(X) of
        true -> evenstr(Xs, Evens ++ [X]);
        _    -> evenstr(Xs, Evens)
    end.

% --------
% - median
% --------

% - partition helper function
partition(X,Ys) -> partition(X,Ys,[],[]). % call to tail recursive partition
partition(_,[],Less,Greater) -> {Less, Greater}; % - tail recursive partition
partition(X,[Y|Ys],Less,Greater) -> 
    case Y < X of
        true -> partition(X,Ys,[Y|Less],Greater);
        _    -> partition(X,Ys,Less,[Y|Greater])
    end.

% - sort helper function
sort([]) -> []; % - quicksort
sort([X|Xs]) -> 
    {Less, Greater} = partition(X,Xs),
    sort(Less) ++ [X] ++ sort(Greater).

% - nth helper function
nth([_|_]=Xs,I) -> nth(Xs,I,0). % call to tail recursive nth
nth([X|Xs],I,N) -> 
    case I =:= N of
        true -> X;
        _    -> nth(Xs,I,N+1)
    end.

% - list_length helper function
list_length(Xs) -> list_length(Xs,0). % call to tail recursive length
list_length([],Length) -> Length; % - tail recursive length
list_length([_|Xs],Length) -> list_length(Xs, Length + 1).

% - median
median(Xs) ->
    SortedXs = sort(Xs),
    LengthXs = list_length(Xs),
    MidPositionXs = LengthXs div 2,
    case LengthXs rem 2 of
        0 -> (nth(SortedXs,MidPositionXs-1) + nth(SortedXs,MidPositionXs)) / 2;
        _ -> nth(SortedXs,MidPositionXs)
    end.

% -------
% - modes
% -------

% - count & count_sorted helper function
count(Xs) -> count_sorted(sort(Xs)).

count_sorted([X|Xs]) -> count_sorted(Xs, X, 1, []). % call to tail recursive count_sorted
count_sorted([], CurrentVal , CurrentCount, Counts) -> [{CurrentVal, CurrentCount}|Counts];
count_sorted([X|Xs], X, CurrentCount, Counts) -> count_sorted(Xs, X, CurrentCount + 1, Counts);
count_sorted([X|Xs], Y, CurrentCount, Counts) -> count_sorted(Xs, X, 1, [{Y, CurrentCount}|Counts]).

% - max_counts helper function
max_counts([{Val, Count}|Xs]) -> max_counts(Xs, [Val], Count). % call to tail recursive max_counts
max_counts([], Modes, _MaxCount) -> Modes;
max_counts([{Val, Count}|Xs], Modes, Count) -> max_counts(Xs, [Val|Modes], Count);
max_counts([{Val, Count}|Xs], _Modes, MaxCount) when Count > MaxCount -> max_counts(Xs, [Val], Count);
max_counts([{_Val, _Count}|Xs], Modes, MaxCount) -> max_counts(Xs, Modes, MaxCount).

% - modes
modes(Xs) -> max_counts(count(Xs)).
