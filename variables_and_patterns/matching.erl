-module(matching).
-export([xOr1/2, xOr2/2, xOr3/2]).

xOr1(true,B)->
    not(B);
xOr1(false,B)->
    B.

xOr2(A,B)->
    A=/=B.

xOr3(A,B)->
    A or B and A=/=B.