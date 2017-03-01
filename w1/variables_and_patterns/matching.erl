-module(matching).
-export([xOr1/2, xOr2/2, xOr3/2, maxThree/3, howManyEqual/3]).

xOr1(true,B)->
    not(B);
xOr1(false,B)->
    B.

xOr2(A,B)->
    A=/=B.

xOr3(A,B)->
    A or B and A=/=B.
    
maxThree(A,A,A)->
    A;
maxThree(A,A,C)->
    max(A,C);
maxThree(A,B,A)->
    max(A,B);
maxThree(A,B,B)->
    max(A,B);
maxThree(A,B,C)->
    max(A,max(B,C)).

howManyEqual(A,A,A)->
    3;
howManyEqual(A,A,_)->
    2;
howManyEqual(A,_,A)->
    2;
howManyEqual(_,A,A)->
    2;
howManyEqual(_,_,_)->
    0.
