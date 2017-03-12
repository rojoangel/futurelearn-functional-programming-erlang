-module(rps).
-export([play/1,echo/1,play_two/3,rock/1,no_repeat/1,const/1,enum/1,cycle/1,rand/1,val/1,least_freq/1,most_freq/1,rand_choice/1,best_sofar/2,tournament/2]).


%
% play one strategy against another, for N moves.
%

play_two(StrategyL,StrategyR,N) ->
    play_two(StrategyL,StrategyR,[],[],N).

% tail recursive loop for play_two/3
% 0 case computes the result of the tournament

% FOR YOU TO DEFINE
% REPLACE THE dummy DEFINITIONS

play_two(_,_,PlaysL,PlaysR,0) ->
   dummy;

play_two(StrategyL,StrategyR,PlaysL,PlaysR,N) ->
   dummy.

%
% interactively play against a strategy, provided as argument.
%

play(Strategy) ->
    io:format("Rock - paper - scissors~n"),
    io:format("Play one of rock, paper, scissors, ...~n"),
    io:format("... r, p, s, stop, followed by '.'~n"),
    play(Strategy,[]).

% tail recursive loop for play/1

play(Strategy,Moves) ->
    {ok,P} = io:read("Play: "),
    Play = expand(P),
    case Play of
	stop ->
	    io:format("Stopped~n");
	_    ->
	    Result = result(Play,Strategy(Moves)),
	    io:format("Result: ~p~n",[Result]),
	    play(Strategy,[Play|Moves])
    end.

%
% auxiliary functions
%

% transform shorthand atoms to expanded form
    
expand(r) -> rock;
expand(p) -> paper;		    
expand(s) -> scissors;
expand(X) -> X.

% result of one set of plays

result(rock,rock) -> draw;
result(rock,paper) -> lose;
result(rock,scissors) -> win;
result(paper,rock) -> win;
result(paper,paper) -> draw;
result(paper,scissors) -> lose;
result(scissors,rock) -> lose;
result(scissors,paper) -> win;
result(scissors,scissors) -> draw.

% result of a tournament

tournament(PlaysL,PlaysR) ->
    lists:sum(
      lists:map(fun outcome/1,
		lists:zipwith(fun result/2,PlaysL,PlaysR))).

outcome(win)  ->  1;
outcome(lose) -> -1;
outcome(draw) ->  0.

% transform 0, 1, 2 to rock, paper, scissors and vice versa.

enum(0) ->
    rock;
enum(1) ->
    paper;
enum(2) ->
    scissors.

val(rock) ->
    0;
val(paper) ->
    1;
val(scissors) ->
    2.

% give the play which the argument beats.

beats(rock) ->
    scissors;
beats(paper) ->
    rock;
beats(scissors) ->
    paper.

%
% strategies.
%
echo([]) ->
     paper;
echo([Last|_]) ->
    Last.

rock(_) ->
    rock.

% No repeat strategy
% This is the expanded version of the strategy
% no_repeat([rock|_]) ->
%     % expect paper or scissors
%     % chosing scissors never loses
%     scissors;
% no_repeat([paper|_]) ->
%     % expect rock or scissors
%     % chosing rock never loses
%     rock;
% no_repeat([scissors|_]) ->
%     % expect rock or paper
%     % chosing paper never loses
%     paper.    
% 
% which happens to be equivalent to return beats(Last)
%
no_repeat([]) ->
    paper;
no_repeat([Last|_]) ->
    Last.    

rand(_) ->
    enum(rand:uniform(3) - 1).

cycle(Moves) ->
    MovesCount = length(Moves),
    enum(MovesCount rem 3).

least_freq(Moves) ->
    [{_Count,Gesture}|_] = lists:sort(frequencies(Moves,[{0,rock},{0,paper},{0,scissors}])),
    Gesture.

most_freq(Moves) ->
    [{_Count,Gesture}|_] = lists:reverse(lists:sort(frequencies(Moves,[{0,rock},{0,paper},{0,scissors}]))),
    Gesture.

% support function for least_freq and most_freq strategies
frequencies([],Frequencies) ->
    Frequencies;
frequencies([Gesture|Moves],Frequencies) ->
    frequencies(Moves,increase_count(Gesture,Frequencies)).

% support function for least_freq and most_freq strategies
increase_count(rock,[{I,rock},{J,paper},{K,scissors}]) ->
    [{I+1,rock},{J,paper},{K,scissors}];
increase_count(paper,[{I,rock},{J,paper},{K,scissors}]) ->
    [{I,rock},{J+1,paper},{K,scissors}];
increase_count(scissors,[{I,rock},{J,paper},{K,scissors}]) ->
    [{I,rock},{J,paper},{K+1,scissors}].

% random strategy choice
rand_choice(Strategies) ->
    Length = length(Strategies),
    lists:nth(rand:uniform(Length), Strategies).

best_sofar(Strategies,Moves) ->
    StrategiesMoves = lists:map(fun (Strategy) -> play_strategy(Strategy,Moves) end,Strategies),
    StrategiesResults = lists:map(fun (StrategyMoves) -> tournament(StrategyMoves, Moves) end,StrategiesMoves),
    [{_Result,Strategy}|_] = lists:reverse(lists:sort(lists:zip(StrategiesResults,Strategies))),
    Strategy.

play_strategy(Strategy,Moves) ->                       % Moves are reverse because latest move is at head
    play_strategy(Strategy,lists:reverse(Moves),[],[]). % call to tail recursive implementation

play_strategy(_Strategy,[],_PrevMoves,Results) ->
    Results;
play_strategy(Strategy,[Move|Moves],PreviousMoves,Results) ->
    play_strategy(Strategy,Moves,[Move|PreviousMoves],[Strategy(PreviousMoves)|Results]).

const(Play) ->
    dummy.
