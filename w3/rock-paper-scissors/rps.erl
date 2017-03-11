-module(rps).
-export([beat/1,lose/1,result/2,tournament/2]).

beat(rock) -> paper;
beat(paper) -> scissor;
beat(scissor) -> rock.

lose(rock) -> scissor;
lose(scissor) -> paper;
lose(paper) -> rock.

result(_X,_X) -> draw;
result(X,Y) -> 
    case beat(X) of
        Y -> lose;
        _ -> win
    end.

outcome(win) -> -1;
outcome(lose) -> 1;
outcome(draw) -> 0.

tournament(P1Gestures,P2Gestures) ->
    lists:sum(
        lists:map(
            fun outcome/1,
        lists:zipwith(fun result/2,P1Gestures,P2Gestures))).
