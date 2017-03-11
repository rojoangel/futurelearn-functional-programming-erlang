-module(rps).
-export([beat/1,lose/1,result/2]).

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